//
//  CalendarItem.h
//  CalendarTest
//
//  Created by Ed on 3/24/2014.
//  Copyright (c) 2014 Ed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalendarItem : NSObject

@property (nonatomic, strong) NSString* date;

@property (nonatomic, strong) NSMutableArray* entries;

-(id) initWithDate:(NSString *)date entries:(NSMutableArray *)entries;

@end
