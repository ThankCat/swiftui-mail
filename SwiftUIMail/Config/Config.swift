//
//  Config.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/27.
//

import Foundation

class Config {
    #if DEV
        static let ENDPOINT = "http://quick-server-sp.ixuea.com"

        /**
     * 资源端点
     */
        static let RESOURCE_ENDPOINT = "http://rs.ixuea.com/quick/"
    #elseif LOCAL
        static let ENDPOINT = "http://192.168.1.1:89520"

        /** 
     * 资源端点
     */
        static let RESOURCE_ENDPOINT = "http://rs.ixuea.com/quick/"
    #else

        static let ENDPOINT = "https://www.chenhao.com"

        /**
     * 资源端点
     */
        static let RESOURCE_ENDPOINT = "http://rs.ixuea.com/quick/"
    #endif
}
