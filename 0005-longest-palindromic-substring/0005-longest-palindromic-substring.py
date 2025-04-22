class Solution:
    def longestPalindrome(self, s: str) -> str:
        ket_qua = ""        # Lưu xâu đối xứng dài nhất tìm được
        do_dai_max = 0      # Độ dài của xâu đối xứng dài nhất

        for i in range(len(s)):
            # --- Trường hợp xâu đối xứng độ dài lẻ ---
            trai, phai = i, i
            while trai >= 0 and phai < len(s) and s[trai] == s[phai]:
                if (phai - trai + 1) > do_dai_max:
                    ket_qua = s[trai:phai + 1]
                    do_dai_max = phai - trai + 1
                trai -= 1
                phai += 1

            # --- Trường hợp xâu đối xứng độ dài chẵn ---
            trai, phai = i, i + 1
            while trai >= 0 and phai < len(s) and s[trai] == s[phai]:
                if (phai - trai + 1) > do_dai_max:
                    ket_qua = s[trai:phai + 1]
                    do_dai_max = phai - trai + 1
                trai -= 1
                phai += 1

        return ket_qua
