//
//  BIDLeftViewController.m
//  busComing
//
//  Created by apple on 14-10-30.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//

#import "BIDLeftViewController.h"
#import "BIDAppDelegate.h"
@interface BIDLeftViewController ()

@end

@implementation BIDLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    //初始化登入标记
    self.isLogin=NO;
    
    //增加tableView 背景图片
    UIImageView *img=[[UIImageView alloc]init];
    img.image=[UIImage imageNamed:@"background.png"];
    [self.tableView setBackgroundView:img];
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated
{
    //使导航栏隐藏
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/
//按下条目后的事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    if(indexPath.row==1)
   {
      UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
       UIViewController *loginMode= [storyboard instantiateViewControllerWithIdentifier:@"gexingqianming"];
       BIDAppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
       [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(getGeXingQianMing:)//回调函数
                                                    name:@"GETGEXINGQIANMING"//声明一个消息名称
                                                  object:nil];
       [appDelegate.sideViewController hideSideViewController:YES];
       [appDelegate.currentNavigationController pushViewController:loginMode animated:YES];
       
       
   }
    
}
-(void)getGeXingQianMing:(NSDictionary *)data
{
   // NSLog(@"%@",data);
   NSDictionary *userInfo=[data valueForKey:@"userInfo"];
   NSString *geXingQianMing=[userInfo valueForKey:@"qianming"];
    self.gexingqianming.text=geXingQianMing;
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
