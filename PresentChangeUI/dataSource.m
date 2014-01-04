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

+(id)getDataSource
{
    static dataSource *PresentCenter = Nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PresentCenter = [[dataSource alloc] init];
    });
    
    return PresentCenter;
}

-(id)init
{
    if (self = [super init]) {
        self.PeopleDataSource = [NSMutableArray new];
        self.PresentDataSource = [NSMutableArray new];
    }
    return self;
}


@end
