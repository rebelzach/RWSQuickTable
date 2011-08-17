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
  return [[[RWSTableSection alloc] init] autorelease];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)dealloc 
{
  RWSRelease(footer_);
  RWSRelease(header_);
  RWSRelease(rows_);
  [super dealloc];
}

@synthesize footer = footer_;
@synthesize header = header_;
@synthesize rows = rows_;

@end
