//
//  BIDHuanChengViewController.m
//  busComing
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//
#define MYBUNDLE [NSBundle bundleWithPath: MYBUNDLE_PATH]
#import "BIDHuanChengViewController.h"

@interface BIDHuanChengViewController ()

@end

@implementation BIDHuanChengViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)tipBackground:(id)sender
{
    [self.beginText resignFirstResponder];
    [self.tagartText resignFirstResponder];

}
- (void)viewDidLoad
{
    [super viewDidLoad];
       // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
