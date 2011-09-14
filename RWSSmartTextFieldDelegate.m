//
//  RWSSmartTextFieldDelegate.m
//  Forms
//
//  Created by Zach Starkebaum on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSSmartTextFieldDelegate.h"
#import "RWSSmartTextFieldDelegate.h"

@implementation RWSSmartTextFieldDelegate

- (id)init
{
  self = [super init];
  if (self) {
    returnShouldDismiss_ = YES;
  }
  return self;
}

@synthesize returnShouldDismiss = returnShouldDismiss_;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  if (self.returnShouldDismiss) {
    [textField resignFirstResponder];
    return NO;
  }
  return YES;
}

@end
