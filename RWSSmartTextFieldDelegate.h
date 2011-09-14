//
//  RWSSmartTextFieldDelegate.h
//  Forms
//
//  Created by Zach Starkebaum on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWSSmartTextFieldDelegate : NSObject <UITextFieldDelegate> {
  BOOL returnShouldDismiss_;
}

@property (nonatomic, assign) BOOL returnShouldDismiss;

@end
