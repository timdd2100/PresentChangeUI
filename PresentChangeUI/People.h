//
//  People.h
//  PresentChangeUI
//
//  Created by timkao on 13/12/25.
//  Copyright (c) 2013年 skl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject

@property NSString  *Name;
@property id OwnPresent;

-(id)initWithName: (NSString *)name;

-(NSString *) getName;



@end
