//
//  RWSQuickTableViewCell.m
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSQuickTableViewCell.h"

@implementation RWSQuickTableViewCell

+ (id)cellWithTitle:(NSString *)title
{
  RWSQuickTableViewCell *cell = [[[RWSQuickTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                              reuseIdentifier:nil] autorelease];
  [[cell textLabel] setText:title];
  return cell;
}

+ (id)cellWithStyle:(UITableViewCellStyle)style title:(NSString *)title
{
  RWSQuickTableViewCell *cell = [[[RWSQuickTableViewCell alloc] initWithStyle:style
                                            reuseIdentifier:nil] autorelease];
  [[cell textLabel] setText:title];
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      target_ = nil;
      action_ = @selector(class); // Harmless selector
      height_ = 44.0;
    }
    return self;
}

- (void)dealloc 
{
  [super dealloc];
}

@synthesize target = target_;
@synthesize action = action_;

- (void)setTarget:(id)target action:(SEL)action
{
  target_ = target;
  action_ = action;
}

- (void)trigger
{
  NSMethodSignature *signature = [[self target] methodSignatureForSelector:[self action]];
  if ([signature numberOfArguments] == 2) {
    [[self target] performSelector:[self action]];
  }
}

@synthesize height = height_;

@end
