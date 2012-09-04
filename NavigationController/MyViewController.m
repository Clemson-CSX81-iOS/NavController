//
//  ViewController.m
//  NavigationController
//
//  Created by DJ Edmonson on 6/19/12.
//  Copyright (c) 2012 Clemson University. All rights reserved.
//

#import "MyViewController.h"

@implementation MyViewController

#pragma mark - Property Syntheses
@synthesize numberLable = _numberLable;
@synthesize animatedSwitch = _animatedSwitch;
@synthesize animated = _animated;


#pragma mark - Methods
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark UIEvent Methods

/** This method is used to setup and push the next ViewController.
    The next ViewController is created from the storyboard file and then the properties are
    set based on the properties of the current ViewController. Then the navigation controller
    is instructed to push the new ViewController.
    The UISwitch `animatedSwitch` controlls if the transition is animated or not.
 */
- (IBAction)nextView:(id)sender {
    MyViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"numberView"];
    
    //NSStrings can be formated just like printf statemtents
    vc.title = [NSString stringWithFormat:@"%d",[self.title intValue]+1];
    vc.animated = self.animatedSwitch.on;
    
    [self.navigationController pushViewController:vc animated:self.animatedSwitch.on];
}

/** This method is used to return to the previous ViewController.
    This is done by telling the navigationController to pop the current ViewContoller off 
    of its ViewController stack.
    The UISwitch `animatedSwitch` controlls if the transition is animated or not.
 */
- (IBAction)prevView:(id)sender {
    UINavigationController *navC = self.navigationController;
    
    NSInteger len = navC.viewControllers.count;
    
    MyViewController *mvc = nil;
    
    if(len >= 2)
        mvc = (MyViewController*)[navC.viewControllers objectAtIndex:len-2];
    
    mvc.animated = self.animatedSwitch.on;
    
    [navC popViewControllerAnimated:self.animatedSwitch.on];
}

/** This method is used to return to the root ViewController.
    This is done by telling the navigationContoller to pop all the ViewContollers off the
    stack except for the Root ViewContoller.
    The UISwitch `animatedSwitch` controlls if the transition is animated or not.
 */
- (IBAction)reset:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:self.animatedSwitch.on];
}

#pragma mark View Livecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.numberLable.text = self.title;
    self.animatedSwitch.on = self.animated;
}

- (void)viewDidUnload
{
    // Release any retained subviews of the main view.
    [self setNumberLable:nil];
    [self setAnimatedSwitch:nil];
    [super viewDidUnload];
}

@end
