# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# def my_min(list)

#     list.each do |ele1|
#         return ele1 if list.all? {|ele2| ele1 <= ele2 }     
#     end 

# end

def my_min(list)
    min = list.first
    list.each do |ele|
        min = ele if ele < min
    end
    min
end

# p my_min(list)

# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

# Phase II
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?

# list = [5, 3, -7]

def largest_contiguous_subsum(list)
    subs = []
    (0...list.length).each do |start|
        (start...list.length).each do |fin|
            subs << list[start..fin]
        end
    end # O(n^2)

    subs.map(&:sum).max #O(n^2)  * o(n) = o(n^3) (multiplied because it's dependent on subs)
end # O(n^2) + O(n) => O(n^2)

def largest_contiguous_subsum(list)
    biggest_sum = list.first 
    sum_so_far = 0
    list.each do |ele|
        if sum_so_far.positive? 
            sum_so_far += ele
        else 
            sum_so_far = ele
        end
        
        if sum_so_far > biggest_sum
            biggest_sum = sum_so_far
        end
    end
    biggest_sum
end     
# list = [2, 3, -6, 7, -6, 7,6,8, -12, 4, 6]
# list = [7,-3,14]
# p largest_contiguous_subsum(list)

# Phase I
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.

# Discuss the time complexity of this solution.

# Phase II
# Let's make a better version. Write a new function using O(n) time with O(1) memory. Keep a running tally of the largest sum. To accomplish this efficient space complexity, consider using two variables. One variable should track the largest sum so far and another to track the current sum. We'll leave the rest to you.

# Get your story straight, and then explain your solution's time complexity to your TA.


#### ANAGRAMS #########



def first_anagram?(str1, str2)
    perms = str1.chars.permutation.to_a #o(n!)
    perms.include?(str2.split(""))
    # 2 * n!
end

def second_anagram?(str1, str2)
    str1.each_char.with_index do |char, i|
        i2 = str2.split('').find_index(char)
        return false if i2 == nil
        str2[i2] = ''
    end

    str2.empty?
end


# p first_anagram?("gizmo", "sally")
# p second_anagram?("gizmo", "sally")

# p first_anagram?("elvis", "lives")
# p second_anagram?("elvis", "lives")

# Phase I:
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.

# Hints:

# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?

def third_anagram?(str1, str2)
    alpha = ('a'..'z').to_a
    sorted_str1 = quick_sort(str1.chars) {|a,b| alpha.index(a) <=> alpha.index(b) }
    sorted_str2 = quick_sort(str2.chars) {|a,b| alpha.index(a) <=> alpha.index(b) }
    sorted_str1 == sorted_str2 #O(n)
end

def quick_sort(arr, &prc)
    return arr if arr.length < 2
    
    pivot = arr.first
    left, right = [], []
    arr.drop(1).each do |ele|
        if prc.call(ele,pivot) == -1
            left << ele
        else
            right << ele
        end
    end

    sorted_l = quick_sort(left, &prc)
    sorted_r = quick_sort(right, &prc)

    sorted_l + [pivot] + sorted_r
end

def fourth_anagram?(str1, str2)
    counts = Hash.new(0)
    str1.each_char do |char|
        counts[char] += 1
    end
    str2.each_char do |char|
        counts[char] -= 1
    end

    counts.values.all? {|v| v==0}  #n = number of unique chars in str1 and str2
end
# p first_anagram?("gizmo", "sally")
# p second_anagram?("gizmo", "sally")

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")

# Phase II:
# Write a method #second_anagram? that iterates over the first string. For each letter in the first string, find the index of that letter in the second string (hint: use Array#find_index) and delete at that index. The two strings are anagrams if an index is found for every letter and the second string is empty at the end of the iteration.

# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??

# Phase III:
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.

# What is the time complexity of this solution? Is it better or worse than #second_anagram??

# Phase IV:
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.

# What is the time complexity?

# Bonus: Do it with only one hash.

# Discuss the time complexity of your solutions together

# def bad_two_sum?

# end

def okay_two_sum?(arr, target)
    left = arr.first
    target = target - left
    bsearch(arr,target,)

end
target -> 0
[-5,    -3,1,3,4,7,8,9,10,1]




def bsearch(arr,target,start, fin)
    
    return fin if fin < start
    mid = (start + fin) / 2

    case target <==> arr[mid]
    when 0
        return mid 
    when 1
        return bsearch(arr, target, mid+1, fin)
    when -1 
        return bsearch(arr, target, start, mid-1)
    end

end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10