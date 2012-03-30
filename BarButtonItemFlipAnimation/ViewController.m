//
//  ViewController.m
//  BarButtonItemFlipAnimation
//
//  Created by Mike Keller on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  Demonstrates a very basic test case for transitioning between two full-screens views and flipping the bar button in parallel.
//    (like the Music/iPod app). Obviously, this can be embellished upon by using custom graphics rather than solid color 
//    UIViews :)
//

#import "ViewController.h"

#define kFlipDuration 0.7

@interface ViewController ()
- (void) toggleAction:(id)sender;
- (void) flipButton:(id)sender;

@end

@implementation ViewController

@synthesize barButton;

#pragma mark - Actions

- (void) flipButton:(id)sender {
    
    [self.barButton setBackgroundColor:view1.backgroundColor];    

    barButton.backgroundColor = view1.backgroundColor;
    [UIView transitionWithView:barButton
                      duration:kFlipDuration
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{
                        
                    } completion:NULL];
    
}

- (void) toggleAction:(id)sender {
    //View 1 Showing, Show View 0
    if (view0.hidden) {
        
        [UIView transitionWithView:self.view
                          duration:kFlipDuration
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            view0.hidden = NO;
                            view1.hidden = YES;
                            
                        } completion:NULL];
        
        self.title = @"View 0";
        
        barButton.backgroundColor = view1.backgroundColor;
        [UIView transitionWithView:barButton
                          duration:kFlipDuration
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            
                        } completion:NULL];
        
    //View 0 Showing, Show View 1
    } else {
        [UIView transitionWithView:self.view
                          duration:kFlipDuration
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            view0.hidden = YES;
                            view1.hidden = NO;                          
                            
                        } completion:NULL];
        
        self.title = @"View 1";  
        
        barButton.backgroundColor = view0.backgroundColor;
        [UIView transitionWithView:barButton
                          duration:kFlipDuration
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                        } completion:NULL];
        
    }
}

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"View 0";
    
    UIView *buttonContainer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    buttonContainer.backgroundColor = [UIColor darkGrayColor];
    
    self.barButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.barButton.frame = CGRectMake(0, 0, 30, 30);
    [self.barButton setBackgroundColor:view0.backgroundColor];
    [self.barButton addTarget:self action:@selector(toggleAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [buttonContainer addSubview:self.barButton];
    
    UIBarButtonItem *toggleButton = [[UIBarButtonItem alloc] initWithCustomView:buttonContainer];
    self.navigationItem.rightBarButtonItem = toggleButton;
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(flipButton:) withObject:nil afterDelay:0.3f];
    
}

- (void)viewDidUnload {
    
    self.barButton = nil;
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
