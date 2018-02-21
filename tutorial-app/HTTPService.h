//
//  HTTPService.h
//  tutorial-app
//
//  Created by Andrew McGovern on 2/17/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);

@interface HTTPService : NSObject

+(id)instance;
-(void)getTutorials: (nullable onComplete)completionHandler;

@end
