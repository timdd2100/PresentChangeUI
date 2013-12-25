//
//  Present.m
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import "Present.h"

@implementation Present

-(id) initWithName:(NSString *)name
{
    self = [super init];
    if (self) {
        self.Name = name;
    }
    return self;
}

-(NSString *)getName
{
    return self.Name;
}


@end
