//
//  JGProgressHUDIndeterminateIndicatorView.m
//  JGProgressHUD
//
//  Created by Jonas Gessner on 19.07.14.
//  Copyright (c) 2014 Jonas Gessner. All rights reserved.
//

#import "JGProgressHUDIndeterminateIndicatorView.h"

@implementation JGProgressHUDIndeterminateIndicatorView

- (instancetype)init {
    UIActivityIndicatorView *activityIndicatorView;
    
    if (@available(iOS 13, tvOS 13, *)) {
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    }
    else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
#pragma clang diagnostic pop
    }
    
    [activityIndicatorView startAnimating];
    
    self = [super initWithContentView:activityIndicatorView];
    return self;
}

- (instancetype)initWithHUDStyle:(JGProgressHUDStyle)style {
    return [self init];
}

- (void)setUpForHUDStyle:(JGProgressHUDStyle)style vibrancyEnabled:(BOOL)vibrancyEnabled {
    [super setUpForHUDStyle:style vibrancyEnabled:vibrancyEnabled];
    
    if (style != JGProgressHUDStyleDark) {
        self.color = [UIColor blackColor];
    }
    else {
        self.color = [UIColor whiteColor];
    }
}

- (void)setColor:(UIColor *)color {
    [(UIActivityIndicatorView *)self.contentView setColor:color];
}

- (void)updateAccessibility {
    self.accessibilityLabel = NSLocalizedString(@"Indeterminate progress",);
}

@end
