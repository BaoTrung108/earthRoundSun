//
//  ViewController.m
//  earthRoundSun
//
//  Created by Trung Bao on 11/16/15.
//  Copyright © 2015 Trung Bao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *sun, *earth;
    CGFloat distanceEarthSun,angle;
    NSTimer *timer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    distanceEarthSun = self.view.bounds.size.width * 0.5 - 30;
    [self addsunearth];
    timer = [NSTimer scheduledTimerWithTimeInterval:0.001
                                             target:self
                                           selector:@selector(spinEarth)
                                           userInfo:nil
                                            repeats:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) addsunearth {
    sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sun"]];
    earth = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"earth"]];
    sun.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.5);
    angle = 0.0;
    earth.center = [self positionOfEarth:angle];
    [self.view addSubview:sun];
    [self.view addSubview:earth];
}
- (CGPoint) positionOfEarth : (CGFloat) alpha {
    return CGPointMake(self.view.bounds.size.width * 0.5 + distanceEarthSun * cos(alpha),
                       self.view.bounds.size.height * 0.5 + distanceEarthSun * sin(alpha));
}
- (void) spinEarth {
    angle += 0.01;
    earth.center = [self positionOfEarth:angle];
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [timer invalidate];
    timer = nil;
}
@end
