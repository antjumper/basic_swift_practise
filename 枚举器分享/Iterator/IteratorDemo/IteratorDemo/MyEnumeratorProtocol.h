//
//  MyEnumeratorProtocol.h
//  IteratorDemo
//
//  Created by Flex on 2019/6/26.
//  Copyright © 2019 flex. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MyEnumeratorProtocol <NSObject>

@required
- (NSEnumerator *)enumerator;
- (void)enumerateObjectUsingblock:(void (^)(id item,BOOL *stop))block;

@end

NS_ASSUME_NONNULL_END
