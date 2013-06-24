//
//  MNQueue.h
//  Windwill
//
//  Created by ManuQiao on 13-6-23.
//  Copyright (c) 2013年 ManuQiao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (QueueAdditions)
- (id) dequeue;
- (void) enqueue:(id)obj;
@end