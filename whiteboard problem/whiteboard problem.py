# Given a 32-bit signed integer, reverse digits of an integer.
# Example 1:
# Input: 123
# Output: 321
# Example 2:
# Input: -123
# Output: -321
# Example 3:
# Input: 120
# Output: 21

def reverse_dig(num):
    answer = 0
    t = 1
    if num < 0:
        t = -1 
        num *= t
    while(num > 0):
        remainder = num % 10
        answer = (answer * 10) + remainder
        num = num//10
    return answer * t


print(reverse_dig(123))
print(reverse_dig(-123))
print(reverse_dig(120))