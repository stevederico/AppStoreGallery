//
//  ViewController.m
//  AppStoreGallery
//
//  Created by Stephen Derico on 12/14/11.
//  Copyright (c) 2011 Bixby Apps. All rights reserved.
//
#import "ImageGallery.h"
#import "ViewController.h"

@implementation ViewController


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *images = [NSArray arrayWithObjects:[UIImage imageNamed:@"sf1.jpg"],[UIImage imageNamed:@"sf2.jpg"],[UIImage imageNamed:@"sf3.jpg"], nil];
    NSLog(@"count %d",[images count]);

    
    ImageGallery *imageGallery = [[[ImageGallery alloc] initWithImages:images] autorelease];
    [self.view addSubview:imageGallery];
    NSLog(@"AddSubView");

    
 
}





@end
