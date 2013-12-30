//
//  FirstViewController.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "FirstViewController.h"
#import "PresentStatusViewController.h"
#import "People.h"
#import "Present.h"
#import "dataSource.h"

@interface FirstViewController ()
{
    UIPopoverController *statusPopover;
    UIPopoverController *showPopover;
    NSTimer *timer;
    
    NSMutableArray *randomResult;
    
    NSMutableString *Presentresult;
}
@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    // 加入手勢
    self.PresentImageView.userInteractionEnabled = YES;
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeByGesture)];
    
    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    
    
    [self.PresentImageView addGestureRecognizer:swipeGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -mark --Popover程式寫法的function
- (IBAction)statusPopoverButton:(UIButton *)sender {
    
    /*
     status Popover
     初始化
     by 程式寫法
     */
    
    PresentStatusViewController *statusPop = [self.storyboard instantiateViewControllerWithIdentifier:@"PresentStatusViewController"];
    
     //TODO  宣告Popover
    statusPopover = [[UIPopoverController alloc]initWithContentViewController:statusPop];
    

    
    //status Popover
    
    /*從工具列長出
     [statusPopover presentPopoverFromBarButtonItem:(UIBarButtonItem *) permittedArrowDirections:(UIPopoverArrowDirection) animated:(BOOL)];
     */
    
     //TODO  讓Popover長出
    //從按鈕上長出 方向是auto
    [statusPopover presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
}


#pragma -mark --透過storyBoard 的 Segue
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"PresentShowSegue"])
    {
        showPopover = [(UIStoryboardPopoverSegue *)segue popoverController];
        
    }
}


#pragma -mark --手勢 配發禮物相關method

-(void)swipeByGesture
{
    self.PresentProgress.progress = 0.0;
    float theInterval = 1.0/5.0;
    timer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(progressRunning) userInfo:Nil repeats:YES];
}

-(void)progressRunning
{
    if(self.PresentProgress.progress < 1.0)
    {
        self.PresentProgress.progress = self.PresentProgress.progress + 0.1;
    }
    
    else
    {
        //觸發配送禮物事件
        dataSource *source = [dataSource getDataSource];
        
        NSArray *Peoples = source.PeopleDataSource;
        int count = [Peoples count];
        
        //隨機亂數取好
        if(count > 0)
        {
            randomResult  = [NSMutableArray new];
            [self RandomNum:count];
            
            for (int i = 0 ; i < [randomResult count]; i++) {
                [self setPresent:[Peoples objectAtIndex:i] withPresent:  [source.PresentDataSource objectAtIndex:[[randomResult objectAtIndex:i] integerValue]]];
            }
        }
        
        
        //完成訊息
        UIAlertView *msg=[[UIAlertView alloc]initWithTitle:@"" message:@"配發完成" delegate:self cancelButtonTitle:@"確認" otherButtonTitles:Nil];
        [msg dismissWithClickedButtonIndex:0 animated:YES];
        [msg show];
        
        [timer invalidate];
    }
}

//交換禮物   --關係設定
-(void) changePresent :(People *)p1 with :(People *)p2
{
    Present *temp;
    
    //人對禮物的關係
    temp = p2.OwnPresent;
    p2.OwnPresent = p1;
    p1.OwnPresent = temp;
    
    //禮物對人的關係
    temp = (Present *)p1.OwnPresent;
    temp.Owner = p1;
    temp = (Present *)p2.OwnPresent;
    temp.Owner = p2;
}

//設定禮物和人的關係
-(void)setPresent:(People *)p1 withPresent :(Present *)g1
{
    g1.Owner = p1;
    p1.OwnPresent = g1;
}

//隨機取號的method
-(void)RandomNum :(int)count
{
    //建立數量的array
    int number[count];
    int result[count];
    int random = 0;
    
    //
    for (int i = 0; i < count; i++) {
        number[i] = i;
    }
    
    for (int i = 0;  i < count;  i++) {
        random  = arc4random()%count;
        number[random] != -1? result[i] = number[random],number[random] = -1 : i--;
    }
    
    for (int i = 0; i <count; i++) {
        NSInteger a1 =  result[i];
        
        NSString *s = [NSString stringWithFormat:@"%i", a1];
        
        [randomResult addObject:s];
    }
}


@end
