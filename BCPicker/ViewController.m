//
//  ViewController.m
//  BCPicker
//
//  Created by Nicole Zhu on 7/30/14.
//  Copyright (c) 2014 IDEO. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize dropTargetLeft;
@synthesize dropTargetMiddle;
@synthesize dropTargetRight;
@synthesize dragObject;
@synthesize touchOffset;
@synthesize homePosition;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([touches count] == 1) {
        // one finger
        CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
        for (UIImageView *iView in self.view.subviews) {
            if ([iView isMemberOfClass:[UIImageView class]]) {
                if (touchPoint.x > iView.frame.origin.x &&
                    touchPoint.x < iView.frame.origin.x + iView.frame.size.width &&
                    touchPoint.y > iView.frame.origin.y &&
                    touchPoint.y < iView.frame.origin.y + iView.frame.size.height)
                {
                    self.dragObject = iView;
                    self.touchOffset = CGPointMake(touchPoint.x - iView.frame.origin.x,
                                                   touchPoint.y - iView.frame.origin.y);
                    self.homePosition = CGPointMake(iView.frame.origin.x,
                                                    iView.frame.origin.y);
                    [self.view bringSubviewToFront:self.dragObject];
                }
            }
        }
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    CGRect newDragObjectFrame = CGRectMake(touchPoint.x - touchOffset.x,
                                           touchPoint.y - touchOffset.y,
                                           self.dragObject.frame.size.width,
                                           self.dragObject.frame.size.height);
    self.dragObject.frame = newDragObjectFrame;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (touchPoint.x > self.dropTargetLeft.frame.origin.x &&
        touchPoint.x < self.dropTargetLeft.frame.origin.x + self.dropTargetLeft.frame.size.width &&
        touchPoint.y > self.dropTargetLeft.frame.origin.y &&
        touchPoint.y < self.dropTargetLeft.frame.origin.y + self.dropTargetLeft.frame.size.height )
    {
        self.dropTargetLeft.backgroundColor = self.dragObject.backgroundColor;
        
    } else if (touchPoint.x > self.dropTargetMiddle.frame.origin.x &&
               touchPoint.x < self.dropTargetMiddle.frame.origin.x + self.dropTargetMiddle.frame.size.width &&
               touchPoint.y > self.dropTargetMiddle.frame.origin.y &&
               touchPoint.y < self.dropTargetMiddle.frame.origin.y + self.dropTargetMiddle.frame.size.height){
        self.dropTargetMiddle.backgroundColor = self.dragObject.backgroundColor;

        
    } else if (touchPoint.x > self.dropTargetRight.frame.origin.x &&
               touchPoint.x < self.dropTargetRight.frame.origin.x + self.dropTargetRight.frame.size.width &&
               touchPoint.y > self.dropTargetRight.frame.origin.y &&
               touchPoint.y < self.dropTargetRight.frame.origin.y + self.dropTargetRight.frame.size.height){
        self.dropTargetRight.backgroundColor = self.dragObject.backgroundColor;

    }
    self.dragObject.frame = CGRectMake(self.homePosition.x, self.homePosition.y,
                                       self.dragObject.frame.size.width,
                                       self.dragObject.frame.size.height);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
