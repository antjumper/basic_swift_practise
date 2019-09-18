//
//  Node.m
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

#import "Node.h"
#import "NodePreOrderEnumerator.h"

@implementation Node

+ (Node *)createTreeWithValues:(NSArray *)values {
    
    Node *root = nil;
    for (NSInteger i=0; i<values.count; i++) {
        NSInteger value = [(NSNumber *)[values objectAtIndex:i] integerValue];
        root = [Node addTreeNode:root value:value];
    }
    return root;
}


+ (Node *)addTreeNode:(Node *)treeNode value:(NSInteger)value {
    //根节点不存在，创建节点
    if (!treeNode) {
        treeNode = [Node new];
        treeNode.value = value;
        NSLog(@"node:%@", @(value));
    }
    else if (value <= treeNode.value) {
        NSLog(@"to left");
        //值小于根节点，则插入到左子树
        treeNode.leftNode = [Node addTreeNode:treeNode.leftNode value:value];
    }
    else {
        NSLog(@"to right");
        //值大于根节点，则插入到右子树
        treeNode.rightNode = [Node addTreeNode:treeNode.rightNode value:value];
    }
    
    return treeNode;
}

+ (void)preOrderTraverseTree:(Node *)rootNode handler:(void(^)(Node *treeNode))handler {
    if (rootNode) {
        
        if (handler) {
            handler(rootNode);
        }
        [self preOrderTraverseTree:rootNode.leftNode handler:handler];
        [self preOrderTraverseTree:rootNode.rightNode handler:handler];
    }
}

- (NSEnumerator *)enumerator {
    return [[NodePreOrderEnumerator alloc] initWithNode:self];
    
}

- (void)enumerateObjectUsingblock:(void (^)(id item,BOOL *stop))block {
    BOOL stop = NO;
    NSEnumerator *enumerator  = [self enumerator];
    for (id e in enumerator) {
        block(e,&stop);
        if (stop) {
            break;
        }
    }
}

@end
