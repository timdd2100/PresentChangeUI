//
//  TabBarVIewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "TabBarVIewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "dataSource.h"

@interface TabBarVIewController ()

@end

@implementation TabBarVIewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [dataSource getDataSource];
    
    PeopleDataSource = [[NSMutableArray alloc]init];
    PresentDataSource = [[NSMutableArray alloc]init];
    
    
    //共享資料來源
    NSArray *viewControllers = self.viewControllers;
    FirstViewController  *PresentCenter =  (FirstViewController *)[viewControllers objectAtIndex:0];
    
    SecondViewController  *People =  (SecondViewController *)[viewControllers objectAtIndex:1];
    
    PresentCenter.PresentDataSource = PresentDataSource;
    PresentCenter.PeopleDataSource = PeopleDataSource;
    
    People.PresentDataSource = PresentDataSource;
    People.PeopleDataSource = PeopleDataSource;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
