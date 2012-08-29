//
//  RWSQuickTable.h
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RWSTableSection.h"
#import "RWSQuickTableViewCell.h"
#import "RWSQuickTableFieldCell.h"
#import "RWSSmartTextField.h"

@interface RWSQuickTableView : UITableView <UITableViewDelegate, UITableViewDataSource> {
  BOOL keyboardAware_;
  NSArray *sections_;
  struct {
    unsigned displayingKeyboard : 1;
  } flags;
}

@property (nonatomic, assign, getter = isKeyboardAware) BOOL keyboardAware;
@property (nonatomic, strong) NSArray *sections;

+ (id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
