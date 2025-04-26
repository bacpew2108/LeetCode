class Solution:
    def reverse(self, x: int) -> int:
        signed = 1
        if(x<0): signed = -1
        x = abs(x)
        result = 0
        while x != 0:
            result = result*10 + x%10
            x //= 10
        result *= signed
        if (result >= -2**31 and result <= 2**31 - 1):
            return result 
        else:
            return 0