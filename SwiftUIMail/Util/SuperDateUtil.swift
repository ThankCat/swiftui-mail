//
//  SuperDateUtil.swift
//  日期工具类
//
//  Created by CHEN Hao on 2025/4/16.
//

import Foundation

  
class SuperDateUtil {
    

    /// 获取当前年份的静态方法
    /// - Returns: 当前年份（整数值）
    static func currentYear() -> Int {
        // 获取当前日历对象
        let calender = Calendar.current
        
        // 从当前日期提取年、月、日的组成部分
        let d = calender.dateComponents([.year, .month, .day], from: Date())
        
        // 返回提取到的年份（注意：使用了强制解包，假设year一定会有值）
        return d.year!
    }
}
