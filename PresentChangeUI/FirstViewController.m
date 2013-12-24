//
//  FirstViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "FirstViewController.h"
#import "PresentStatusViewController.h"


@interface FirstViewController ()
{
    UIPopoverController *statusPopover;
    UIPopoverController *showPopover;

}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /*
     status Popover
     初始化
        by 程式寫法
     */
    
    PresentStatusViewController *statusPop = [self.storyboard instantiateViewControllerWithIdentifier:@"PresentStatusViewController"];
    
    statusPopover = [[UIPopoverController alloc]initWithContentViewController:statusPop];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark --Popover程式寫法的function
- (IBAction)statusPopoverButton:(UIButton *)sender {
    
    //status Popover
    
    /*從工具列長出
   [statusPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *) permittedArrowDirections:(UIPopoverArrowDirection) animated:(BOOL)];
    */
    
    //從按鈕上長出 方向是auto
    [statusPopover presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  
}


#pragma -mark --透過storyBoard 的 Segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PresentShowSegue"])
    {
        showPopover = [(UIStoryboardPopoverSegue *)segue popoverController];
        
        //[showPopover passthroughViews];
        //[showPopover setDelegate:(id<UIPopoverControllerDelegate>)];
    }
}




@end
