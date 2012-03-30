//
//  ViewController.h
//  BarButtonItemFlipAnimation
//
//  Created by Mike Keller on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UIView *view0;
    IBOutlet UIView *view1;
    
    UIButton *barButton;
}

@property (nonatomic, strong) UIButton *barButton;

@end
