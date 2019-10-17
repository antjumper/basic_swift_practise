import Foundation

// max heap 特性
// 父节点必须大于等于所有的子节点
// 是一个完全二叉树

// min heap
// 父节点必须小于等于所有的子节点
// 是一个完全二叉树

// Heap 的应用
// 计算最大或者最小值
// heap sort 堆排序
// 构建一个优先队列
//  用一个优先级构建图算法 例如Prim‘s or Dijkstra’s

Tool.example("堆测试") {
    Heap<Int>.heapTest()
}
