//
//  VideoCell.h
//  tutorial-app
//
//  Created by Andrew McGovern on 2/18/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;

@interface VideoCell : UITableViewCell

-(void)updateUI:(nonnull Video *)video;

@end
