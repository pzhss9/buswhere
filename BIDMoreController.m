//
//  BIDMoreController.m
//  busComing
//
//  Created by apple on 14-9-27.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import "BIDMoreController.h"
#import "YRSideViewController.h"
#import "BIDAppDelegate.h"
@interface BIDMoreController ()

@end

@implementation BIDMoreController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableView.bounds.size.width, 0.01f)];
    
    [self.navigationController.navigationBar setBackgroundImage: [UIImage imageNamed:@"tabImage.png"] forBarMetrics:(UIBarMetricsDefault)  ];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];
    
    //添加背景图片
 
    
   
   
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.translucent = NO;
    
    self.tabBarController.tabBar.translucent = NO;
    self.navigationItem.title=@"更多";
    // 设置当前nav控制器
    BIDAppDelegate *app=[UIApplication sharedApplication].delegate;
    app.currentNavigationController = self.navigationController;
    
    BIDAppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
    YRSideViewController *sideViewController=appDelegate.sideViewController;
    sideViewController.needSwipeShowMenu=YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if(section == 0)
        return 1;
    else
        return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 21;
    }
    else
    {
        return 20;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *normalCell = @"cell";;
    BIDMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:normalCell];
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    if(row == 0 && section == 0)
    {
        cell.text.text = @"候车提醒设置";
        cell.image.image = [UIImage imageNamed:@"more2.png"];
    }
    else if(row == 0 && section == 1)
    {
        cell.text.text = @"更多城市";
        cell.image.image = [UIImage imageNamed:@"more3.png"];
    }
    else if(row == 1 && section == 1)
    {
        cell.text.text = @"公告栏";
        cell.image.image = [UIImage imageNamed:@"more4.png"];
    }
    else if(row == 2 && section == 1)
    {
        cell.text.text = @"反馈意见";
        cell.image.image = [UIImage imageNamed:@"more5.png"];
    }
    else if(row == 3 && section == 1)
    {
        cell.text.text = @"检查更新";
        cell.image.image = [UIImage imageNamed:@"more6.png"];
    }
    else if(row == 4 && section == 1)
    {
        cell.text.text = @"关于我们";
        cell.image.image = [UIImage imageNamed:@"more7.png"];
    }
    // Configure the cell...
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}/*
  // Override to support conditional editing of the table view.
  - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
  {
  // Return NO if you do not want the specified item to be editable.
  return YES;
  }
  */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

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