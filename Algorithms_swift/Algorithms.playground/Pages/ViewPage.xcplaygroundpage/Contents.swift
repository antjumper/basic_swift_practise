import Foundation
import PlaygroundSupport
import UIKit

//
////表示当前的Playground对应的Page
//public let current: PlaygroundSupport.PlaygroundPage
//
////是否需要无限之行，比如写一个交互式的View，那么在执行到最底部之后，仍然要继续执行。
//public var needsIndefiniteExecution: Bool
//
////Page的LiveView，这个View会接受触摸等事件，如果liveView不为空，会自动设置needsIndefiniteExecution为true
//public var liveView: PlaygroundLiveViewable?
//


let demoView = RandomColorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))

PlaygroundPage.current.liveView = demoView

