//
//  WalkthroughViewController.m
//  Tonely
//
//  Created by Tim Shim on 27/5/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import "WalkthroughViewController.h"
#import "MPTextReavealLabel.h"

static NSString *kCell=@"cell";



@interface WalkthroughViewController ()

@end

@implementation WalkthroughViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    
   
    MPPallaxLayout *layout=[[MPPallaxLayout alloc] init];

    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    _collectionView.showsHorizontalScrollIndicator=NO;
    _collectionView.pagingEnabled=YES;
    _collectionView.backgroundColor=[UIColor colorWithRed:58/255.0f green:59/255.0f blue:75/255.0f alpha:1.0f];
    [_collectionView registerClass:[MPParallaxCollectionViewCell class] forCellWithReuseIdentifier:kCell];
    [self.view addSubview:_collectionView];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MPParallaxCollectionViewCell* cell =  (MPParallaxCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCell forIndexPath:indexPath];

    cell.image=[UIImage imageNamed:[NSString stringWithFormat:@"%li",(long)indexPath.item%5+1]];

    cell.delegate=self;
    
    NSString *text;

    NSInteger index=indexPath.row%5;

    switch (index) {
        case 0:
            text=@"1. Connect to iTunes";
            break;
        case 1:
            text=@"2. Save to Desktop";
            break;
        case 2:
            text=@"3. Drag to Library";
            break;
        case 3:
            text=@"4. Sync iPhone";
            break;
        case 4:
            text=@"5. Use Ringtone";
            break;
        default:
            break;
            
    }
    
    
    // that shit just to not make dirty MPParallaxCollectionViewCell ... I add that only to demonstrate how to use the percent driven stuff
    if (![cell viewWithTag:3838]) {
        MPTextReavealLabel *label=[[MPTextReavealLabel alloc] initWithFrame:CGRectMake(20, 400, 280, 160)];
        label.tag=3838;
        label.lineWidth=3;
        [cell addSubview:label];
        
    }
    
    MPTextReavealLabel *label=(MPTextReavealLabel *)[cell viewWithTag:3838];
    label.frame=CGRectMake(20, 400, 280, 160);
    label.attributedText=[[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:26]}];


    
    return cell;
}

- (void)cell:(MPParallaxCollectionViewCell *)cell changeParallaxValueTo:(CGFloat)value{
    
    NSLog(@"%f",value);
    
    MPTextReavealLabel *label=(MPTextReavealLabel *)[cell viewWithTag:3838];
    CGFloat val=1-(value<0 ? -value : value);
    [label drawToValue:val*val];
}

@end
