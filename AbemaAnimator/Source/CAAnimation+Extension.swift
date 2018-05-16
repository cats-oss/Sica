//
//  CAAnimation+Extension.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

extension CAAnimation {
    func configure(delay: Double, duration: Double, timingFunction: TimingFunction) {
        self.beginTime = delay
        self.duration = duration
        self.timingFunction = timingFunction.rawValue
        self.fillMode = kCAFillModeForwards
        self.isRemovedOnCompletion = false
    }
}

extension Array where Element == CAAnimation {
    func sequence() {
        for (i, animation) in self.enumerated() {
            if i == 0 {continue}
            let preAnimation = self[i - 1]
            animation.beginTime += preAnimation.beginTime + preAnimation.duration
        }
    }

    func totalDuration(type: AnimationPlayType) -> Double {
        switch type {
        case .sequence:
            return self.last.map { $0.beginTime + $0.duration} ?? 0
        case .parallel:
            return self.map { $0.duration }.max() ?? 0
        }
    }
}

