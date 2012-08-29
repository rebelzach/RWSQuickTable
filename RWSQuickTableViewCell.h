//
//  RWSQuickTableViewCell.h
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWSQuickTableViewCell : UITableViewCell

@property (nonatomic, assign) float height;
@property (nonatomic, strong) id data;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, copy) void (^triggerBlock)(RWSQuickTableViewCell *selectedCell);
+ (id)cellWithTitle:(NSString *)title;
+ (id)cellWithStyle:(UITableViewCellStyle)style title:(NSString *)string;

- (void)trigger;

@end
