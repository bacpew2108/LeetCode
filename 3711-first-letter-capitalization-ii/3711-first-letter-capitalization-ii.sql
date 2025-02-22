WITH RECURSIVE 
    sub(id, text, length) AS (
    select content_id, content_text, length(content_text)
    from user_content
    ),
    table_char as (
        select id,1 as text_index, substring(text,1,1) as c, text, length
        from sub
        UNION ALL
        select id, text_index + 1, substring(text,text_index + 1, 1), text, length
        from table_char
        where text_index + 1 <= length
    ),
    sub2 as (
        select id, text_index, c, text, length, lag(c, 1, ' ') over (partition by id order by text_index) as prv_c
        from table_char
    ),
    sub3 as (
        select id, text, text_index, prv_c, c,
        case 
            when (prv_c = ' ' or prv_c = '-') and (c >='a' and c <= 'z') then upper(c)
            when (prv_c >= 'a' and prv_c <= 'z') and (c >='a' and c <= 'z') then lower(c)
            else c
        end as next_c 
        from sub2
    )
select id as content_id, text as original_text, group_concat(next_c order by text_index SEPARATOR '') as converted_text
from sub3
group by id;