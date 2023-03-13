//
//  DNKViewController.m
//  DNKLANIoT
//
//  Created by cqcool on 03/10/2023.
//  Copyright (c) 2023 cqcool. All rights reserved.
//

#import "DNKViewController.h"
#import <DNKLANIoT/DNKLANIoT.h>
#import "DNKWiFiViewController.h"

@interface DNKViewController ()
@property (nonatomic, strong) DNKIoTConfig *config;
@property (nonatomic, strong) DNKLANIoT *ioT;


@end

@implementation DNKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.ioT = [[DNKLANIoT alloc] initWithConfig:self.config];
    
}
- (DNKIoTConfig *)config {
    if (!_config) {
        _config = DNKIoTConfig.new;
        _config.userKeyIoT = @"gv0r9hV2CK3";
        _config.userNameIoT = @"a_624d7b3be4b066b255803333";
        _config.userSecretIoT = @"0ec0611cb40f86f849b9faeb02507e6d";
        _config.deviceKeyIoT = @"gv0rRt7bpiE";
        _config.deviceNameIoT = @"g_62454666e4b07837da6c6147";
        _config.deviceSecretIoT = @"5a6a2d68dfd139be52d643fbde183f1a";
    }
    return _config;
}
- (IBAction)matchGatewayAction:(id)sender {
    [self.ioT bindGatewayWithResultBlock:^(BOOL result, NSError * _Nullable error) {
        NSLog(@"%@", result ? @"网关绑定成功" : @"网关绑定失败");
    }];
}
- (IBAction)pushWiFiAction:(id)sender {
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DNKWiFiViewController *vc = [board instantiateViewControllerWithIdentifier:@"DNKWiFiViewController"];
    vc.ioT = self.ioT;
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)discoverGatewayAction:(id)sender {
    [self.ioT readGatewayInfo:^(BOOL result, NSError * _Nullable error) {
        NSLog(@"%@", result ? @"成功" : @"失败");
    }];
}
- (IBAction)resetWiFiAction:(id)sender {
    [self.ioT resetWiFiWithResultBlock:^(BOOL result, NSError * _Nullable error) {
        NSLog(@"%@", result ? @"成功" : @"失败");
    }];
}

@end
