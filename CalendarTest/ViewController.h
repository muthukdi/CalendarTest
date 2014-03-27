//
//  ViewController.h
//  CalendarTest
//
//  Created by Ed on 3/23/2014.
//  Copyright (c) 2014 Ed. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "I3DragBetweenHelper.h"
#import "CalendarItem.h"
#import "DMCollectionViewCell.h"

@interface ViewController : UIViewController <I3DragBetweenDelegate, UITableViewDataSource, UITableViewDelegate,
                                                UICollectionViewDataSource, UICollectionViewDelegate,
                                                UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *destinationCollection;

@property (weak, nonatomic) IBOutlet UITableView *sourceTable;

@property (nonatomic, strong) I3DragBetweenHelper* helper;

@property (nonatomic, strong) NSArray* tableData;

@property (nonatomic, strong) NSMutableArray* collectionData;

@end
