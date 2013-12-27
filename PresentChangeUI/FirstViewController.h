//
//  FirstViewController.h
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (nonatomic, strong)NSMutableArray *PeopleDataSource;
@property (nonatomic, strong)NSMutableArray *PresentDataSource;

@property (weak, nonatomic) IBOutlet UIProgressView *PresentProgress;
@property (weak, nonatomic) IBOutlet UIImageView *PresentImageView;

@end
