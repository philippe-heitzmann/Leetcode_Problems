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


#146. LRU Cache - Medium 

from collections import OrderedDict 

class LRUCache(OrderedDict):

    def __init__(self, capacity: int):

        self.capacity = capacity

    def get(self, key: int) -> int:
        
        if key not in self:
            return -1
        
        self.move_to_end(key)
        
        return self[key]
            
    def put(self, key: int, value: int) -> None:
        
        if key in self:
            self.move_to_end(key)
            
        self[key] = value
        
        if len(self) > self.capacity:
            self.popitem(last = False)

# 70. Climbing Stairs - Easy

class Solution:
    def climbStairs(self, n: int) -> int:
        
        if n <= 2:
            return n
            
        newlist = [0] * n
        
        newlist[0] = 1
        newlist[1] = 2
        
        for g in range(2,n):
            newlist[g] = newlist[g-2] + newlist[g-1]
            
        return newlist[n-1]

#395. Longest Substring with At Least K Repeating Characters

from collections import Counter 

class Solution:
    def longestSubstring(self, s,k):
    
        newCounter = Counter(s)
        
        for j in newCounter.items():
            if j[1] < k:
                s1, s2 = s.split(j[0],1)
                return max(self.longestSubstring(s1, k), self.longestSubstring(s2, k))
            else:
                continue
        
        return len(s)

#1470. Shuffle the Array - Easy

    def shuffle(self, nums: List[int], n: int) -> List[int]:
        
        s1, s2 = nums[:n], nums[n:]
        
        answer = []
        
        for x in range(n):
            answer.append(s1[x])
            answer.append(s2[x])
            
        return answer


#1672. Richest Customer Wealth

import numpy as np 

class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        return max([np.sum(x) for x in accounts])
        
#1689. Partitioning Into Minimum Number Of Deci-Binary Numbers - Medium 

class Solution:
    def minPartitions(self, n: str) -> int:
        return max([x for x in n])

#1570. Dot Product of Two Sparse Vectors - Medium

import numpy as np 

class SparseVector:
    def __init__(self, nums: List[int]):
        self.v = nums

    # Return the dotProduct of two sparse vectors
    def dotProduct(self, vec: 'SparseVector') -> int:
        
        return max(np.sum([self.v[x] * vec.v[x] for x in range(len(vec.v))]),0)

807. Max Increase to Keep City Skyline - Medium

class Solution:
    def maxIncreaseKeepingSkyline(self, grid: List[List[int]]) -> int:
        
        row_max = [max(row) for row in grid]
        col_max = [max(col) for col in zip(*grid)]

        return sum(min(row_max[r], col_max[c]) - val
                   for r, row in enumerate(grid)
                   for c, val in enumerate(row))

#1282. Group the People Given the Group Size They Belong To - Medium        
        
class Solution:
    def groupThePeople(self, groupSizes):
        index_count_map = dict()
        for idx, ele in enumerate(groupSizes):
            if ele in index_count_map:
                index_count_map[ele].append(idx)
            else:
                index_count_map[ele] = [idx]
        list_of_groups = []
        for key, val in index_count_map.items():
            list_of_groups += zip(*[iter(val)] * key)
        return list_of_groups
    
1678. Goal Parser Interpretation - Easy

    def interpret(self, command: str) -> str:
        
        output = ''
        
        for idx, g in enumerate(command):
            if g == 'G':
                output += 'G'
            elif g == '(' and command[idx+1] == ')':
                output += 'o'
            elif g == '(' and command[idx+1] == 'a':
                output += 'al'
            else:
                continue
        
        return output 
