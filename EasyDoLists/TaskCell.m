//
//  TaskCell.m
//  EasyDoLists
//
//  Created by Kyaw Myint Thein on 5/7/15.
//  Copyright (c) 2015 com.easydolists. All rights reserved.
//

#import "TaskCell.h"
#import "VBFPopFlatButton.h"
#import "UIColor+FlatColors.h"
@implementation TaskCell
- (id)initWithCoder:(NSCoder *)coder
{
    
    self = [super initWithCoder:coder];
    if (self) {
        self.contentView.backgroundColor = [UIColor clearColor];


        self.doneButton = [[VBFPopFlatButton alloc]initWithFrame:CGRectMake(0,0, 25, 25)
                                                             buttonType:buttonSquareType
                                                            buttonStyle:buttonPlainStyle
                                                  animateToInitialState:YES];
        self.isDone = false;
        self.doneButton.roundBackgroundColor = [UIColor whiteColor];
        self.doneButton.lineThickness = 2;
        self.doneButton.tintColor = [UIColor whiteColor];
        [self.doneButton addTarget:self
                                   action:@selector(doneButtonPressed)

                  forControlEvents:UIControlEventTouchUpInside];
               self.accessoryView = self.doneButton;
        
        self.alertButton = [[UIButton alloc]initWithFrame:CGRectMake(15,14, 25, 25)];
        [self.alertButton setImage: [UIImage imageNamed:@"Alarm Clock Filled-25"] forState:UIControlStateNormal];
        //[self.alertButton addTarget:self action:@selector(todayButtonPressed:) forControlEvents:UIControlEventTouchUpInside];

       // self.alertButton.roundBackgroundColor = [UIColor whiteColor];
       // self.alertButton.lineThickness = 2;
        self.alertButton.tintColor = [UIColor whiteColor];
        self.alertButton.imageView.tintColor = [UIColor clearColor];
        [self.alertButton addTarget:self
                            action:@selector(alertButtonPressed)
         
                  forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.alertButton];

        //self.accessoryView = self.alertButton;
    }
    
    return self;
}

- (void) doneButtonPressed {
    NSLog(@"Button pressed");
    if (self.isDone) {
        [self.doneButton animateToType:buttonOkType];
        self.isDone = false;
    }else{
        [self.doneButton animateToType:buttonSquareType];
        self.isDone = true;
    }
    
}

- (void) alertButtonPressed {
    NSLog(@"Alert pressed");
    if (self.isAlert) {
        UIImage *image =[UIImage imageNamed:@"Alarm Clock Filled-25"];
        [self.alertButton setImage:image forState:UIControlStateNormal];
        self.isAlert = false;
    }else{
        [self.alertButton setImage:[UIImage imageNamed:@"Alarm Clock-25"] forState:UIControlStateNormal];
         self.alertButton.imageView.tintColor =[UIColor whiteColor];
        self.isAlert = true;
    }
    
}



@end
