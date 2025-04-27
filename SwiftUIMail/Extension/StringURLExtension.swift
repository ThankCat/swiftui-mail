//
//  StringURLExtension.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/27.
//

import Foundation

extension String {
    var url: URL? {
        if self.isEmpty {
            return nil

        } else if self.starts(with: "http") {
            return URL(string: self)

        } else if self.starts(with: "r/") {
            // 上传到服务端的资源
            return URL(string: "\(Config.ENDPOINT)\(self)")
        }

        return URL(string: "\(Config.RESOURCE_ENDPOINT)\(self)")
    }
}
