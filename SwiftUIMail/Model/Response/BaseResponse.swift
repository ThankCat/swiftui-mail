//
//  BaseResponse.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/5/2.
//

import Foundation

/// 所有网络响应类的基础模型
/// 遵守 Codable 协议，支持 JSON 编解码
class BaseResponse: Codable {

    /// 请求状态码（通常由后端返回，例如 200 表示成功，400/500 表示失败）
    /// 默认值为 0，表示未设置
    var status: Int = 0

    /// 错误信息（可选）
    /// 当 status 表示失败时，通常这里会包含错误的描述信息
    var message: String? = nil

    /// 附加错误信息字符串（可选）
    /// 用于第三方平台接口调用失败时的返回值，比如微信、支付宝等
    /// 示例：微信登录失败时可能会返回一个错误代码字符串
    var extraString: String? = nil

    /// 附加错误信息描述（可选）
    /// 进一步描述 extraString 所代表的错误信息
    var extraMessage: String? = nil
}
