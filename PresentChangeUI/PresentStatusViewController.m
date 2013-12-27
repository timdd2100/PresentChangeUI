//
//  PresentStatusViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "PresentStatusViewController.h"
#import "dataSource.h"
#import "Present.h"
#import "People.h"

@interface PresentStatusViewController ()
{
    NSMutableString *presentResult;
}
@end

@implementation PresentStatusViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    dataSource *data = [dataSource getDataSource];
    presentResult = [NSMutableString new];
    
    for (int i = 0 ; i < [data.PresentDataSource count]; i++) {
        
        Present *present =  [data.PresentDataSource objectAtIndex:0];
        
        People *ownpeople = present.Owner;
        
        [presentResult appendFormat:@"%@ 的獲獎者為 %@ \n", present.Name, ownpeople.Name];
    }
   
    
    [self.textView setText:presentResult];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
