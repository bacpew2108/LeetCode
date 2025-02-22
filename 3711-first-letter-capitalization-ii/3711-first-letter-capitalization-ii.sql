with recursive 
    sub(id, text, length) as (
        select content_id, content_text, length(content_text) 
        from user_content
    ),
    char_table as (
        select id, text,length , 1 as text_index, substring(text, 1, 1) as c
        from sub
        union all
        select id, text,length, text_index + 1, substring(text, text_index + 1, 1) as c
        from char_table
        where text_index + 1 <= length
    ),
    sub2 as (
        select id, text_index, text, c, lag(c, 1, ' ') over (PARTITION BY id order by text_index) as prv_c
        from char_table
    ),
    sub3 as (
        select id, text_index, text, prv_c, c, 
        case
            when (prv_c = ' ' or prv_c = '-') and (c between 'a' and 'z') then upper(c)
            when (prv_c between 'A' and 'Z') and (c between 'a' and 'z') then lower(c)
            else c
        end as next_char
        from sub2
    )
select id as content_id, text as original_text, group_concat(next_char order by text_index separator '') as converted_text
from sub3
group by id;