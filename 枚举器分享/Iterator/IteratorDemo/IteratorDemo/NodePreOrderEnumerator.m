//
//  NodePreOrderEnumerator.m
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

#import "NodePreOrderEnumerator.h"
#import "NSMutableArray+Stack.h"
@interface NodePreOrderEnumerator ()

@property (nonatomic,strong) NSMutableArray *stack;

@end

@implementation NodePreOrderEnumerator

- (instancetype)initWithNode:(Node *)node {
    if (self = [super init]) {
        self.stack = [NSMutableArray array];
        [self genStackWithNode:node];
    }
    return self;
}

- (void)genStackWithNode:(Node *)node {
    if (node) {
        __weak typeof(self) weakself = self;
        [Node preOrderTraverseTree:node handler:^(Node * _Nonnull treeNode) {
            if (treeNode) {
                [weakself.stack push:@(treeNode.value)];
            }
        }];
    }
}

- (NSArray *)allObjects {
    return [[self.stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject {
    return [self.stack pop];
}



@end
