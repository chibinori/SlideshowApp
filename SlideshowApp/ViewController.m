//
//  ViewController.m
//  SlideshowApp
//
//  Created by 酒井紀明 on 2015/12/02.
//  Copyright © 2015年 noriaki.sakai. All rights reserved.
//

#import "ViewController.h"

static const NSInteger kImageCounts = 4;
@interface ViewController () {
    UIImageView *aImageView;
    NSInteger countNumber;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    countNumber = 0;
    [self setupBackground];
    [self setupPrevButton];
    [self setupNextButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupBackground{
    aImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    aImageView.image = [UIImage imageNamed:@"flower0.png"];
    [self.view addSubview:aImageView];
}

-(void)setupPrevButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 120, 45);
    button.center = CGPointMake(80, 450);
    [button setTitle:@"Prev" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeImageToPrev:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)setupNextButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 120, 45);
    button.center = CGPointMake(240, 450);
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeImageToNext:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}


-(void)changeImageToPrev:(id)sender{
    if (countNumber == 0) {
        countNumber = kImageCounts -1;
    } else {
        countNumber--;
    }
    [self changeImage];
}

-(void)changeImageToNext:(id)sender{
    countNumber++;
    [self changeImage];
}

-(void)changeImage {
    countNumber %= kImageCounts;
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"flower%ld.png",(long)countNumber]];
}


@end
