//
//  NSMutableArray+Stack.m
//  IteratorDemo
//
//  Created by Flex on 2019/6/25.
//  Copyright © 2019 flex. All rights reserved.
//

#import "NSMutableArray+Stack.h"


@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    [self addObject:object];
}

- (id)pop {
    if ([self count] == 0) {
        return nil;
    }
    id object = [self lastObject];
    [self removeLastObject];
    return object;
}



@end
