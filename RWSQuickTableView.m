//
//  RWSQuickTable.m
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RWSQuickTableView.h"
#import "RWSTableSection.h"
#import "RWSQuickTableViewCell.h"

@interface RWSQuickTableView (/*Private*/)
- (void)_RWSKeyboardDidShow:(NSNotification *)notification;
- (void)_RWSKeyboardWillHide:(NSNotification *)notification;
- (void)_doInit;
@end

@implementation RWSQuickTableView

+ (id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
  return [[RWSQuickTableView alloc] initWithFrame:frame style:style];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
  self = [super initWithFrame:frame style:style];
  if (self) {
    [self _doInit];
  }
  return self;
}

@synthesize keyboardAware = keyboardAware_;

- (void)awakeFromNib
{
  [super awakeFromNib];
  [self _doInit];
}

- (void)_doInit
{
  [super setDataSource:self];
  [super setDelegate:self];
  flags.displayingKeyboard = 0;
  keyboardAware_ = NO;
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_RWSKeyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_RWSKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc 
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@synthesize sections = sections_;
- (NSArray *)sections
{
  if (!sections_) {
    sections_ = [[NSArray alloc] init];
  }
  return sections_;
}

- (void)setSections:(NSArray *)sections
{
  sections_ = sections;
  [self reloadData];
}

- (void)setDelegate:(id<UITableViewDelegate>)delegate
{
  return;
}

- (void)setDataSource:(id<UITableViewDataSource>)dataSource
{
  return;
}

#pragma mark -
#pragma mark UITableView Delegate and DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [[self sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [[[self sections][section] rows] count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  return [[[self sections][section] rows][row] height];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  NSString *header = [[self sections][section] header];
  if (header) {
    return header;
  }
  return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
  NSString *footer = [[self sections][section] footer];
  if (footer) {
    return footer;
  }
  return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  [[[self sections][section] rows][row] setIndexPath:indexPath];
  return [[self sections][section] rows][row];
  return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  [[[self sections][section] rows][row] trigger];
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark Keyboard Awareness

- (void)_RWSKeyboardDidShow:(NSNotification *)notification
{
  if (![self isKeyboardAware]) {
    return;
  }
  UIView *mainView = [[[UIApplication sharedApplication] keyWindow] subviews][0];
  CGSize keyboardSize = [[[notification userInfo] valueForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
  CGRect selfLogicalRect = [mainView convertRect:[self bounds] fromView:self];
  CGRect windowFrame = [mainView bounds];
  CGFloat keyboardHeight = 0;
  if (keyboardSize.width > keyboardSize.height) { // infer portriat
    keyboardHeight = keyboardSize.height; 
  } else { // landscape
    keyboardHeight = keyboardSize.width;
  }
  
  CGFloat frameOffset = windowFrame.size.height - CGRectGetMaxY(selfLogicalRect);
  CGFloat bottomInset = keyboardHeight - frameOffset;
  
  if (bottomInset > 0) { // Check to make sure they will collide
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, bottomInset, 0.0);
    self.contentInset = contentInsets;
    self.scrollIndicatorInsets = contentInsets; 
    [UIView commitAnimations];
  }
}

- (void)_RWSKeyboardWillHide:(NSNotification *)notification
{
  if (![self isKeyboardAware]) {
    return;
  }
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:[[[notification userInfo] valueForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue]];
  UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);
  self.contentInset = contentInsets;
  self.scrollIndicatorInsets = contentInsets;
  [UIView commitAnimations];
}

@end
