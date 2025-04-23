//
//  User.swift
//  App
//
//  Created by smile on 2024/9/8.
//

import Foundation

/// 用户模型
///
/// 用整个类表示应用的用户
struct User: Identifiable, Codable, Hashable {
    var id: String? = nil

    /**
     * 昵称
     */
    var nickname: String? = nil

    /**
     * 头像
     */
    var icon: String? = nil

    /**
     * 描述
     */
    var detail: String? = nil

    /**
     * 性别
     * 0：保密，10：男，20：女
     */
    var gender: String? = nil

    /**
     * 生日
     * 格式为：yyyy-MM-dd
     */
    var birthday: String? = nil

    /**
     * 朋友圈背景
     */
    var bg: String? = nil

    /**
     * 手机号
     */
    var phone: String? = nil

    /**
     * 邮箱
     */
    var email: String? = nil

    /**
     * 用户的密码,登录，注册向服务端传递
     */
    var password: String? = nil

    /**
     * QQ第三方登录后昵称
     */
    var qqNickname: String? = nil

    /**
     * 微信第三方登录后昵称
     */
    var wechatNickname: String? = nil

    /**
     * 验证码
     * 只有找回密码的时候才会用到
     */
    var code: String? = nil

    /**
     * 省
     */
    var province: String? = nil

    /**
     * 省编码
     */
    var provinceCode: String? = nil

    /**
     * 市
     */
    var city: String? = nil

    /**
     * 市编码
     */
    var cityCode: String? = nil

    /**
     * 区
     */
    var area: String? = nil

    /**
     * 区编码
     */
    var areaCode: String? = nil

    /**
     * 我的关注的人（好友）
     */
    var followingsCount: Int? = nil

    /**
     * 关注我的人（粉丝）
     */
    var followersCount: Int? = nil

    /**
     * 是否关注
     * 1:关注
     * 在用户详情才会返回
     */
    var following: String? = nil

    // region 本地过滤
    /**
     * 拼音
     */
    var pinyin: String? = nil

    /**
     * 拼音首字母
     */
    var pinyinFirst: String? = nil

    /**
     * 拼音首字母的首字母
     */
    var first: String? = nil

    // endregion

    // region 第三方登录
    var token: String? = nil
    var refreshToken: String? = nil
    var openid: String? = nil
    var expiresIn: Int? = nil

    /**
     * 第三方登录
     * 1:微信登录；10：qq登录
     */
    var style: Int? = nil
    // endregion

    static let PREVIEW_DATA = User(
        id: "1",
        nickname: "😆😍😍😇😃😃😄😂😁😁爱学啊",
        icon:
            "http://thirdqq.qlogo.cn/qqopen/en0dXUqq3loeR8GeCUcuTaxDvOV1h37uAMWtO5GnK5CqWIichXKOt8DcibAJV0WIeC/100?v=722d",
        detail: "111",
        gender: "10",
        phone: "131****1222",
        email: "i*******@163.com",
        province: "河北省",
        provinceCode: "130000",
        city: "秦皇岛市",
        cityCode: "130300",
        area: "北戴河区",
        areaCode: "130304",
        followingsCount: 1,
        followersCount: 0
    )
}

extension User {

    /// 获取格式化后的昵称
    var nicknameFormat: String {
        return nickname ?? phone ?? email!
    }

    var genderFormat: String {
        switch gender {
        case "10":
            return "男"
        case "20":
            return "女"
        default:
            return "保密"
        }
    }

    var areaDisplay: String {
        if let province = province, !province.isEmpty {
            return (province) + (city ?? "") + (area ?? "")
        } else {
            return ""
        }
    }
}
