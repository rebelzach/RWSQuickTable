//
//  RWSTableSection.h
//  Forms
//
//  Created by Zach Starkebaum on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RWSTableSection : NSObject {
 @private
  NSArray *rows_;
  NSString *footer_;
  NSString *header_;
}

@property (nonatomic, strong) NSString *footer;
@property (nonatomic, strong) NSString *header;
@property (nonatomic, strong) NSArray *rows;

+ (id)section;

@end
