//
//  ViewController.m
//  FQBarrageEffect
//
//  Created by 冯倩 on 16/9/18.
//  Copyright © 2016年 冯倩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer     *_timer;
    NSArray     *_dataArray;
    UISwitch    *_switch;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self LayoutUI];
    [self InitData];
}

- (void)dealloc
{
    _timer = nil;
    _dataArray = nil;
    _switch = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - LayoutUI
- (void)LayoutUI
{
    _switch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _switch.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 * 2);
    [_switch addTarget:self action:@selector(switchActions) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switch];
}

#pragma mark - InitData
- (void)InitData
{
    _dataArray = @[@"666",@"男主好帅",@"这女的太坏了吧",@"呵呵哒",@"虐心",@"一代神剧啊",@"无力吐槽",@"11111111111111",@"编辑真是脑洞大开",@"赞导演",@"好看好看!",@"睡着了",@"222",@"乌鸦飞过......."];
}

#pragma mark - Actions
- (void)switchActions
{
    if (_switch.on == NO)//关闭
    {
        [_timer invalidate];
        _timer = nil;
    }
    else//打开
    {
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(timerMethods) userInfo:nil repeats:YES];
    }
    
}

#pragma mark - Methods
- (void)timerMethods
{
    UILabel *barrageLabel = [[UILabel alloc] init];
    barrageLabel.text = [_dataArray objectAtIndex:rand()%_dataArray.count];
    barrageLabel.textColor = [self randomColor];
    [barrageLabel sizeToFit];
    barrageLabel.frame = CGRectMake([UIScreen mainScreen].bounds.size.width + 10, rand()%250, barrageLabel.frame.size.width, 30);
    [self.view addSubview:barrageLabel];
    
    [UIView animateWithDuration:5 animations:^
    {
        barrageLabel.frame = CGRectMake(-barrageLabel.frame.size.width - 10, barrageLabel.frame.origin.y, barrageLabel.frame.size.width, barrageLabel.frame.size.height);
        
    }completion:^(BOOL finished)
    {
        [barrageLabel removeFromSuperview];
    }];
    
}

-(UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}



@end
