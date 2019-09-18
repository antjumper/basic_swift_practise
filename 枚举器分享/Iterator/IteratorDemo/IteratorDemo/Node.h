//
//  Node.h
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyEnumeratorProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject <MyEnumeratorProtocol>

@property (nonatomic,assign) NSInteger value;

@property (nonatomic,strong) Node *leftNode;

@property (nonatomic,strong) Node *rightNode;

+ (Node *)createTreeWithValues:(NSArray *)values;

+ (Node *)addTreeNode:(Node *)treeNode value:(NSInteger)value;

+ (void)preOrderTraverseTree:(Node *)rootNode handler:(void(^)(Node *treeNode))handler;

@end

NS_ASSUME_NONNULL_END
