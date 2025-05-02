//
//  NetworkPageData.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/5/2.
//

import Foundation

/// 网络分页数据模型（泛型）
///
/// 这个类用于处理带有分页信息的网络数据结构。
/// 泛型 `T` 代表具体的数据类型（例如 `Product`, `User` 等），这些数据都遵循 `Codable` 协议。
/// `list` 是分页的数据列表，`pagination` 是分页相关的元数据。
class NetworkPageData<T: Codable>: Codable {

    /// 数据列表，包含一页的所有数据。每个数据项的类型是泛型 `T`。
    /// `T` 可以是任何遵循 `Codable` 协议的数据类型，如 `Product`, `User` 等。
    /// `list` 是一个可选数组，如果没有数据，可能是 `nil`。
    let list: [T]?

    /// 分页信息，包含总条目数、总页数、当前页等信息。
    /// `pagination` 是一个 `NetworkPageMeta` 类型，用来描述分页的元数据。
    /// 例如：返回当前页、总页数、每页条数等。
    let pagination: NetworkPageMeta?

    /// 用于指定字段与 JSON 键的映射关系
    /// `list` 对应 JSON 中的 `list` 字段
    /// `pagination` 对应 JSON 中的 `pagination` 字段
    enum CodingKeys: String, CodingKey {
        case list
        case pagination
    }
}

/// 网络分页元数据模型
///
/// 这个结构体包含了分页相关的字段，描述了当前分页请求的基本信息。
/// 包括：总条目数、总页数、每页条数、当前页数等。它有助于在处理大规模数据时支持分页功能。
struct NetworkPageMeta: Codable {

    /// 总条目数（例如：数据库中符合条件的所有记录数）
    let total: Int?

    /// 总页数（基于总条目数和每页条数计算得出）
    let pages: Int?

    /// 每页的条目数（通常是请求时传入的）
    let size: Int?

    /// 当前页的页码
    let page: Int?

    /// 下一页的页码（如果没有下一页，则为 `nil`）
    let next: Int?

    /// 用于指定字段与 JSON 键的映射关系
    /// `total`、`pages`、`size`、`page` 和 `next` 分别对应 JSON 中的相应字段
    enum CodingKeys: String, CodingKey {
        case total, pages, size, page, next
    }
}
