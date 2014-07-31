//
//  ViewController.h
//  BCPicker
//
//  Created by Nicole Zhu on 7/30/14.
//  Copyright (c) 2014 IDEO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIView *dropTargetLeft;
@property (nonatomic, strong) IBOutlet UIView *dropTargetMiddle;
@property (nonatomic, strong) IBOutlet UIView *dropTargetRight;

@property (nonatomic, strong) UIImageView *dragObject;
@property (nonatomic, assign) CGPoint touchOffset;
@property (nonatomic, assign) CGPoint homePosition;
@end