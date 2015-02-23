//
//  ViewController.h
//  keys
//
//  Created by Alex Babich on 2/22/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *debugLabel;

@property (weak, nonatomic) IBOutlet UILabel *key;

@property (weak, nonatomic) IBOutlet UITextField *text_field;

- (IBAction)key1:(id)sender;

- (IBAction)buttonClicked:(id)sender;

@end

