class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        matching_nums = {}
        for index, num in enumerate(nums):
            diff = target - num
            if diff in matching_nums:
                    return matching_nums[diff], index
            matching_nums[num] = nums.index(num)
