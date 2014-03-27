//
//  DMCollectionViewCell.h
//  CalendarTest
//
//  Created by Ed on 3/24/2014.
//  Copyright (c) 2014 Ed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *entriesLabel;


@end
