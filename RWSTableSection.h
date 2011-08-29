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

@property (nonatomic, retain) NSString *footer;
@property (nonatomic, retain) NSString *header;
@property (nonatomic, retain) NSArray *rows;

+ (id)section;

@end
