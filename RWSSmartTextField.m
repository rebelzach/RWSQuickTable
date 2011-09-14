//
//  RWSTextFieldSelfDismissing.m
//  Forms
//
//  Created by Zach Starkebaum on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSSmartTextField.h"
#import "RWSSmartTextFieldDelegate.h"

@implementation RWSSmartTextField 

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.returnKeyType = UIReturnKeyDone;
    [self setHelperDelegate:[[[RWSSmartTextFieldDelegate alloc] init] autorelease]];
    [self setDelegate:self.helperDelegate];
  }
  return self;
}

@synthesize helperDelegate = helperDelegate_;

- (void)dealloc
{
  RWSRelease(helperDelegate_);
  RWSDestroyingSelf();
  [super dealloc];
}

- (void)setReturnShouldDismiss:(BOOL)returnShouldDismiss
{
  [[self helperDelegate] setReturnShouldDismiss:returnShouldDismiss];
}

- (BOOL)returnShouldDismiss
{
  return [[self helperDelegate] returnShouldDismiss];
}

@end
