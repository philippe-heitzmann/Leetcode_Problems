#169. Majority Element - Easy Problem

class Solution:
    def majorityElement(self, nums: List[int]) -> int:
        set1 = set(nums)
        if len(nums) == 1:
            return nums[0]
        for x in set1:
            if nums.count(x) > len(nums) / 2:
                return x
            continue

#387. First Unique Character in string - Easy

from collections import Counter

class Solution:
    def firstUniqChar(self, s: str) -> int:
        c = Counter(s)
        for k,v in c.items():
            if v == 1:
                return s.index(k)
            continue
        return -1

#202. Happy Number - Easy

def isHappy(n):

    def get_next(n):
        total_sum = 0
        while n > 0:
            n, digit = divmod(n, 10)
            total_sum += digit ** 2
            print(total_sum)
        return total_sum
    
    #use a set because accessing values in sets takes O(1) time 
    seen = set()
    while n != 1 and n not in seen:
        seen.add(n)
        print(seen)
        n = get_next(n)

    return n == 1

#O(logN) time complexity
                  
#125. Valid Palindrome - Easy
#O(n) time complexity because we have to (i) strip non-alphanumeric chars from the string 
# (ii) convert string to lowercase 
# (iii) reverse the string 
# (iv) compare the new reversed string to the old string 

class Solution:
    def isPalindrome(self, s: str) -> bool:
        no_punc_str = re.sub('[^A-Za-z0-9]+', "", s).lower()
        if s == '':
            return True
        elif no_punc_str[::-1] == no_punc_str:
            return True
        return False

#346. Moving Average from Data Stream - Easy

from collections import deque
import numpy as np

class MovingAverage:

    def __init__(self, size: int):
        """
        Initialize your data structure here.
        """
        self.mAve = deque(maxlen = size)
        

    def next(self, val: int) -> float:
        self.mAve.append(val)
        return np.mean(self.mAve)


# Your MovingAverage object will be instantiated and called as such:
# obj = MovingAverage(size)
# param_1 = obj.next(val) 
