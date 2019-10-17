

Tool.example("二叉搜索") {
    let array = [1, 5, 15, 17, 19, 22, 24, 31, 105, 150]

    let search31 = array.firstIndex(of: 31)
    let binarySearch31 = array.binarySearch(for: 31)

    print("index(of:): \(String(describing: search31))")
    print("binarySearch(for:): \(String(describing: binarySearch31))")
}

Tool.example("二进制查找相同的元素位置") {
    let array = [1, 2, 3, 3, 3, 3, 4, 5, 5]
    if let indices = BinarySearchPractise.findIndices(of: 3, in: array) {
      indices.forEach { print("indices --- \($0)") }
    }
    
    if let indices_2 = BinarySearchPractise.findIndices_2(of: 3, in: array) {
      indices_2.forEach { print("findIndices_2 --- \($0)") }
    }
    
}
