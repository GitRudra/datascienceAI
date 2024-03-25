import random as rand


def addition(*nums):
    total = 0
    for num in nums:
        total += num
    return total


def subtract(*nums):
    total = 0
    if (nums):
        total = nums[0]
    for i in range(1, len(nums)):
        total -= nums[i]
    return total


def multiplication(*nums):
    total = 1
    for num in nums:
        total *= num
    return total


def division(*nums):
    total = 0
    if (nums):
        total = nums[0]
    for i in range(1, len(nums)):
        total /= nums[i]
    return total

# 16. Using range(), create a list with numbers ranging from 5-100, and the number of elements
# should be exactly 19.


def generate_number(start, end, count) -> list:
    result = []
    for n in range(1, count+1):
        result.append(rand.randrange(start, end))
    return result


def traverse_array_reverse_direction(numbers: list, start: int, end: int) -> list:
    if (len(numbers) < start):
        return []
    return numbers[start:end]
