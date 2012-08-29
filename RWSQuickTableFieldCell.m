//
//  RWSQuickTableFieldCell.m
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSQuickTableFieldCell.h"

@implementation RWSQuickTableFieldCell

+ (id)cellWithTitle:(NSString *)title
{
  RWSQuickTableFieldCell *cell = [[RWSQuickTableFieldCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                              reuseIdentifier:nil];
  [[cell textLabel] setText:title];
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  if (self) {
    CGRect textRect = CGRectMake(90, 5, 195, 34);
    RWSSmartTextField *field = [[RWSSmartTextField alloc] initWithFrame:textRect];
    [self setTextField:field];
    [field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [[self textLabel] setTextAlignment:UITextAlignmentRight];
    //[field setBackgroundColor:[UIColor greenColor]];
    [[self contentView] addSubview:field];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //Setup a default actions
    [self setTriggerBlock:^(id selectedCell) {
      [selectedCell _genericSelectionHandler];
    }];
  }
  return self;
}


@synthesize textField = textField_;

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  // Position debugging
# if 0
  [[self textField] setBackgroundColor:[UIColor blueColor]];
# endif
  
  CGRect textFieldFrame = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(4, 90, 6, 30));
  [[self textField] setFrame:textFieldFrame];
  [[self textLabel] setFrame:CGRectMake(10, 4, 75, 34)];
}

- (void)_genericSelectionHandler
{
  [[self textField] becomeFirstResponder];
}

@end
