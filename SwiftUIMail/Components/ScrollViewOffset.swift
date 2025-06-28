//
//  ScrollViewOffset.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/6/28.
//  From https://gist.github.com/Kievkao/0682dc8814a953640ca9b74413424bb8

import SwiftUI

// 这是一个自定义的 SwiftUI 视图，用于监听 ScrollView 的滚动偏移量
struct ScrollViewOffset<Content: View>: View {
  // 滚动偏移量变化时的回调闭包，参数为当前偏移量
  let onOffsetChange: (CGFloat) -> Void
  // 用于生成实际内容的闭包
  let content: () -> Content

  // 构造方法，初始化回调和内容闭包
  // @escaping 表示闭包可能在初始化后被异步调用
  // @ViewBuilder 允许 content 闭包返回多个视图
  init(
    onOffsetChange: @escaping (CGFloat) -> Void,
    @ViewBuilder content: @escaping () -> Content
  ) {
    self.onOffsetChange = onOffsetChange
    self.content = content
  }

  // 视图主体
  var body: some View {
    ScrollView {
      offsetReader // 用于监听滚动偏移的辅助视图
      content()    // 实际显示的内容
        .padding(.top, -8) // 内容顶部向上偏移 8pt，微调布局
    }
    .coordinateSpace(name: "frameLayer") // 命名坐标空间，便于后续定位
    .onPreferenceChange(OffsetPreferenceKey.self, perform: onOffsetChange) // 监听偏移量变化并回调
  }

  // 辅助视图：用于读取当前滚动偏移量
  var offsetReader: some View {
    GeometryReader { proxy in
      Color.clear // 占位但不显示任何内容
        .preference(
          key: OffsetPreferenceKey.self,
          value: proxy.frame(in: .named("frameLayer")).minY // 获取内容顶部在指定坐标空间的 Y 坐标
        )
    }
    .frame(height: 0) // 高度为 0，不影响布局
  }
}

// 偏移量偏好键，用于在视图树上传递偏移量数据
private struct OffsetPreferenceKey: PreferenceKey {
  static var defaultValue: CGFloat = .zero // 默认值为 0
  static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {} // 只需单一值，无需合并
}
