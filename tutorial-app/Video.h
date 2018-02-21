//
//  Video.h
//  tutorial-app
//
//  Created by Andrew McGovern on 2/19/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject

@property(nonatomic, strong) NSString *videoTitle;
@property(nonatomic, strong) NSString *videoDescription;
@property(nonatomic, strong) NSString *videoIframe;
@property(nonatomic, strong) NSString *thumbnailUrl;

@end
