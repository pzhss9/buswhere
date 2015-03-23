//
//  BIDChaxun.m
//  busComing
//
//  Created by apple on 14-9-10.
//  Copyright (c) 2014年 com.pzh. All rights reserved.
//
#import "BIDChooseCityController.h"
#import "BIDChaxun.h"
#import "BIDAppDelegate.h"
#import "YRSideViewController.h"
#import "BIDSecondLevelViewController.h"
#import "BIDAppDelegate.h"
@interface BIDChaxun ()

@end

@implementation BIDChaxun

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
       self.navigationController.navigationBar.topItem.title=@"车来了";
    // 设置当前nav控制器
    BIDAppDelegate *app=[UIApplication sharedApplication].delegate;
    app.currentNavigationController = self.navigationController;
    //设置可以滑动查看
    
    BIDAppDelegate *appDelegate=[UIApplication sharedApplication].delegate;
    YRSideViewController *sideViewController=appDelegate.sideViewController;
    sideViewController.needSwipeShowMenu=YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage: [UIImage imageNamed:@"tabImage.png"] forBarMetrics:(UIBarMetricsDefault)  ];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:UITextAttributeTextColor];

   
   
    
    //设置返回文字的颜色
    [self.tabBarController.tabBar setSelectedImageTintColor:[UIColor colorWithRed:255/255.0 green:80/255.0 blue:0/255.0 alpha:1]];
    //设置背景
    /*[self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:255/255.0 green:220/255.0 blue:0/255.0 alpha:1]];*/
    /*NSDictionary *attributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil];*/
    //[self.navigationController.navigationBar setTitleTextAttributes:attributes];
    self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:255/255.0 green:80/255.0 blue:0/255.0 alpha:1];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.bus=@[@"K7",@"900路",@"28路",@"10路"];
    self.data=@[@"K7",@"900路",@"28路",@"10路"];
    self.navigationController.navigationBar.translucent = NO;

    self.searchBar.delegate=self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)tipHeadButton:(id)sender
{
    BIDAppDelegate *app=[UIApplication sharedApplication].delegate;
    [app.sideViewController showLeftViewController:YES];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
  
    return [self.bus count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"bze"];
       cell = [tableView dequeueReusableCellWithIdentifier:@"bze"];
    UIImageView * img= (UIImageView *)[cell viewWithTag:1];
    UILabel *title =(UILabel *)[cell viewWithTag:2];
    UILabel *detail=(UILabel *) [cell viewWithTag:3];
    title.text=self.bus[indexPath.row];
    
   
    // Configure the cell...

    return cell;
}
-(void )searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchBar.text isEqualToString:@""]) {
        self.bus=self.data;
    }
    else
    {
    NSPredicate * pred=[NSPredicate predicateWithFormat:@"self contains[c] %@",searchBar.text];
    self.bus =[_data filteredArrayUsingPredicate:pred];
   // [self.searchBar resignFirstResponder];
    }
    [self.tableView reloadData];
    
}
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}
-(void )searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    NSPredicate * pred=[NSPredicate predicateWithFormat:@"self contains[c] %@",searchBar.text];
    self.bus =[_data filteredArrayUsingPredicate:pred];
    [self.searchBar resignFirstResponder];
    [self.tableView reloadData];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
   BIDSecondLevelViewController  *sec= [storyboard instantiateViewControllerWithIdentifier:@"mapviewcontroller"];
    sec.BusName=self.bus[indexPath.row];
    //BIDSecondLevelViewController *sec=[[BIDSecondLevelViewController alloc]init];
      [self.navigationController pushViewController:sec animated:YES];
}

-(IBAction)selectCityButton:(id)sender
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(getCityName:)                                                 name:@"GetCityName"
                                               object:nil] ;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    BIDChooseCityController *sec= [storyboard instantiateViewControllerWithIdentifier:@"getCityName"];
    [self.navigationController pushViewController:sec animated:YES];
    
    
    
}
-(void )getCityName:(NSDictionary*)data
{
    NSDictionary *data2=[data valueForKey:@"userInfo"];
    
    NSString *cityName=[data2 valueForKey:@"cityName"];
    //NSLog(@"收到了：%@",cityName);
    [self.cityButton setTitle:cityName forState:UIControlStateNormal];
}
/*
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
