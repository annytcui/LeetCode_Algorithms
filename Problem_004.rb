# There are two sorted arrays nums1 and nums2 of size m and n respectively. Find the median of the two sorted arrays. The overall run time complexity should be O(log(m+n)). You may assume nums1 and nums2 cannot be both empty.

def find_median_sorted_arrays(nums1, nums2)
  m, n = nums1.length, nums2.length
  if m > n
    m, n, nums1, nums2 = n, m, nums2, nums1
  end
  return nil if n == 0

  a, b, h = 0, m, (m + n + 1) / 2
  while a <= b
    i = (a + b) / 2
    j = h - i

    if i < m && nums2[j-1] > nums1[i]
      a = i + 1
    elsif i > 0 && nums1[i-1] > nums2[j]
      b = i - 1
    else
      max_left =
        if i == 0
          nums2[j-1]
        elsif j == 0
          nums1[i-1]
        else
          [nums1[i-1], nums2[j-1]].max
        end

      return max_left if (m + n) % 2 != 0

      min_right =
        if i == m
          nums2[j]
        elsif j == n
          nums1[i]
        else
          [nums1[i], nums2[j]].min
        end

      return (max_left + min_right) / 2.0
    end
  end
end
