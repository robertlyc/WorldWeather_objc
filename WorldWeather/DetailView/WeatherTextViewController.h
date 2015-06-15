//
//  WeatherTextViewController.h
//  WorldWeather
//
//  Created by RoBeRt on 15/6/11.
//  Copyright (c) 2015年 RoBeRt. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CityWeather;

@interface WeatherTextViewController : UIViewController

@property (nonatomic, strong) CityWeather *cityWeather;
@property (nonatomic, weak) IBOutlet UILabel *cityNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *temperatureLabel;

@end
