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
  RWSQuickTableFieldCell *cell = [[[RWSQuickTableFieldCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                              reuseIdentifier:nil] autorelease];
  [[cell textLabel] setText:title];
  return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
  self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
  if (self) {
    CGRect textRect = CGRectMake(90, 5, 195, 34);
    RWSSmartTextField *field = [[[RWSSmartTextField alloc] initWithFrame:textRect] autorelease];
    [self setTextField:field];
    [field setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [[self textLabel] setTextAlignment:UITextAlignmentRight];
    //[field setBackgroundColor:[UIColor greenColor]];
    [[self contentView] addSubview:field];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    //Setup a default actions
    [self setTarget:self action:@selector(_genericSelectionHandler)];
  }
  return self;
}

- (void)dealloc 
{
  RWSRelease(textField_);
  [super dealloc];
}

@synthesize textField = textField_;

- (void)layoutSubviews
{
  [super layoutSubviews];
  //[[self textLabel] setBackgroundColor:[UIColor blueColor]];
  [[self textLabel] setFrame:CGRectMake(10, 4, 75, 34)];
}

- (void)_genericSelectionHandler
{
  [[self textField] becomeFirstResponder];
}

@end
