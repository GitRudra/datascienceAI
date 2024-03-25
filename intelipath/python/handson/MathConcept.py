from math import sqrt


def greatest(*nums):
    max_num = nums[0]
    for i in range(1, len(nums)):
        if (nums[i] > max_num):
            max_num = nums[i]
    return max_num


def armstrong(num):
    digits = []
    local = int(num)
    while (local > 0):
        digits.append(local % 10)
        local = local // 10
    check_armstrong = 0
    print(digits)
    for adigit in digits:
        check_armstrong += adigit**3
        # print(adigit, '->', check_armstrong)
    return num == check_armstrong


def armstrong1(num):
    # digits = []
    # local = int(num)
    str_num = str(num)
    # print(digits)
    total = 0
    for anum in str_num:
        total += int(anum)**3
        # print(adigit, '->', check_armstrong)
    return num == total


def is_prime(num):
    if (num <= 1):
        return False
    for i in range(2, int(sqrt(num))):
        if num % i == 0:
            return False
    return True
