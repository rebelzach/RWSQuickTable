//
//  RWSQuickTableViewCell.h
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWSQuickTableViewCell : UITableViewCell {
  id target_;
  SEL action_;
  float height_;
  id data_;
  NSIndexPath *indexPath_;
}

@property (nonatomic, readonly) id target;
@property (nonatomic, readonly) SEL action;
@property (nonatomic, assign) float height;
@property (nonatomic, retain) id data;
@property (nonatomic, retain) NSIndexPath *indexPath;

+ (id)cellWithTitle:(NSString *)title;
+ (id)cellWithStyle:(UITableViewCellStyle)style title:(NSString *)string;

- (void)setTarget:(id)target action:(SEL)action;
- (void)trigger;

@end
