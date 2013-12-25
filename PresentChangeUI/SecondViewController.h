//
//  SecondViewController.h
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *PeopleDataSource;
@property (nonatomic, strong)NSMutableArray *PresentDataSource;

-(UIPopoverController *)getPopover;



@end
