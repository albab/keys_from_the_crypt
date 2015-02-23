//
//  ViewController.m
//  keys
//
//  Created by Alex Babich on 2/22/15.
//  Copyright (c) 2015 Alex Babich. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)key1:(id)sender {
    
//    _debugLabel.text = @"Copied!";
//    [UIPasteboard generalPasteboard].string = @"666";
    NSString *email = _text_field.text;
    _key.text = @"Loading....";
    NSLog(@"Email: %@",email);
    NSError *error = nil;
    //this url has the php script I wrote that finds the fingerprint based on the email
    NSString *server_url = @"http://bigdata-squad.com/alex/bigdata_al/scrape.php?email=";
    //concatenate server_rul with email
    NSString* full_url = [NSString stringWithFormat:@"%@%@", server_url, email];
    NSLog(@"Page to hit: %@", full_url);
    //I'm just a string....
    NSURL *web_unformatted = [NSURL URLWithString:full_url];
    @try {
        //Now I'm the web page content
        NSString *webFormatted = [NSString stringWithContentsOfURL:web_unformatted encoding:NSASCIIStringEncoding error:&error];
        //set the label to the web content/fingerprint
        _key.text=webFormatted;
        
        //button for copy
        NSInteger length_of = [webFormatted length];
        NSLog(@"Label length: %li", (long)length_of);
        if (length_of > 1) {
            //going to use this to hide button when there's no fingerprint found
            NSLog(@"Valid address");
        }
        UIButton *but= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [but addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [but setFrame:CGRectMake(164, 320, 60, 30)];
        [but setTitle:@"Copy" forState:UIControlStateNormal];
        [but setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [but setExclusiveTouch:YES];
        [self.view addSubview:but];

    }
    @catch (NSException *exception) {
        _key.text=@"Email not found";
    }
    
}


-(void) buttonClicked:(UIButton*)sender {
    //Function that actually copies the fingerprint to the device's clipboard
    NSLog(@"You copied the text");
    [UIPasteboard generalPasteboard].string = _key.text;
}


@end
