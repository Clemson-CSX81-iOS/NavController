//
//  ViewController.h
//  NavigationController
//
//  Created by DJ Edmonson on 6/19/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController

@property (assign, nonatomic) BOOL animated; // Primitives are assigned
@property (strong, nonatomic) IBOutlet UILabel *numberLable;
@property (strong, nonatomic) IBOutlet UISwitch *animatedSwitch;

- (IBAction)nextView:(id)sender;
- (IBAction)prevView:(id)sender;
- (IBAction)reset:(id)sender;

@end