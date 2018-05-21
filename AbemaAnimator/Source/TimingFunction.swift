//
//  TimingFunction.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

public struct TimingFunction {
    public static let `default` = TimingFunction(name: kCAMediaTimingFunctionDefault)
    public static let linear = TimingFunction(name: kCAMediaTimingFunctionLinear)
    public static let easeIn = TimingFunction(name: kCAMediaTimingFunctionEaseIn)
    public static let easeOut = TimingFunction(name: kCAMediaTimingFunctionEaseOut)
    public static let easeInEaseOut = TimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)

    let rawValue: CAMediaTimingFunction

    init(name: String) {
        self.rawValue = CAMediaTimingFunction(name: name)
    }

    init(_ rawValue: CAMediaTimingFunction) {
        self.rawValue = rawValue
    }

    public init(controlPoints c1x: Float, _ c1y: Float, _ c2x: Float, _ c2y: Float) {
        self.rawValue = CAMediaTimingFunction(controlPoints: c1x, c1y, c2x, c2y)
    }
}

// - SeeAlso: https://github.com/ai/easings.net/
extension TimingFunction {
    public static let easeInSine = TimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
    public static let easeOutSine = TimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
    public static let easeInOutSine = TimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
    public static let easeInQuad = TimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
    public static let easeOutQuad = TimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
    public static let easeInOutQuad = TimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
    public static let easeInCubic = TimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
    public static let easeOutCubic = TimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
    public static let easeInOutCubic = TimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
    public static let easeInQuart = TimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
    public static let easeOutQuart = TimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
    public static let easeInOutQuart = TimingFunction(controlPoints: 0.77, 0, 0.175, 1)
    public static let easeInQuint = TimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
    public static let easeOutQuint = TimingFunction(controlPoints: 0.23, 1, 0.32, 1)
    public static let easeInOutQuint = TimingFunction(controlPoints: 0.86, 0, 0.07, 1)
    public static let easeInExpo = TimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
    public static let easeOutExpo = TimingFunction(controlPoints: 0.19, 1, 0.22, 1)
    public static let easeInOutExpo = TimingFunction(controlPoints: 1, 0, 0, 1)
    public static let easeInCirc = TimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
    public static let easeOutCirc = TimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
    public static let easeInOutCirc = TimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
    public static let easeInBack = TimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
    public static let easeOutBack = TimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
    public static let easeInOutBack = TimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
}
