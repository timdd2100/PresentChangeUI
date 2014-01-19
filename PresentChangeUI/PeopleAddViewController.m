//
//  PeopleAddViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "PeopleAddViewController.h"
#import "People.h"
#import "dataSource.h"
#import "Present.h"

@interface PeopleAddViewController ()

@end

@implementation PeopleAddViewController
@synthesize LPeopleName,LPresentName;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //dataSource *temp = [dataSource getDataSource];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark -- functions

- (IBAction)PeopleName:(UIButton *)sender {
    
    UIAlertView *msg=[[UIAlertView alloc]initWithTitle:@"Name" message:@"People Name" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"確認",Nil];
    msg.alertViewStyle=UIAlertViewStylePlainTextInput;
    [msg dismissWithClickedButtonIndex:0 animated:YES];
    [msg show];
    msg.tag = 1;//設定tag
}

- (IBAction)PresentName:(UIButton *)sender {
    
    UIAlertView *msg=[[UIAlertView alloc]initWithTitle:@"Name" message:@"Present Name" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"確認",Nil];
    msg.alertViewStyle=UIAlertViewStylePlainTextInput;
    [msg dismissWithClickedButtonIndex:0 animated:YES];
    [msg show];
    msg.tag = 2;//設定tag
}


#pragma -mark --alertView delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //儲存姓名
    if(alertView.tag ==1 && buttonIndex == 1)
    {
        NSString *name =[alertView textFieldAtIndex:0].text;
        if (![name isEqualToString:@""]) {
              [LPeopleName setText:name];
        }
    }
    
    else if (alertView.tag ==2 && buttonIndex == 1)
    {
        NSString *name =[alertView textFieldAtIndex:0].text;
        if (![name isEqualToString:@""]) {
            [LPresentName setText:name];
        }
    }
}


#pragma -mark Join Event
- (IBAction)JoinButton:(id)sender {
    
    /*
     將人員和禮品資訊加入到共用的dataSource中
    */
    dataSource *data = [dataSource getDataSource];

    NSMutableArray *peopleArray = data.PeopleDataSource;
    NSMutableArray *presentArray = data.PresentDataSource;
    
    People *people = [[People alloc]initWithName:LPeopleName.text];
    Present *present = [[Present alloc]initWithName:LPresentName.text];
    
    //建立人員和物品的關係
    people.OwnPresent = present;
    present.Owner = people;
    
    [peopleArray addObject:people];
    [presentArray addObject:present];
    
    //呼叫 母viewController 關閉popover
    [[self.parent getPopover] dismissPopoverAnimated:YES];
    
    //更新tabBarItem 的數字
     self.parent.tabBarItem.badgeValue = [NSString stringWithFormat:@"%lu", (unsigned long)[peopleArray count]];
}
@end
