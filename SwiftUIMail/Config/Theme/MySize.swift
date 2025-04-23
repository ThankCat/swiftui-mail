//
//  MySize.swift
//  尺寸相关
//
//  Created by smile on 2024/9/10.
//

import SwiftUI

// 定义尺寸常量
let Space4XLarge: CGFloat = 40.0
let Space3XLarge: CGFloat = 30.0
let SpaceLarge: CGFloat = 20.0
let SpaceOuter: CGFloat = 16.0
let SpaceExtraOuter: CGFloat = 14.0
let SpaceMedium: CGFloat = 10.0
let SpaceExtraMedium: CGFloat = 8.0
let SpaceHalfExtraMedium: CGFloat = 4.0
let SpaceSmall: CGFloat = 5.0
let SpaceExtraSmall2: CGFloat = 2.0
let SpaceExtraSmall: CGFloat = 0.7

let BUTTON_HEIGHT: CGFloat=42
let BUTTON_HEIGHT_MEDDLE: CGFloat=48

let NavigationBarSearchHeight: CGFloat = 35
let NavigationBarHeight: CGFloat = 44

// 定义圆角半径的常量
let extraSmallCornerRadius: CGFloat = 5
let smallCornerRadius: CGFloat = 10
let mediumCornerRadius: CGFloat = 16
let largeCornerRadius: CGFloat = 20
let extraLargeCornerRadius: CGFloat = 30


func SpaceHalfExtraMediumHeightView() -> some View {
    Spacer().frame(height: SpaceHalfExtraMedium)
}

func SpaceMediumWidthView() -> some View {
    Spacer().frame(width: SpaceMedium)
}

func SpaceExtraMediumView() -> some View {
    Spacer()
        .frame(width: SpaceExtraMedium)
}

func SpaceExtraMediumHeightView() -> some View {
    Spacer().frame(height: SpaceExtraMedium)
}
func Space3XLargeHeightView() -> some View {
    Spacer().frame(height: Space3XLarge)
}

func Space4XLargeHeightView() -> some View {
    Spacer().frame(height: Space4XLarge)
}


func SpaceLargeView() -> some View {
    Spacer(minLength: SpaceLarge)
}

func SpaceLargeHeightView() -> some View {
    Spacer().frame(height: SpaceLarge)
}

func SpacerOuterWidthView() -> some View {
    Spacer().frame(width: SpaceOuter)
}

func SpaceOuterHeightView() -> some View {
    Spacer().frame(height: SpaceOuter)
}

func SpaceExtraOuterHeightView() -> some View {
    Spacer().frame(height: SpaceExtraOuter)
        .background(.arrow)
}


func SpaceExtraSmallHeightView() -> some View {
    Spacer().frame(height: SpaceExtraSmall)
        .background(.arrow)
}

func SpaceSmallHeightView() -> some View {
    Spacer().frame(height: SpaceSmall)
        .background(.arrow)
}

func SpaceSmallWidthView() -> some View {
    Spacer().frame(width: SpaceSmall)
}


func SpaceMediumHeightView() -> some View {
    Spacer().frame(height: SpaceMedium)
}
func SpaceExtraSmall2HeightView() -> some View {
    Spacer().frame(height: SpaceExtraSmall2)
}
