//
//  Present.h
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Present : NSObject
@property NSString  *Name;

-(id)initWithName: (NSString *)name;

-(NSString *) getName;

@end