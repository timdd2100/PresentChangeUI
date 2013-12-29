//
//  AppDelegate.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/24.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    /*以前XIB的寫法
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[xxxController alloc] initWithNibName:@"xxxViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
    */
    
    
    /*StoryBoard的寫法
     UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"exercise" bundle:nil];
     UIViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"ExerciseViewController"];
     self.window.rootViewController = controller;
     
     return YES;
    */

    /*
    PresentChange Used
     ===================
    */
    
    PeopleDataSource = [[NSMutableArray alloc]init];
    PresentDataSource = [[NSMutableArray alloc]init];
    
    //init
    
    //共享資料來源
    FirstViewController *PresentCenter = [FirstViewController new];
    PresentCenter.PeopleDataSource = PeopleDataSource;
    PresentCenter.PresentDataSource = PresentDataSource;
    
    SecondViewController *People = [SecondViewController new];
    People.PeopleDataSource = PeopleDataSource;
    People.PresentDataSource = PresentDataSource;
    //==================
    return YES;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
