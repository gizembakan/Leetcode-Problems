class Solution(object):
    def isPalindrome(self, x):
        """
        :type x: int
        :rtype: bool
        """
        x_str = str(x)
        def isPal(x_str):
            if len(x_str) <= 1:
                return True
            else:
                return x_str[0] == x_str[-1] and isPal(x_str[1:-1])
        return isPal(x_str)
