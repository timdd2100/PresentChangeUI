//
//  PeopleAddViewController.h
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface PeopleAddViewController : UIViewController<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *LPeopleName;

@property (weak, nonatomic) IBOutlet UILabel *LPresentName;

@property(weak,nonatomic) SecondViewController *parent;

@end
