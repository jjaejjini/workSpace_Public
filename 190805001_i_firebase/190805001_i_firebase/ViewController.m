//
//  ViewController.m
//  190805001_i_firebase
//
//  Created by Jmac on 05/08/2019.
//  Copyright © 2019 Jmac. All rights reserved.
//

#import "ViewController.h"
#import <Crashlytics/Crashlytics.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(20, 50, 100, 30);
    [button setTitle:@"Crash" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(crashButtonTapped:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"MAIN"            forKey:@"screen"];
    [params setValue:@"test"            forKey:@"event"];
    [params setValue:@"Function Call"   forKey:@"action"];
    [self faLog:@"MAIN" params:params];
    
    
    NSString *contentType = @"testType";
    NSString *itemId = @"test0001";
    
    [FIRAnalytics logEventWithName: kFIREventSelectContent
                        parameters:@{
                                     kFIRParameterContentType: contentType,
                                     kFIRParameterItemID: itemId
                                     }];
}

- (IBAction)crashButtonTapped:(id)sender {

    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"MAIN"        forKey:@"screen"];
    [params setValue:@"Crash"       forKey:@"event"];
    [params setValue:@"Button Clic" forKey:@"action"];
    [params setValue:CommonTest     forKey:Common];
    [self faLog2:@"MAIN" params:params];
    
    [[Crashlytics sharedInstance] crash];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)faLog:(NSString *)name params : (NSDictionary *)params {
    [FIRAnalytics logEventWithName:name parameters:params];
}

- (void)faLog2:(NSString *)name params : (NSDictionary *)params {
    [FIRAnalytics logEventWithName:kFIREventSelectContent parameters:params];
}

@end
