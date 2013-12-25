//
//  SecondViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "SecondViewController.h"
#import "PeopleAddViewController.h"

//全域變數
//-----------
static UIPopoverController* popAddPeople;
//-----------


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*加入全域的UIPopoverController判斷
       避免重複新增Popover
          */
    
    if (!popAddPeople) {
        NSLog(@"未有Popover存在");
        if([[segue identifier] isEqualToString:@"PeopleAddSegue"])
        {
            popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
            
        }
    }
    else
    {
        NSLog(@"關閉先前的Popover");
        [popAddPeople dismissPopoverAnimated:YES];
        popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
        
    }
    
    //
    PeopleAddViewController *p = (PeopleAddViewController *)segue.destinationViewController;
    p.parent = self;
}


//
-(UIPopoverController *)getPopover
{
    return popAddPeople;
}


@end
