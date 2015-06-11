//
//  DetailViewController.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/11.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityWeather.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) CityWeather *cityWeather;
@property (nonatomic, weak) IBOutlet UIImageView *weatherIconImageView;

@end
