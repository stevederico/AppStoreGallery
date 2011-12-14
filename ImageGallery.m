//
//  ImageGallery.m
//  CLPlus
//
//  Created by Stephen Derico on 12/10/11.
//  Copyright (c) 2011 Bixby Apps. All rights reserved.
//

#import "ImageGallery.h"

@implementation ImageGallery
@synthesize pageControl = _pageControl, scrollView = _scrollView,images = _images;
@synthesize spinner = _spinner;

- (void)dealloc {
   
    self.images = nil;
    self.pageControl = nil;
    self.scrollView = nil;
    self.spinner = nil;

     [super dealloc];
}

- (id)initWithImages:(NSArray*)images{
    self = [super initWithFrame:CGRectMake(10, 10, 300, 325)];
    if (self) {
        
        [self setBackgroundColor:[UIColor greenColor]];
        self.images = images;
        UIPageControl *pc = [[UIPageControl alloc] initWithFrame:CGRectMake(50, 280, 200, 25)];
        self.pageControl= pc;
        [pc release];
        
        UIScrollView *sc = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 300, 325)];
        self.scrollView = sc;
        self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
        self.scrollView.clipsToBounds = YES;
        self.scrollView.scrollEnabled = YES;
        self.scrollView.pagingEnabled = YES;
        [self.scrollView setBackgroundColor:[UIColor redColor]];
        [self.scrollView setCanCancelContentTouches:NO];
        self.scrollView.delegate = self;
        [sc release];
        
        UIActivityIndicatorView *s = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(135, 150, 25, 25)];
        self.spinner = s;
        [self.spinner setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [self.spinner startAnimating];
        [s release];
    
        return self;
    }
    return nil;
}


- (void)layoutSubviews{
 
    [super layoutSubviews];
    [self addSubview:self.scrollView];
    [self addSubview:self.spinner];
    [self addSubview:self.pageControl];
    
    [self handleImages];

}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView {
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)handleImages{
    
    self.pageControl.numberOfPages = [self.images count];

    CGFloat cx = 0;
    for (UIImage *image in self.images) {
     
        UIImageView *imageScrollView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 325)];
        image = [ImageGallery imageWithImage:image scaledToSize:CGSizeMake(300, 325)];
        [imageScrollView setImage:image];
            CGRect rect = imageScrollView.frame;
            
            rect.origin.x = ((self.scrollView.frame.size.width - image.size.width) / 2) + cx;
            rect.origin.y = ((self.scrollView.frame.size.height - image.size.height) / 2);
            
            imageScrollView.frame = rect;
            
            [self.scrollView addSubview:imageScrollView];
            [imageScrollView release];
            
            cx += self.scrollView.frame.size.width;
        
    }
    
    
    [self.scrollView setContentSize:CGSizeMake(cx, [self.scrollView bounds].size.height)];
    [self.spinner stopAnimating];
    [self.spinner hidesWhenStopped];

}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    return newImage;
}


@end
