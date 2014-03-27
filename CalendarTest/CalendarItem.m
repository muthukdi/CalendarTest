//
//  CalendarItem.m
//  CalendarTest
//
//  Created by Ed on 3/24/2014.
//  Copyright (c) 2014 Ed. All rights reserved.
//

#import "CalendarItem.h"

@implementation CalendarItem

-(id) initWithDate:(NSString *)date entries:(NSMutableArray *)entries
{
    if (self = [super init])
    {
        self.date = date;
        self.entries = entries;
    }
    return self;
}


@end
