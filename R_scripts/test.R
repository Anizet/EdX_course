library(dslabs)
data("heights")
heights

class(heights)
class(heights$sex)
class(heights$height)

heights$height[777]
heights[1, 777]
heights[777, 1]

max(heights$height)
which.min(heights$height)

mean(heights$height)
median(heights$height)

mean(heights$sex == "Male")
sum(heights$height > 78)
sum(heights$sex == "Female" & heights$height > 78)
