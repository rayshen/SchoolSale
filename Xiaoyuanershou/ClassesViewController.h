//
//  INSViewController.h
//  Berlin Insomniac
//
//  Created by Salánki, Benjámin on 06/03/14.
//  Copyright (c) 2014 Berlin Insomniac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClassesViewCell.h"
#import "WantViewController.h"
#import "CLSDetailViewController.h"
#import "QSearchViewController.h"
@interface ClassesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    UICollectionView *cv;

}
- (IBAction)tosearch:(id)sender;
- (IBAction)toiwant:(id)sender;
@end
