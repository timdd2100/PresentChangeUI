//
//  dataSource.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "dataSource.h"
@implementation dataSource
@synthesize PeopleDataSource,PresentDataSource;

/*
 singleton-class
 
 讓大家共用它的資源
 */
static dispatch_once_t onceToken;
static dataSource *PresentCenter  = nil;

+(id)getDataSource
{

    //利用ＧＣＤ dispatch_once 只做一次的特性
    dispatch_once(&onceToken, ^{
        PresentCenter = [[self alloc] init];
    });
    return PresentCenter;
}

//Override init
- (id)init {
    self = [super init];
    if (self) {
        PeopleDataSource  = [NSMutableArray new];
        PresentDataSource = [NSMutableArray new];
    }
    return self;
}

@end
