//
//  NavigationControllerExtension.swift
//  SwiftUIMail
//
//  Created by HoverCHEN on 2025/6/5.
//

import UIKit

/// 默认调用navigationBarBackButtonHidden后, 就没有收拾滑动返回了
/// 如果要启动滑动返回, 就要添加如下扩展
extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
