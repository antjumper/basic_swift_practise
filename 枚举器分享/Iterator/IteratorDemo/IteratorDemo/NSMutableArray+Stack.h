//
//  NSMutableArray+Stack.h
//  IteratorDemo
//
//  Created by Flex on 2019/6/25.
//  Copyright © 2019 flex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)

- (void) push:(id)object;

- (id) pop;
@end

NS_ASSUME_NONNULL_END
