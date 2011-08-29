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

@implementation RWSQuickTableView

+ (id)tableViewWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
  return [[[RWSQuickTableView alloc] initWithFrame:frame style:style] autorelease];
}

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
  self = [super initWithFrame:frame style:style];
  if (self) {
    [super setDataSource:self];
    [super setDelegate:self];
  }
  return self;
}

- (void)dealloc 
{
  RWSRelease(sections_);
  [super dealloc];
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
  [sections_ release];
  sections_ = [sections retain];
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
  return [[[[self sections] objectAtIndex:section] rows] count];
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  return [[[[[self sections] objectAtIndex:section] rows] objectAtIndex:row] height];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  NSString *header = [[[self sections] objectAtIndex:section] header];
  if (header) {
    return header;
  }
  return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
  NSString *footer = [[[self sections] objectAtIndex:section] footer];
  if (footer) {
    return footer;
  }
  return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  return [[[[self sections] objectAtIndex:section] rows] objectAtIndex:row];
  return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSInteger section = [indexPath section];
  NSInteger row = [indexPath row];
  [[[[[self sections] objectAtIndex:section] rows] objectAtIndex:row] trigger];
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
