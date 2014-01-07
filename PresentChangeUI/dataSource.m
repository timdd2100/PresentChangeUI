//
//  dataSource.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "dataSource.h"
<<<<<<< HEAD
=======





>>>>>>> 30d8816041ded5c8f1125e5a3311e56901d1e8f0
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
<<<<<<< HEAD
    //利用ＧＣＤ dispatch_once 只做一次的特性
    dispatch_once(&onceToken, ^{
        PresentCenter = [[self alloc] init];
    });
    return PresentCenter;
}

//Override init
- (id)init {
=======
    static dataSource *PresentCenter = Nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        PresentCenter = [[dataSource alloc] init];
    });
    
    return PresentCenter;
}

-(id)init
{
>>>>>>> 30d8816041ded5c8f1125e5a3311e56901d1e8f0
    if (self = [super init]) {
        self.PeopleDataSource = [NSMutableArray new];
        self.PresentDataSource = [NSMutableArray new];
    }
    return self;
}
<<<<<<< HEAD
=======

>>>>>>> 30d8816041ded5c8f1125e5a3311e56901d1e8f0

@end
