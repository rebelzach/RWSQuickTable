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
  NSMutableArray *sections_;
}

@property (nonatomic, retain) NSArray *sections;

+ (id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style;

@end
