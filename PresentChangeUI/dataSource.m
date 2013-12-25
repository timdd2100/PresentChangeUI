//
//  dataSource.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "dataSource.h"

static dataSource *source;




@implementation dataSource
@synthesize PeopleDataSource,PresentDataSource;

/*
 singleton-class
 
 讓大家共用它的資源
 */

+(id)getDataSource
{
    if(source == Nil)
    {
        source = [[dataSource alloc] init];
        source.PeopleDataSource = [NSMutableArray new];
        source.PresentDataSource = [NSMutableArray new];
    }
    return source;
}

-(NSMutableArray *)getPeopleDataSource
{
    return PeopleDataSource;
}

-(NSMutableArray *)getPresentDataSource
{
    return PresentDataSource;
}

@end
