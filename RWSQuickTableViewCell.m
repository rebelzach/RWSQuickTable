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
  RWSQuickTableViewCell *cell = [[RWSQuickTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                              reuseIdentifier:nil];
  [[cell textLabel] setText:title];
  return cell;
}

+ (id)cellWithStyle:(UITableViewCellStyle)style title:(NSString *)title
{
  RWSQuickTableViewCell *cell = [[RWSQuickTableViewCell alloc] initWithStyle:style
                                            reuseIdentifier:nil];
  [[cell textLabel] setText:title];
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      _height = 44.0;
    }
    return self;
}

@synthesize indexPath = indexPath_;
@synthesize data = data_;

- (void)trigger
{
  if (_triggerBlock) {
    _triggerBlock(self);
  }
}

@end
