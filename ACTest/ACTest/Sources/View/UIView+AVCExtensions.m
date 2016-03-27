//
//  UIView+AVCExtensions.m
//  ACTest
//
//  Created by Luiz Duraes on 3/26/16.
//  Copyright © 2016 Avenue Code. All rights reserved.
//

#import "UIView+AVCExtensions.h"

@implementation UIView (AVCExtensions)

#pragma mark - Public

-(void)hideViewNoRecordsFound {
    UIView *viewLoad = [self currenMaskView];
    
    if(viewLoad) {
        [viewLoad removeFromSuperview];
    }
}

-(void)showViewNoRecordsFound {
    [self showViewWithMessage:NSLocalizedString(@"errMsgPrinterConnection", nil)];
}

-(void)showViewWithMessage:(NSString *)errMessage {
    if([self currenMaskView]) {
        return;
    }
    
    UIView *view = [self maskView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectInset(view.bounds, 20.0, 0)];
    [label setNumberOfLines:0];
    [label setFont:[UIFont systemFontOfSize:17.0]];
    [label setTextColor:[UIColor blackColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setText:errMessage];
    
    [view addSubview:label];
    [view setAlpha:1.0];
    [self addSubview:view];
}

#pragma mark - Private

-(UIView *)currenMaskView {
    __block UIView *view;
    __block NSInteger tag = NSIntegerMax;
    
    [self.subviews enumerateObjectsUsingBlock:^(UIView *item, NSUInteger idx, BOOL *stop) {
        if(item.tag == tag) {
            view = item;
            *stop = YES;
        }
    }];
    
    return view;
}

#pragma mark - Override

-(UIView *)maskView {
//    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + 44, self.frame.size.width, self.frame.size.height)];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
    [view setBackgroundColor:[UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0]];
    [view setTag:NSIntegerMax];
    [view setAlpha:0];
    
    return view;
}

@end
