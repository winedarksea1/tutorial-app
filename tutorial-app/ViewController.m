//
//  ViewController.m
//  tutorial-app
//
//  Created by Andrew McGovern on 2/17/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService instance] getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
        if (dataDict) {
            NSLog(@"Dictionary: %@", dataDict.debugDescription);
        } else if (errMessage) {
            // Display alert to user
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
