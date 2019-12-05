import UIKit


 var nums = [3, 2,4]
 var target = 6
Tool.example("两数的和  1") {
   let result = TwoSum_Solution.twoSum(nums, target)
    print(result)
}


Tool.example("两数的和  2") {
   let result = TwoSum_Solution.twoSum_2(nums: nums, target: target)
    print(result)
}
