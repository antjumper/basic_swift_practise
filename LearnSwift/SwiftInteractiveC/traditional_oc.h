//
//  traditional_oc.h
//  SwiftInteractiveC
//
//  Created by Flex on 2019/6/12.
//  Copyright © 2019 flex. All rights reserved.
//


#import <Foundation/Foundation.h>

//添加全局变量
const int global_ten;

//OC代码定义一组有共同前缀的常量来模拟enum的特性

typedef NSString * TrafficLightColor NS_STRING_ENUM;

TrafficLightColor const TrafficLightColorRed;
TrafficLightColor const TrafficLightColorYellow;
TrafficLightColor const TrafficLightColorGreen;

//NS_EXTENSIBLE_STRING_ENUM

typedef int Shape NS_EXTENSIBLE_STRING_ENUM;

Shape const ShapeCircle;
Shape const ShapeTriangle;
Shape const ShapeSquare;
NS_ASSUME_NONNULL_BEGIN

@interface traditional_oc : NSObject



@end

NS_ASSUME_NONNULL_END
