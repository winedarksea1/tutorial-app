//
//  VideoVC.h
//  tutorial-app
//
//  Created by Andrew McGovern on 2/21/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoVC : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) Video *video;

@end
