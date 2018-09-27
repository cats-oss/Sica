//
//  CAAnimation+Extension.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

extension CAAnimation {
    func configure(delay: Double, duration: Double, timingFunction: TimingFunction, isRemovedOnCompletion: Bool = false) {
        self.beginTime = delay
        self.duration = duration
        self.timingFunction = timingFunction.rawValue
        self.fillMode = FillMode.forwards.rawValue
        self.isRemovedOnCompletion = isRemovedOnCompletion
    }
}
