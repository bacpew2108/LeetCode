class Solution:
    def convert(self, s: str, numRows: int) -> str:
        n = numRows
        result = []
        if n < 2:
            return s
        for i in range(n):
            step = (n-1)*2
            if (i == 0 or i == n-1):
                result.append(s[i::step])
            else:
                j = i
                nextStep = (n-i-1)*2
                c = 1
                while j < len(s):
                    result.append(s[j])
                    if c == 1: 
                        j = j + nextStep
                    elif c == 0:
                        j = j + step - nextStep
                    c = 1 - c
        result = ''.join(result)
        return result