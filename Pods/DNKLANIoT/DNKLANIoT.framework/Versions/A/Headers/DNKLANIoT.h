//
//  DNKIoTLink.h
//  DNKLANIoT
//
//  Created by 陈群 on 2023/3/10.
//

#import <Foundation/Foundation.h>
#import "DNKIoTConfig.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^IoTBoolResult)(BOOL result, NSError * _Nullable error);
@interface DNKLANIoT : NSObject
/// 网关信息，网关绑定成功后步为空，否则为空
@property (nonatomic, strong, readonly, nullable) NSDictionary *gatewayInfo;
/// 网关热点名称
@property (nonatomic, strong, readonly) NSString *apName;
- (instancetype)initWithConfig:(DNKIoTConfig *)config;
/// 对码绑定网关
/// - Parameters:
///   - udid: 网关UDID
///   - userNameIoT: 用户
///   - resultBlock:绑定结果
- (void)bindGatewayWithResultBlock:(IoTBoolResult)resultBlock;
/// 连接网关热点绑定网关
/// - Parameters:
///   - essid: 要连接的Wi-Fi名称
///   - psk: Wi-Fi 密码
///   - resultBlock: 绑定结果
- (void)bindGatewayWithEssid:(NSString *)essid psk:(NSString *)psk resultBlock:(IoTBoolResult)resultBlock;
/// 通过 Wi-Fi绑定网关后，网关不会再开启热点，只有重置后，才能再通过Wi-Fi绑定网关
- (void)resetWiFiWithResultBlock:(IoTBoolResult)resultBlock;
/// 关闭IoT
- (void)destroy;
- (void)readGatewayInfo:(IoTBoolResult)resultBlock;
@end

NS_ASSUME_NONNULL_END
