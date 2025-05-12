//
//  Product.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/23.
//

import Foundation

struct Product: Identifiable, Codable, Hashable {
    var id: String

    /// 标题
    var title: String

    /// 商品编码
    var number: String?

    /// 封面
    var icon: String?

    /// 详情轮播图
    ///
    /// 多张图片地址以英文逗号分割存储
    var icons: [String] = []

    /// 宣传视频
    var video: String? = nil

    /// 搜索标签
    ///
    /// 以空格分割
    var keyword: String? = nil

    var category1Id: String? = nil
    var category2Id: String? = nil
    var category3Id: String? = nil

    var originPrice: Int = 0

    /// 价格
    var price: Int = 0

    /// 会员价
    var memberPrice: Int = 0

    /// 亮点
    ///
    ///
    /// 真实项目中，如果有特别需求，也可以实现为列表
    /// 我们这里主要讲解商城核心逻辑，所以这里就简单实现了
    var highlight: String? = nil

    /// 详情
    ///
    ///
    /// HTML格式化富文本
    var detail: String? = nil

    /// 是否上架
    var sale: UInt8 = 1

    /// 是否删除
    var delete: UInt8 = 0

    /// 是否热门
    var hot: UInt8 = 1

    /// 是否新品
    var news: UInt8 = 1

    /// 是否推荐
    ///
    /// 主要是显示到商品详情页=1
    var recommend: UInt8 = 1

    /// 好评百分比
    var commentsRate: Float = 100

    /// 评论数
    var commentsCount: Int64 = 0

    /// 销量
    var salesCount: Int64 = 0

    /// 库存
    var stocksCount: Int64 = 0

    /// 评分
    var score: Float = 5

    var stocks: [Stock]? = nil
    var specs: [Spec]? = nil

    var userId: String? = nil

    var user: User? = nil

    var priceFloat: Double {
        return Double(price) / 100.0
    }

    var originPriceFloat: Double {
        return Double(originPrice) / 100.0
    }

    init(
        id: String,
        number: String,
        title: String,
        icon: String,
        icons: [String] = [],
        video: String? = nil,
        keyword: String? = nil,
        category1Id: String? = nil,
        category2Id: String? = nil,
        category3Id: String? = nil,
        originPrice: Int = 0,
        price: Int = 0,
        memberPrice: Int = 0,
        highlight: String? = nil,
        detail: String? = nil,
        sale: UInt8 = 1,
        delete: UInt8 = 0,
        hot: UInt8 = 0,
        news: UInt8 = 0,
        recommend: UInt8 = 0,
        commentsRate: Float = 0.0,
        commentsCount: Int64 = 0,
        salesCount: Int64 = 0,
        stocksCount: Int64 = 0,
        score: Float = 0.0,
        stocks: [Stock]? = nil,
        specs: [Spec]? = nil
    ) {
        self.id = id
        self.number = number
        self.title = title
        self.icon = icon
        self.icons = icons
        self.video = video
        self.keyword = keyword
        self.category1Id = category1Id
        self.category2Id = category2Id
        self.category3Id = category3Id
        self.originPrice = originPrice
        self.price = price
        self.memberPrice = memberPrice
        self.highlight = highlight
        self.detail = detail
        self.sale = sale
        self.delete = delete
        self.hot = hot
        self.news = news
        self.recommend = recommend
        self.commentsRate = commentsRate
        self.commentsCount = commentsCount
        self.salesCount = salesCount
        self.stocksCount = stocksCount
        self.score = score
        self.stocks = stocks
        self.specs = specs
    }

    static let PREVIEW_DATA = Product(
        id: "20",
        number: "P20",
        title: "Xiaomi 14",
        icon: "mall/products/i20.png",
        icons: [
            "mall/products/b20.jpg",
            "mall/products/b21.jpg",
        ],
        keyword: "小米 手机 徕卡",
        originPrice: 3,
        price: 2,
        memberPrice: 1,
        highlight: "徕卡影像 能效飞跃 小米澎湃OS",
        detail: """
                <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
            """,
        stocks: Stock.PREVIEW_STOCKS,
        specs: Spec.PREVIEW_SPECS
    )

    static let PREVIEW_DATUM = [
        Product(
            id: "20",
            number: "P20",
            title: "Xiaomi 14",
            icon: "mall/products/i20.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "徕卡影像 能效飞跃 小米澎湃OS",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 99,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "21",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon: "mall/products/i20.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "22",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon:
                "https://img.youpin.mi-img.com/shopmain/d14a64c4e25279e3e4abac68e51dc63b.png@base@tag=imgScale&h=342&w=342",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "23",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon: "mall/products/i20.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "24",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon: "mall/products/i21.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "25",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon: "mall/products/i21.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
        Product(
            id: "26",
            number: "P21",
            title: "傻厨电煎锅多功能家用不粘锅电饼铛一体锅烙饼锅电烤锅烤肉电烤锅",
            icon: "mall/products/i21.png",
            icons: [
                "mall/products/b20.jpg",
                "mall/products/b21.jpg",
            ],
            keyword: "小米 手机 徕卡",
            originPrice: 3,
            price: 2,
            memberPrice: 1,
            highlight: "增压零冷水,全屋即开即热无需等待",
            detail: """
                    <img src="https://rs.ixuea.com/quick/mall/products/d20.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d21.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d22.jpg"/>
                    <img src="https://rs.ixuea.com/quick/mall/products/d23.jpg"/>
                    <p>这是一些html标签<p>只支持一些简单HTML标签，<a href="https://www.baidu.com">这是链接</a>
                """,
            sale: 1,
            delete: 0,
            hot: 1,
            news: 1,
            recommend: 1,
            commentsRate: 1228,
            commentsCount: 0,
            salesCount: 0,
            stocksCount: 0,
            score: 5
        ),
    ]
}

struct Stock: Identifiable, Hashable, Codable {
    var id: String
    var ids: String?
    var number: String?
    var title: String?
    var icon: String?
    var price: Int
    var originPrice: Int
    var status: Int
    var stock: Int64
    var weight: Float

    static let PREVIEW_STOCK = Stock(
        id: "1",
        ids: "201211",
        number: "S201211",
        title: "岩石青 8GB+256GB",
        icon: nil,  // 如果没有图标，可以设置为nil
        price: 1,
        originPrice: 2,
        status: 10,
        stock: 456,
        weight: 456.0
    )

    static let PREVIEW_STOCKS: [Stock] = [
        Stock(
            id: "1",
            ids: "201211",
            number: "S201211",
            title: "岩石青 8GB+256GB",
            icon: nil,
            price: 1,
            originPrice: 2,
            status: 10,
            stock: 456,
            weight: 456.0
        ),
        Stock(
            id: "2",
            ids: "201212",
            number: "S201212",
            title: "岩石青 12GB+256GB",
            icon: "https://rs.ixuea.com/quick/mall/products/s20.png",
            price: 2,
            originPrice: 3,
            status: 10,
            stock: 456,
            weight: 456.0
        ),
        Stock(
            id: "3",
            ids: "202211",
            number: "S202211",
            title: "黑色 8GB+256GB",
            icon: "https://rs.ixuea.com/quick/mall/products/s21.png",
            price: 1,
            originPrice: 3,
            status: 10,
            stock: 60,
            weight: 12.0
        ),
    ]
}

struct Spec: Identifiable, Codable, Hashable {
    var id: String
    var title: String

    /// 选择子item信息
    var selectedSubId: String? = nil
    var selectedSubTitle: String? = nil

    var data: [Spec]?

    static let PREVIEW_SPECS: [Spec] = [
        Spec(
            id: "200",
            title: "颜色",
            data: [
                Spec(id: "201", title: "岩石青"),
                Spec(id: "202", title: "黑色"),
                Spec(id: "203", title: "雪山粉"),
                Spec(id: "204", title: "白色"),
                Spec(id: "205", title: "紫色"),
                Spec(id: "206", title: "橙色"),
            ]
        ),
        Spec(
            id: "210",
            title: "版本",
            data: [
                Spec(id: "211", title: "8GB+256GB"),
                Spec(id: "212", title: "12GB+256GB"),
                Spec(id: "213", title: "16GB+512GB"),
                Spec(id: "214", title: "16GB+1TB"),
            ]
        ),
    ]
}
