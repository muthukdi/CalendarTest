//
//  ViewController.m
//  CalendarTest
//
//  Created by Ed on 3/23/2014.
//  Copyright (c) 2014 Ed. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sourceTable.delegate = self;
    self.sourceTable.dataSource = self;
    self.destinationCollection.delegate = self;
    self.destinationCollection.dataSource = self;
    self.tableData = @[
                      @"Dilip",
                      @"Kshitij",
                      @"Chandar",
                      @"Darren",
                      @"Boris",
                      @"George",
                      @"Abraham",
                      @"Jessica",
                      @"Rekha"
                      ];
    
    self.collectionData = [NSMutableArray arrayWithCapacity:36];
    
    for (int i = 0; i < 42; i++)
    {
        NSMutableArray *entries = [[NSMutableArray alloc] initWithObjects:nil];
        CalendarItem *item;
        if (i < 5 || i > 36)
        {
            item = [[CalendarItem alloc] initWithDate:@"0" entries:entries];
        }
        else
        {
            NSString *date = [NSString stringWithFormat:@"%i", i-5];
            item = [[CalendarItem alloc] initWithDate:date entries:entries];
        }
        [self.collectionData addObject:item];
    }
    
    /* Configure the helper */
    
    self.helper = [[I3DragBetweenHelper alloc] initWithSuperview:self.view
                                                         srcView:self.sourceTable
                                                         dstView:self.destinationCollection];
    
    self.helper.delegate = self;
    
    self.helper.isSrcRearrangeable = NO;
    self.helper.doesSrcRecieveDst = NO;
    self.helper.hideSrcDraggingCell = NO;
    
    self.helper.isDstRearrangeable = NO;
    self.helper.doesDstRecieveSrc = YES;
    self.helper.doesSrcRecieveDst = NO;
    self.helper.hideDstDraggingCell = YES;
}


#pragma mark - Drag n drop exchange and rearrange delegate methods

-(void) droppedOnDstAtIndexPath:(NSIndexPath*) to fromSrcIndexPath:(NSIndexPath*)from
{
    /* Grab the appropriate data */
    NSInteger fromIndex = (from.item);
    NSInteger toIndex = (to.item);
    // Disable drag and drop on invalid calendar cells
    if (toIndex < 5 || toIndex > 36)
    {
        return;
    }
    // Don't allow more than 4 names in a calendar item
    CalendarItem *item = [self.collectionData objectAtIndex:toIndex];
    if (item.entries.count > 3)
    {
        [[[UIAlertView alloc] initWithTitle:@"Invalid" message:@"Only 4 items per day!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        return;
    }
    
    NSString *name = [self.tableData objectAtIndex:fromIndex];
    
    /* Update the data and collections accordingly */
    [item.entries addObject:name];
    
    [self.destinationCollection reloadData];
}

-(BOOL) droppedOutsideAtPoint:(CGPoint) pointIn fromDstIndexPath:(NSIndexPath*) from
{
    return YES;
}

-(BOOL) isCellAtIndexPathDraggable:(NSIndexPath*) index inContainer:(UIView*) container
{
    return (container == self.destinationCollection) ? NO : YES;
}


#pragma mark - Collection view delegate and datasource implementations

-(NSInteger) collectionView:(UICollectionView*) collectionView numberOfItemsInSection:(NSInteger) section
{
    return self.collectionData.count;
}

-(UICollectionViewCell*) collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath*) indexPath{
    
    DMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DequeueReusableCell"
                                                                           forIndexPath:indexPath];
    CalendarItem *item = (CalendarItem *)[self.collectionData objectAtIndex:indexPath.item];
    NSString *date = item.date;
    if ([date isEqualToString:@"0"])
    {
        cell.backgroundColor = [UIColor lightGrayColor];
        cell.dateLabel.text = @"";
        cell.entriesLabel.text = @"";
    }
    else
    {
        cell.dateLabel.text = date;
        cell.entriesLabel.text = [item.entries componentsJoinedByString:@"\n"];
        cell.entriesLabel.numberOfLines = 4;
        cell.dateLabel.textColor = [UIColor blueColor];
        cell.entriesLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

#pragma mark - Collection View FlowLayout delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(88.0, 88.0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.0f;
}


#pragma mark - Table view delegate and datasource implementations


-(NSInteger) tableView:(UITableView*) tableView numberOfRowsInSection:(NSInteger) section{
    
    return self.tableData.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Height of the table cell background image
    return 140;
}


-(UITableViewCell*) tableView:(UITableView*) tableView cellForRowAtIndexPath:(NSIndexPath*) indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    }
    NSInteger row = indexPath.row;
    
    cell.textLabel.text = [self.tableData objectAtIndex:row];
    cell.textLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
    cell.textLabel.numberOfLines = 5;
    [cell.textLabel sizeToFit];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tablecell.png"]];
    cell.showsReorderControl = YES;
    
    return cell;
}


@end
