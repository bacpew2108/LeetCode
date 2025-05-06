class Solution:
    def intToRoman(self, num: int) -> str:
        dict_value = {1:"I", 5:"V", 10:"X", 50:"L", 100:"C", 500:"D", 1000:"M"}
        i = 0
        res = []
        while(num):
            temp = num%10 * 10**i
            num//=10
            x = 10**i
            temp_list = []
            if (temp >= 0*x and temp < 4*x):
                while(temp):
                    temp_list.insert(0, dict_value[x])
                    temp-=x
                res.extend(temp_list)
                i+=1
                continue
            if (temp >= 5*x and temp < 9*x):
                temp_list.append(dict_value[5*x])
                temp -= (5*x)
                while(temp):
                    temp_list.insert(0, dict_value[x])
                    temp-=x
                res.extend(temp_list)
                i+=1
                continue
            if (temp == 4*x):
                temp_list.append(dict_value[5*x])
                temp_list.append(dict_value[x])
                res.extend(temp_list)
                i+=1
                continue
            if (temp == 9*x):
                temp_list.append(dict_value[10*x])
                temp_list.append(dict_value[x])
                res.extend(temp_list)
                i+=1
                continue
        res.reverse()
        result = "".join(res)
        return result