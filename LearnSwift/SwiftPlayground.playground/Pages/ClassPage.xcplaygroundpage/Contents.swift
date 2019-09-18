
import UIKit

//======================== class的学习 ======================

//1 第一点默认init（就是属性值 都赋了默认值）
class Point2D {
    var x: Double = 0
    var y: Double = 0
}
let origin = Point2D()

//2 designated init  才是正规军 定义了之后 如果想有默认的方法 那么就把 初始化参数 带默认参数就行了
class Point2D2 {
    var x: Double = 0
    var y: Double = 0
    
    init(x: Double = 0, y: Double = 0) {
        self.x = x
        self.y = y
    }
    
    convenience init(at: (Double, Double)) {   //3 Convenience init
        self.init(x: at.0, y: at.1)
    }
    
    //4 Failable init  有可能初始化失败的init
    convenience init?(at: (String, String)) {
        guard let x = Double(at.0),
            let y = Double(at.1) else {
                return nil
        }
        
        self.init(at: (x, y))
    }
    //tip  一个failable designated init方法不能被non failable convenience init调用。但是，一个普通的designated init方法，却可以被failable convenience init调用。  不太理解的地方 是第二句 但是
}


//===================================calss 初始化方法里面的 针对继承体系的 two phase initialization机制===============================
//Point3D 继承Point2D
//class Point3D: Point2D {
//    var z: Double
//}

//1、理论上如果派生类没有定义任何designated initializer，那么它将自动继承继承所有基类的designated initializer

//但是继承的方法 不足够初始化Point3D 的 所有属性的时候 所以会报错 ----（当子类的属性数量和 父类的一致的时候就不会报错啦）

// 2 、如果一个派生类 定义了（可以理解成：可以是我们自己手动实现的，当然也可以是默认从基类继承而来的）  所有基类的designated init，那么它也将自动继承基类所有的convenience init。

//继承之后的重载
class Point3D: Point2D2 {
    var z: Double
    
    init(x: Double = 0, y: Double = 0, z: Double = 0) {//定义了 designated init之后之前所有自动从Point2D继承而来的init就都不存在了
        // 第一阶段
        self.z = z
        super.init(x: x, y: y)
        
        // 第二阶段
        self.initXYZ(x: x, y: y, z: z)
    }
    
    //我们仍有办法让Point3D从Point2D继承所有的convenience init，只要我们在Point3D中手工实现所有Point2D的designated init方法就好了
    override init(x: Double, y: Double) {
        self.z = 0
        super.init(x: x, y: y)
    }
    
    init?(xy: Double) {
        if xy <= 0 { return nil }
        
        self.z = xy
        super.init(x: xy, y: xy)
    }
    //    只要派生类拥有基类所有的designated init方法，他就会自动获得所有基类的convenience init方法
    
    
    //tips  :  在派生类中，重载基类的convenience init方法，是不需要override关键字的
    convenience init(at: (Double, Double)) {
        self.init(x: at.0, y: at.1, z: 0)
    }
    
    //这个是为了测试两段式
    func initXYZ(x: Double, y: Double, z: Double) {
        self.x = round(x)
        self.y = round(y)
        self.z = round(z)
    }
}


//two-phase initialization  分两个阶段

//1 阶段一：从派生类到基类，自下而上让类的每一个属性都有初始值   self.z，然后再调用super.init初始化基类的成员

//2 所有属性都有初始值之后，从基类到派生类，自上而下对类的每个属性进行进一步加工  对这个的理解看Point3D -- init 方法

//3 tips *****  派生类中继承而来的方法带有默认参数，不要修改它 *****

class Shape {
    enum Color { case red, yellow, green }
    
    func draw(color: Color = .red) {
        print("A \(color) shape.")
    }
}
//两个派生类 重写了draw
class Square: Shape {
    override func draw(color: Color = .yellow) {
        print("A \(color) square.")
    }
    
}

class Circle: Shape {
    override func draw(color: Color = .green) {
        print("A \(color) circle.")
    }
}

//很漂亮的可以调用了
//let s = Square()
//let c = Circle()
//
//s.draw() // A yellow square
//c.draw() // a green circle
//但是遇到 多态调用就 嗝屁了
let s: Shape = Square()
let c: Shape = Circle()

// 因为 ： 在Swift里，继承而来的方法调用是在运行时动态派发的，Swift会在运行时动态选择一个对象真正要调用的方法。但是，方法的参数，出于性能的考虑，却是静态绑定的，编译器会根据调用方法的对象的类型，绑定函数的参数

//解决办法（解决基类里面有默认参数的问题 ）：为了能在重定义继承方法的同时，又继承到基类的默认参数  如果你知道定义在extension中的方法，是不能被重定义的，就看到了一丝曙光。我们可以把绘画的过程抽象在一个extension方法里，供外部统一调用，然后把真正的绘制过程定义成一个可以重定义的方法
/*
 
 class Shape {
 enum Color { case red, yellow, green }
 
 func doDraw(of color: Color) {
 print("A \(color) shape.")
 }
 }
 
 extension Shape {
 func draw(color: Color = .red) {
 doDraw(of: color)
 }
 }
 
 
 class Square: Shape {
 override func doDraw(of color: Color) {
 print("A \(color) square.")
 }
 
 }
 
 class Circle: Shape {
 override func doDraw(of color: Color) {
 print("A \(color) circle.")
 }
 }
 
 把带有默认参数的 函数方法放到extension  里面
 
 */

func defaultPower (role:Role) ->Int {
    return 0
}

class Role {
    typealias PowerFn = (Role) -> Int
    
    var powerFn : PowerFn;
    
    init(powerFn:@escaping PowerFn = defaultPower) {
        self.powerFn = powerFn
    }
}

extension Role {
    func power() -> Int {
        return powerFn(self)
    }
}


//理解closure capture list

//不使用  closure capture list的原始样子是这样的
//var i = 10
//var captureI = { print(i) }
//i = 11
//captureI() // 输出 11

//使用 closure capture list的原始样子是这样的

var i = 10
var captureI = { [i] in print(i) }
i = 11

captureI() // 输出10
//这次，我们在captureI的定义中使用了[i]，这叫做closure的capture list，它的作用就是让closure按值语义捕获变量。因此，当我们执行captureI()时，打印的结果就变成了10，这是captureI在定义时变量i的值。

//var c = Demo()
//var captureC = { [c] in print(c.value) }
//c.value = "updated"
//c = Demo()
//
//captureC() // 输出updated
//打印结果就会变成updated。这次，captureC捕获的也不再是变量c的引用，而是变量c引用的对象本身


