//
//  SplashViewModel.swift
//  SwiftUIMail
//
//  Created by CHEN Hao on 2025/4/18.
//

import Foundation
import Combine

final class SplashViewModel: ObservableObject {
    
    // 启动页面倒计时秒数
    @Published var remainingSeconds: Int = 3
    
    /// 加载数据
    func loadData(){
        countdownTask()
//        delayToNext()
    }
    
    // MARK: - Combine 写法
    
    private var concellable: AnyCancellable?
    
    func countdownTask(){
        concellable = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                
                if self.remainingSeconds > 1 {
                    self.remainingSeconds -= 1
                } else {
                    self.concellable?.cancel()
                    AppState.shared.doFinishSplash()
                }
                
            }
    }
    
    
    // MARK: - 传统的 Timer + @Published 组合

//    /// 倒计时定时器
//    private var timer: Timer? = nil
//
//
//    /// 启动定时器
//    /// - Parameter remainingSeconds: 秒数
//    func delayToNext(_ remainingSeconds: Int = 3){
//        self.remainingSeconds = remainingSeconds
//        
//        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
//        RunLoop.main.add(timer!, forMode: .common)
//    }
//    
//    
//    /// 每次调用定时器执行的逻辑
//    @objc func updateCountDown() {
//        if remainingSeconds > 1 {
//            remainingSeconds -= 1
//        } else {
//            endCountDownTimer()
//        }
//    }
//    
//    
//    /// 结束定时器
//    func endCountDownTimer() {
//        if let timer {
//            timer.invalidate() // 停止定时器
//            AppState.shared.doFinishSplash()
//        }
//    }
}
