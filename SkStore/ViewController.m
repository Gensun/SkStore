//
//  ViewController.m
//  SkStore
//
//  Created by Genie Sun on 2017/4/1.
//  Copyright © 2017年 Onstar. All rights reserved.
//

#import "ViewController.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKStoreProductViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //[self firstWay];
    [self secondWay];
}

- (void)firstWay
{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc] init];
    [parameter setValue:[NSNumber numberWithInt:742562928] forKey:SKStoreProductParameterITunesItemIdentifier];
        SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
        storeViewController.delegate = self;
        [storeViewController loadProductWithParameters:parameter completionBlock:^(BOOL result, NSError * _Nullable error) {
            if (result) {
                [self presentViewController:storeViewController animated:YES completion:nil];
            } else {
                NSLog(@"NO SUCCESS LOADING PRODUCT SCREEN");
            }
        }];
}

- (void) secondWay
{
    if ([UIDevice currentDevice].systemVersion.floatValue >= 10.3) {
        [SKStoreReviewController requestReview];
    }
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [viewController dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
