//
//  WalkthroughViewController.h
//  Tonely
//
//  Created by Tim Shim on 27/5/14.
//  Copyright (c) 2014 Tim Shim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPPallaxLayout.h"
#import "MPParallaxCollectionViewCell.h"

@interface WalkthroughViewController : UIViewController<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,MPParallaxCellDelegate>{
    
    UICollectionView *_collectionView;
    
}

@end
