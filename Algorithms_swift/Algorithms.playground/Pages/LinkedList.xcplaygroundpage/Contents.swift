//: [Previous](@previous)

import Foundation

Tool.example("创建链表") {
    let node1 = Node(value:1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    node1.next = node2
    node2.next = node3
    
    print(node1)
    
}

Tool.example("链表push操作") {
    var linkedList = LinkList<Int>()
    linkedList.push(1)
    linkedList.push(2)
    linkedList.push(3)
    print(linkedList)
    
}

Tool.example("链表append操作") {
    var linkedList = LinkList<Int>()
    linkedList.append(1)
    linkedList.append(2)
    linkedList.append(3)
    print(linkedList)
    
}


Tool.example("链表Insert操作") {
    var linkedList = LinkList<Int>()
    linkedList.append(1)
    linkedList.append(2)
    linkedList.append(3)
    
    print("插入前：\(linkedList)")
    var middlenNode = linkedList.node(at: 1)!
    for _ in 1...4 {
        middlenNode = linkedList.insert(after: middlenNode, value: 0)
    }
    print("插入s后：\(linkedList)")

}

Tool.example("链表pop操作") {
    var linkedList = LinkList<Int>()
    linkedList.append(1)
    linkedList.append(2)
    linkedList.append(3)
    
    print("pop前：\(linkedList)")
    let value = linkedList.pop()
    print("pops后：\(linkedList) - pop value:"+String(describing: value))

}


Tool.example("链表removeLast操作") {
    var linkedList = LinkList<Int>()
    linkedList.append(1)
    linkedList.append(2)
    linkedList.append(3)
    
    print("removeLast前：\(linkedList)")
    let value = linkedList.removeLast()
    print("removeLast后：\(linkedList) - removeLast value:"+String(describing: value))

}


Tool.example("链表remove操作") {
    var linkedList = LinkList<Int>()
    linkedList.append(1)
    linkedList.append(2)
    linkedList.append(3)
    
    print("remove前：\(linkedList)")
    let index = 1
    let node = linkedList.node(at: index - 1)!
    let removeValue = linkedList.remove(after: node)
    print("removeLast后：\(linkedList) - removeLast value:"+String(describing: removeValue))

}


Tool.example("using collection") {
  var list = LinkList<Int>()
  for i in 0...9 {
    list.append(i)
  }
  
  print("List: \(list)")
  print("First element: \(list[list.startIndex])")
  print("Array containing first 3 elements: \(Array(list.prefix(3)))")
  print("Array containing last 3 elements: \(Array(list.suffix(3)))")
  
  let sum = list.reduce(0, +)
  print("Sum of all values: \(sum)")
}

Tool.example("linked list cow") {
  var list1 = LinkList<Int>()
  list1.append(1)
  list1.append(2)
  var list2 = list1
  print("List1: \(list1)")
  print("List2: \(list2)")
  
  print("After appending 3 to list2")
  list2.append(3)
  print("List1: \(list1)")
  print("List2: \(list2)")
}

func linkedListReversePrintOut(node:Node<Int>?){
    guard node != nil else {
        return
    }
    linkedListReversePrintOut(node: node!.next)
    print("\(node!.value)")

}

Tool.example("链表逆序打印：") {
  var list1 = LinkList<Int>()
  list1.append(1)
  list1.append(2)
  list1.append(3)
  linkedListReversePrintOut(node: list1.head)
}

//快慢指针
func middleOfLinkedList(node:Node<Int>?) -> Int? {
    guard node != nil else {
        return nil
    }
    
    var fastp = node
    var slowp = node
    while fastp != nil && fastp!.next != nil {
        fastp = fastp?.next?.next
        slowp = slowp?.next
    }
    return slowp?.value
    
}

Tool.example("链表中间节点：") {
  var list1 = LinkList<Int>()
  list1.append(1)
  list1.append(2)
  list1.append(3)
//  list1.append(4)
  let value = middleOfLinkedList(node: list1.head)
  print(value!)
}

//逆置链表
func reverseLinkedList<Value>(list:LinkList<Value>) -> LinkList<Value>? {
    guard !list.isEmpty else {
        return nil
    }
    
    var newList = LinkList<Value>()
    var head = list.head
    
    newList.push(head!.value)
    
    //原地逆序
//    while head?.next != nil {
//        let next = head!.next
//        head!.next = newHead
//        newHead = head
//
//        head = next
//
//    }
    
    while head?.next != nil {
        newList.push(head!.next!.value)
        head = head!.next
    }
    return newList
  
}
Tool.example("链表逆序：") {
  var list1 = LinkList<Int>()
  list1.append(1)
  list1.append(2)
  list1.append(3)
  print("逆序前：\(list1)")
  let list  = reverseLinkedList(list: list1)
  print("逆序后：\(list!)")
}


func mergesLinkedList(list1:LinkList<Int>,list2:LinkList<Int>) -> LinkList<Int>  {
    var list = LinkList<Int>()
    for node in list2 {
        list.append(node)
    }
    
    for node in list1 {
        list.append(node)
    }
    
    return list
    
}

Tool.example("链表逆序：") {
  var list1 = LinkList<Int>()
  list1.append(1)
  list1.append(2)
  list1.append(3)

  var list2 = LinkList<Int>()
  list2.append(-1)
  list2.append(-2)
  list2.append(-3)

  let megerList = mergesLinkedList(list1: list1, list2: list2)
  print(megerList)
}

/*
 
 删除链表中重复的节点
 在一个排序，如何删除重复的节点？
 例如：1 -> 2 -> 3 -> 3 -> 4
 删除后是 1 -> 2 -> 4
 
 采用三个指针来进行遍历，同时删除重复的节点，因为是有序的链表，我们就可以确定，重复的元素肯定是在一块链接，所以我们就可以，用三指针，我们这里就叫
 pre、cur、nex 分别代表的是前中后三个指针，我们在考虑的情况中，如果头节点开始就重复，我们就处理很起来多了一种情况就需要额外处理，所以我们添加一个头节点，变成带头节点，保证了头节点开始不会重复，那么我们就可以开是让pre指向带头的节点，cur指向pre的next，nex指向cur的next。

 接下来我们就可以看cur是否和nex相等，相等就让nex继续向下走，不相等然后再处理删除，cur开始到nex中间节点都是要删除的（包含cur指向，不包含nex指向）删除，就用到了pre，删除完成让pre指向cur就可以了。

 如果cur值与nex值不相等，那么就可以三个指针各自往前移动一个。
 ————————————————
 原文链接：https://blog.csdn.net/GangStudyIT/article/details/80623477
 
 
 ListNode* deleteDuplication(ListNode* pHead)
 {
     // 先判断空
     if (pHead == NULL)
     {
         return NULL;
     }
     // 判断是否只有一个节点
     if (pHead->next == NULL)
     {
         return pHead;
     }
     // 我们采用带头链表，自己添加一个头
     ListNode* pre = new ListNode();
     pre->next = pHead; // 把头节点链接在链表上
     ListNode* pre_head = pre; // 用来保存头节点，用于返回删除后的链表
     ListNode* cur = pHead; //中指针
     ListNode* nex = pHead->next; // 后面指针
     while (nex != NULL) // 结束条件
         while (nex != NULL && cur->val == nex->val)
         {
             nex = nex->next;
         }
         // 如果没有重复的那么cur的next一定等于nex
         if (cur->next != nex) // 如果相等说明没有相同的节点
         {
             while (cur != nex) // 删除动作
             {
                 pre->next = cur->next;
                 delete cur;
                 cur = pre->next;
             }
             if (nex != NULL) // 这里一定要要注意，要防止走到NULL发生段错误
             nex = nex->next;
         }
         else
         {
             // 处理没有重复的情况
             pre = cur;
             nex = nex->next;
             cur = cur->next;
         }
     }
     ListNode* head = pre_head->next; // 释放空间，防止内存泄漏
     delete pre_head;
     return head;
 }


 */

