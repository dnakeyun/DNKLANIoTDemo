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
#import "QRScanVC.h"

@interface DNKViewController ()

@property (nonatomic, strong) DNKIoTConfig *config;
@property (nonatomic, strong) DNKLANIoT *ioT;
@property (weak, nonatomic) IBOutlet UIButton *scanButton;
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *udidLabel;


@end

@implementation DNKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.cardView.hidden = YES;
    self.udidLabel.text = @"62454666e4b07837da6c6147";
    self.config.udid = @"62454666e4b07837da6c6147";
}
- (DNKIoTConfig *)config {
    if (!_config) {
        _config = DNKIoTConfig.new; 
    }
    return _config;
}
- (IBAction)scanAction:(UIButton *)sender {
    QRScanVC *vc = [[QRScanVC alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
    vc.scanResultBlock = ^(QRScanVC *currentVC, NSString *code) {
        self.udidLabel.text = code;
        self.cardView.hidden = NO;
        self.config.udid = code;
    };
}
- (IBAction)pushWiFiAction:(id)sender {
    NSAssert(self.config.udid, @"网关UDID不能为空");
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DNKWiFiViewController *vc = [board instantiateViewControllerWithIdentifier:@"DNKWiFiViewController"];
    vc.ioT = self.ioT;
    [self presentViewController:vc animated:YES completion:nil];
}
- (DNKLANIoT *)ioT {
    if (!_ioT) {
        _ioT = [[DNKLANIoT alloc] initWithConfig:self.config];
    }
    return _ioT;
}

//- (IBAction)discoverGatewayAction:(id)sender {
//    [self.ioT readGatewayInfo:^(BOOL result, NSError * _Nullable error) {
//        NSLog(@"%@", result ? @"成功" : @"失败");
//    }];
//}
- (IBAction)resetWiFiAction:(id)sender {
    [self.ioT resetWiFiWithResultBlock:^(BOOL result, NSError * _Nullable error) {
        NSLog(@"%@", result ? @"成功" : @"失败");
    }];
}

@end
