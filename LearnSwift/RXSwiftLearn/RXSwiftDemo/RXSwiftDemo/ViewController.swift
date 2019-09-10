//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by Flex on 2019/6/14.
//  Copyright © 2019 flex. All rights reserved.
//

import UIKit
import RxSwift
/*
 1 首先明白什么是Observable
 2 Operators（接线员） 分为两大类 一类用于创建Observable 另一类接受一个Observable生成一个新的Observable
 
 3 Observable 表达的是异步操作 因此对Observable调用map和filter方法时，只表示我们要对事件序列中的元素进行处理的逻辑，而并不会立即对Observable中的元素进行处理。
 
 4 什么时候对元素进行处理呢？ 当有人订阅的时候才开始处理
 
 
 */
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
  
//        baseRxSwift()
        
        illimitableSqueueEvent()

    }

    func baseRxSwift() -> Void {
        //2 Operators
        //分别用of 和 from这个两个Operators生成Observable
        //        of：用固定数量的元素生成一个Observable
        _ =  Observable.of("1","2","3","4","5","6","7","8","9")
        //        from：用一个Sequence类型的对象创建一个Observable；
        _ = Observable.from(["1","2","3","4","5","6","7","8","9"])
        
        //3 Observable 是异步的  不会立刻对数据进行处理
        var evenNumberObservable =
            Observable.of("1", "2", "3", "4", "5", "6", "7", "8", "9")
                .map { Int($0) }
                .filter {
                    if let item = $0, item % 2 == 0 {
                        print("filter 事件: \(item)")
                        return true
                        
                    }
                    return false
        }
        
        //        dump(evenNumberObservable)
        print(evenNumberObservable)//打印结果不会执行筛选
        
        //什么时候 执行筛选呢 当有人订阅的时候
        evenNumberObservable.subscribe{
            event in
            print("subscribe 事件:\(event)")
        }
        
        //半路关注事件
        evenNumberObservable.skip(3).subscribe{
            event in
            print("skip 和 subscribe 事件:\(event)")
        }
        
        //只有在订阅的时候才触发的Observalbe 叫Cold Observable
        //还有一种Observable只要创建了就会自动触发 这种叫 Hot Observable
        
        // subscribe 也是一个Operator 用于把时间的订阅者（Observer）和事件的产生者（Observable）关联起来
        //订阅者和时间产生者之间的约定：
        //1 Observable 正常发送事件时会调用订阅者 的 onNext 方法
        //2 Observable 时间完成之后会调用 订阅者的 onCompleted 方法
        //3 Observable 发生错误是会调用订阅者的 onError方法
        //4 Observable 的方法被回收的时候会调用订阅者的onDisposed 方法
        
        //对于Dispose
        // 对于一个有限的Observable 在事件结束的时候执行订阅者的disposed
        // 对于无线序列 可以手动调用订阅对象的dispose方法
        
        //举例 无限事件的序列
        //看 illimitableSqueueEvent
    }
    
    func delay(_ delay:Double,closure: @escaping () -> Void) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            closure()
        }
    }
    
    func illimitableSqueueEvent() -> Void {
        let disposable = Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
            onNext:{print("Subscribed 事件: \($0)")},
            onDisposed: { print("disposed事件：log") })
        
        delay(5){
            disposable.dispose()
        }

    }
    
    // 主动调用dispose 不太合适 可以吧每个订阅者放到bag中 bag消亡 订阅者的资源就消亡
    func disposedBag() -> Void {
        var bag = DisposeBag()

        _ = Observable<Int>.interval(1, scheduler: MainScheduler.instance).subscribe(
            onNext:{print("Subscribed 事件: \($0)")},
            onDisposed: { print("disposed事件：log") }).disposed(by: bag)
        
        delay(5){
            bag = DisposeBag()
        }
    }

}

