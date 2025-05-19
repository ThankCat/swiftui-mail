//
//  Constant.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/5/5.
//

import Foundation

struct Constant {
    static let VALUE_NO = -1
    static let VALUE_NO_STRING = "-1"
    static let VALUE1 = 1
    static let VALUE0 = 0
    static let VALUE10 = 10
    static let VALUE20 = 20
    static let VALUE30 = 30
    static let VALUE40 = 40

    static let ID = "id"
    
    static let CONTENT_WRAPPER_START =
    """
    <!DOCTYPE html>
    <html>
      <head>
        <title> </title>
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no"
        />
        <style type="text/css">
          body {
            font-family: Helvetica Neue, Helvetica, PingFang SC, Hiragion Snas GB,
              Microsoft YaHei, Arial, sans-serif;
            word-wrap: break-word;
            word-break: normal;
          }
          h2 {
            text-align: center;
          }
          img {
            max-width: 100% !important;
            height: auto;
          }
          pre {
            word-wrap: break-word !important;
            overflow: auto;
          }
        </style>
      </head>
      <body>
    """
    static let CONTENT_WRAPPER_END = "</body></html>"
}
