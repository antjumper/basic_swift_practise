//
//  NodePreOrderEnumerator.h
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyEnumeratorProtocol.h"
#import "Node.h"
NS_ASSUME_NONNULL_BEGIN

@interface NodePreOrderEnumerator : NSEnumerator

- (instancetype)initWithNode:(Node *)node;

- (NSArray *)allObjects;

- (id)nextObject;
@end

NS_ASSUME_NONNULL_END
