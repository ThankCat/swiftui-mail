//
//  MyIcon.swift
//  App
//
//  Created by smile on 2024/9/10.
//

import SwiftUI

func ArrowIcon(foregroundStyle:Color = .arrow) -> some View {
    Image(systemName: "chevron.right")
        .foregroundStyle(foregroundStyle)
}
