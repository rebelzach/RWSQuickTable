//
//  RWSTableSection.m
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSTableSection.h"

@implementation RWSTableSection

+ (id)section
{
  return [[RWSTableSection alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}


@synthesize footer = footer_;
@synthesize header = header_;
@synthesize rows = rows_;

@end
