//
//  MasterViewController.m
//  WorldWeather
//
//  Created by RoBeRt on 15/6/11.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CityWeather.h"
#import "WeatherData.h"

@interface MasterViewController ()

@property WeatherData *weatherData;

@end

@implementation MasterViewController

- (void)awakeFromNib {
  [super awakeFromNib];
  
  if (!self.weatherData) {
    self.weatherData = [WeatherData loadFromDefaultPList];
  }
  [self prepareNavigationBarAppearance];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
  self.detailViewController.cityWeather = self.weatherData.cities[0];
  self.title = @"Cities";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.weatherData.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
  
  CityWeather *cityWeather = self.weatherData.cities[indexPath.row];
  cell.textLabel.text = cityWeather.name;
  
  return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    CityWeather *cityWeather = self.weatherData.cities[indexPath.row];
    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
    controller.cityWeather = cityWeather;
    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
  }
}

#pragma mark - Utility methods
- (void)prepareNavigationBarAppearance {
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
  }
}

@end
