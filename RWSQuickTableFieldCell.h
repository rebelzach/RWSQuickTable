//
//  RWSQuickTableFieldCell.h
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWSQuickTableViewCell.h"
#import "RWSSmartTextField.h"

@interface RWSQuickTableFieldCell : RWSQuickTableViewCell {
  RWSSmartTextField *textField_;
}

@property (nonatomic, retain) RWSSmartTextField *textField;

@end
