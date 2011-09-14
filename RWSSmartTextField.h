//
//  RWSTextFieldSelfDismissing.h
//  Forms
//
//  Created by Zach Starkebaum on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RWSSmartTextFieldDelegate;

@interface RWSSmartTextField : UITextField {
  RWSSmartTextFieldDelegate *helperDelegate_;

}
@property (nonatomic, retain) RWSSmartTextFieldDelegate *helperDelegate;
@property (nonatomic, assign) BOOL returnShouldDismiss;

@end
