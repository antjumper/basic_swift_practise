//
//  ViewController.m
//  IteratorDemo
//
//  Created by Flex on 2019/6/25.
//  Copyright © 2019 flex. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
#import "IteratorDemo-Bridging-Header.h"
#import "IteratorDemo-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    //外部迭代器
//    Node *tree = [Node createTreeWithValues:@[@9,@8,@11]];
//    NSEnumerator *enumerator = [tree enumerator];
//
//    NSNumber *value;
//    while (value = [enumerator nextObject]) {
//        NSLog(@"nextObject = %@",value);
//    }
//    Node *tree_2 = [Node createTreeWithValues:@[@10,@7,@12]];
//
//    // 内部迭代器
//    [tree_2 enumerateObjectUsingblock:^(id  _Nonnull item, BOOL * _Nonnull stop) {
//        NSLog(@"enumerateObjectUsingblock = %@",item);
//    }];
//
    
    
//    [SwiftIteratorExe dispalySwiftIterator];
    
//    [SwiftIteratorExe displayCustomIterator];
    
//    [SwiftIteratorExe displayCustomIterator_2];
    
    [SwiftIteratorExe displaySupriseIterator];
    
//    yield
    
    
}


@end
