//
//  DetailResponse.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/5/2.
//

import Foundation

/// 通用的详情响应数据模型
///
/// 泛型类：用于描述后端返回的带有 `data` 字段的响应结构
/// 继承自 BaseResponse，包含通用字段（如 status、message）
/// 泛型 `T` 代表 `data` 字段中的数据类型，必须符合 `Codable` 协议
class DetailResponse<T: Codable>: BaseResponse {

    /// data 是服务端返回的具体数据内容，类型由调用方决定
    /// 例如可能是 User、Product、Order 等结构体
    var data: T?

    /// 用于自定义和 JSON 字段的对应关系
    /// 这里只映射了当前类中定义的 `data` 字段
    private enum CodingKeys: String, CodingKey {
        case data
    }

    /// 自定义的初始化方法，用于解码 JSON 数据
    /// 因为这个类使用了泛型 T，Swift 无法自动合成 init(from:)，所以需要手动实现
    required init(from decoder: Decoder) throws {
        // 获取 JSON 解码容器，按 CodingKeys 中定义的键进行解码
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // 尝试从 JSON 中解码 data 字段为 T 类型，失败时返回 nil（可选解码）
        self.data = try? container.decode(T.self, forKey: .data)

        // 调用父类的解码逻辑，解码 status、message 等公共字段
        try super.init(from: decoder)
    }

    /// 可选：如果你需要把对象编码回 JSON，这里也可以实现 encode(to:) 方法
    /// 因为父类和泛型都使用了 Codable，Swift 会要求你手动实现
}
