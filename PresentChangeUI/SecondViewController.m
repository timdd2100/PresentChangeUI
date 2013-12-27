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
    
    
    if ([[segue identifier] isEqualToString:@"PeopleAddSegue"])
    {
        if (!popAddPeople) {
            NSLog(@"未有Popover存在");
           
            popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
                
           
        }
        else
        {
            NSLog(@"關閉先前的Popover");
            [popAddPeople dismissPopoverAnimated:YES];
            popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
            
        }
        
        //讓之後的Popover 能操作 原本的ViewController
        PeopleAddViewController *p = (PeopleAddViewController *)segue.destinationViewController;
        p.parent = self;
        
    }
    
    else if([[segue identifier] isEqualToString:@"AllPeoplePopSegue"])
    {
          if (!popAddPeople) {
               popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
          }
          else
          {
              [popAddPeople dismissPopoverAnimated:YES];
              popAddPeople =  [(UIStoryboardPopoverSegue *)segue popoverController];
          }
    }
}


//給子Popover使用
-(UIPopoverController *)getPopover
{
    return popAddPeople;
}


@end
