#This is a test file

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
            
