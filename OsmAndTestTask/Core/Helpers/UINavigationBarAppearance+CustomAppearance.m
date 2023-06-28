//
//  UINavigationBarAppearance+CustomAppearance.m
//  OsmAndTestTask
//
//  Created by Oleksii Perov on 6/26/23.
//

#import "UINavigationBarAppearance+CustomAppearance.h"
#import "UIImage+ProjectIcons.h"

@implementation UINavigationBarAppearance (CustomAppearance)


- (void)configureWithCustomAppearance {
    [self configureWithDefaultBackground];
    
    NSDictionary<NSAttributedStringKey, id> *textAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.titleTextAttributes = textAttributes;
    self.largeTitleTextAttributes = textAttributes;
    [self setBackIndicatorImage:[[UIImage backButtonIcon] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] transitionMaskImage:[UIImage backButtonIcon]];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];
    
    self.backgroundColor = [UIColor tintColor];
}


+ (void)setCustomAppearance {
    UINavigationBarAppearance *standardAppearance = [[UINavigationBarAppearance alloc] init];
    UINavigationBar *globalAppearance = [UINavigationBar appearance];
    [standardAppearance configureWithCustomAppearance];
    
    globalAppearance.prefersLargeTitles = YES;
    
    globalAppearance.standardAppearance = standardAppearance;
    globalAppearance.compactAppearance = standardAppearance;
    globalAppearance.scrollEdgeAppearance = standardAppearance;
}


@end
