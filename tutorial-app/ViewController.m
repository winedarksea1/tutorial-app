//
//  ViewController.m
//  tutorial-app
//
//  Created by Andrew McGovern on 2/17/18.
//  Copyright © 2018 Andrew McGovern. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"
#import "VideoVC.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.videoList = [[NSArray alloc] init];
    
    [[HTTPService instance] getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
        if (dataArray) {
            NSMutableArray *arr = [[NSMutableArray alloc] init];
            
            for (NSDictionary *d in dataArray) {
                Video *vid = [[Video alloc] init];
                vid.videoTitle = [d objectForKey:@"title"];
                vid.videoDescription = [d objectForKey:@"description"];
                vid.videoIframe = [d objectForKey:@"iframe"];
                vid.thumbnailUrl = [d objectForKey:@"thumbnail"];
                
                [arr addObject:vid];
            }
            
            self.videoList = arr;
            [self updateTableData];
            
        } else if (errMessage) {
            // Display alert to user
        }
    }];
}

-(void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VideoCell *cell = (VideoCell *) [tableView dequeueReusableCellWithIdentifier:@"main"];
    if (!cell) {
        cell = [[VideoCell alloc] init];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    VideoCell *vidCell = (VideoCell *) cell;
    [vidCell updateUI:video];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"VideoVC" sender:video];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.videoList.count;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VideoVC *vc = (VideoVC *) segue.destinationViewController;
    Video *video = (Video *) sender;
    
    vc.video = video;
}

@end
