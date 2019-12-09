import Foundation

public class TwoSum_Solution {
    
    
   static public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        for i in 0..<nums.count {
            let rest_num = target - nums[i];
            for j in i+1..<nums.count {
                if rest_num == nums[j]{
                    return [i,j]
                }
            }
        }
        return []
    }
    
    /*
     两数的和  2:
     形成的字典是：[2: 1, 4: 2, 3: 0]
     rest 数字是：3
     */
    static public func twoSum_2(nums:[Int],target:Int) -> [Int] {
        
        var sourceDic:[Int:Int] = [Int:Int]()
        for (index,item) in nums.enumerated() {
            sourceDic[item] = index
        }
        print("形成的字典是：\(sourceDic)")
        for i in 0..<nums.count {
            let rest = target - nums[i]
            print("rest 数字是：\(rest)")
            if let index = sourceDic[rest],index != i {
                
                print("index:\(index)")

                return [i,index]
            }else{
                print("sourceDic[rest]  没有值")
            }
        }
        
        return []
        
        
    }
}
