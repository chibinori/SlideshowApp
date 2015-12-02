//
//  ViewController.m
//  SlideshowApp
//
//  Created by 酒井紀明 on 2015/12/02.
//  Copyright © 2015年 noriaki.sakai. All rights reserved.
//

#import "ViewController.h"

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
    [self setupButton];
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

-(void)setupButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 120, 45);
    button.center = CGPointMake(160, 450);
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeImageUsingIf:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)changeImageUsingIf:(id)sender{
    countNumber++;
    aImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"flower%ld.png",(long)countNumber]];
    if (countNumber==3) {
        countNumber = 0;
    }
}

@end
