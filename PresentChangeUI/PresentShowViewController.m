//
//  PresentShowViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "PresentShowViewController.h"
#import "dataSource.h"

@interface PresentShowViewController ()

@end

@implementation PresentShowViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark --Popover delegate functions

/*
-(void)popoverController:(UIPopoverController *)popoverController willRepositionPopoverToRect:(inout CGRect *)rect inView:(inout UIView *__autoreleasing *)view
{
    
}

-(void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    
}

-(BOOL)popoverControllerShouldDismissPopover:(UIPopoverController *)popoverController
{
    return YES;
}
*/

#pragma -mark tableViewController delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    dataSource *data = [dataSource getDataSource];
    return [data.PresentDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CompanyCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
        return cell;
}



@end
