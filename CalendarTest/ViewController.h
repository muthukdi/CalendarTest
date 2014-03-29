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
{
   bool isTableViewVisible; 
}

@property (weak, nonatomic) IBOutlet UICollectionView *destinationCollection;

@property (weak, nonatomic) IBOutlet UITableView *sourceTable;

@property (weak, nonatomic) IBOutlet UIImageView *locationsTitleBar;

@property (weak, nonatomic) IBOutlet UILabel *locationsLabel;

@property (weak, nonatomic) IBOutlet UIImageView *weekImage;

@property (weak, nonatomic) IBOutlet UILabel *monthLabel;

@property (nonatomic, strong) I3DragBetweenHelper* helper;

@property (nonatomic, strong) NSArray* tableData;

@property (nonatomic, strong) NSMutableArray* collectionData;



-(IBAction)hideView:(id)sender;

@end
