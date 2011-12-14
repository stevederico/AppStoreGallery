//
//  ImageGallery.h
//  CLPlus
//
//  Created by Stephen Derico on 12/10/11.
//  Copyright (c) 2011 Bixby Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageGallery : UIView <UIScrollViewDelegate>
@property (nonatomic, retain) UIPageControl *pageControl;
@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) NSArray *images;
@property (nonatomic, retain) UIActivityIndicatorView *spinner;
- (id)initWithImages:(NSArray*)images;

@end
