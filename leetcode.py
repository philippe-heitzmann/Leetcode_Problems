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

#387. First Unique Character in string

from collections import Counter

class Solution:
    def firstUniqChar(self, s: str) -> int:
        c = Counter(s)
        for k,v in c.items():
            if v == 1:
                return s.index(k)
            continue
        return -1
                   
