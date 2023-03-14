# DNKLANIoTDemo

绑定网关演示Demo,支持有线绑定和无限绑定两种方式。

## 1.有线绑定方式
  ### 网关设备网口连接网线，手机安装APP后需连接无线网络， 井且跟网关设备保持在局域网内，即可谓定网关。
  > -(void)bindGatewayWithResultBlock: (IoTBoolResult)resultBlock;

## 2.无线绑定方式 
### 网关设备网口未连接网线时，会发射AP热点，手机安装APP后需连接该热点，在APP里输入要连接的网络名称和密码，即可绑定网关。
  > -(void)bindGatewayWithEssid: (NSString *)essid psk: (NSString *)psk resultBlock: (IoTBoo LResult)resultBlock;

* 注意:无线绑定方式，在解绑网关时，需重置网关Wi-Fi信息,否则网关不会再发射热点。调用 
  > -(void)resetWiFf iMithResultBlock: (IoTBoolResult)resultBlock;
