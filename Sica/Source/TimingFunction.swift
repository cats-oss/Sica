//
//  TimingFunction.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

public struct TimingFunction {
    #if swift(>=4.2)
    public typealias NameValue = CAMediaTimingFunctionName
    public static let `default` = TimingFunction(name: CAMediaTimingFunctionName.default)
    public static let linear = TimingFunction(name: CAMediaTimingFunctionName.linear)
    public static let easeIn = TimingFunction(name: CAMediaTimingFunctionName.easeIn)
    public static let easeOut = TimingFunction(name: CAMediaTimingFunctionName.easeOut)
    public static let easeInEaseOut = TimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    #else
    public typealias NameValue = String
    public static let `default` = TimingFunction(name: kCAMediaTimingFunctionDefault)
    public static let linear = TimingFunction(name: kCAMediaTimingFunctionLinear)
    public static let easeIn = TimingFunction(name: kCAMediaTimingFunctionEaseIn)
    public static let easeOut = TimingFunction(name: kCAMediaTimingFunctionEaseOut)
    public static let easeInEaseOut = TimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    #endif
    
    
    public let name: NameValue
    public let rawValue: CAMediaTimingFunction
    
    init(name: NameValue) {
        self.name = name
        self.rawValue = CAMediaTimingFunction(name: name)
    }
    
    init(name: NameValue, rawValue: CAMediaTimingFunction) {
        self.name = name
        self.rawValue = rawValue
    }
    
    public init(name: NameValue, controlPoints c1x: Float, _ c1y: Float, _ c2x: Float, _ c2y: Float) {
        self.name = name
        self.rawValue = CAMediaTimingFunction(controlPoints: c1x, c1y, c2x, c2y)
    }
}

// - SeeAlso: https://github.com/ai/easings.net/
extension TimingFunction {
    #if swift(>=4.2)
    public static let easeInSine = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInSine"), controlPoints: 0.47, 0, 0.745, 0.715)
    public static let easeOutSine = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutSine"), controlPoints: 0.39, 0.575, 0.565, 1)
    public static let easeInOutSine = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutSine"), controlPoints: 0.445, 0.05, 0.55, 0.95)
    public static let easeInQuad = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInQuad"), controlPoints: 0.55, 0.085, 0.68, 0.53)
    public static let easeOutQuad = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutQuad"), controlPoints: 0.25, 0.46, 0.45, 0.94)
    public static let easeInOutQuad = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutQuad"), controlPoints: 0.455, 0.03, 0.515, 0.955)
    public static let easeInCubic = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInCubic"), controlPoints: 0.55, 0.055, 0.675, 0.19)
    public static let easeOutCubic = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutCubic"), controlPoints: 0.215, 0.61, 0.355, 1)
    public static let easeInOutCubic = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutCubic"), controlPoints: 0.645, 0.045, 0.355, 1)
    public static let easeInQuart = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInQuart"), controlPoints: 0.895, 0.03, 0.685, 0.22)
    public static let easeOutQuart = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutQuart"), controlPoints: 0.165, 0.84, 0.44, 1)
    public static let easeInOutQuart = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutQuart"), controlPoints: 0.77, 0, 0.175, 1)
    public static let easeInQuint = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInQuint"), controlPoints: 0.755, 0.05, 0.855, 0.06)
    public static let easeOutQuint = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutQuint"), controlPoints: 0.23, 1, 0.32, 1)
    public static let easeInOutQuint = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutQuint"), controlPoints: 0.86, 0, 0.07, 1)
    public static let easeInExpo = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInExpo"), controlPoints: 0.95, 0.05, 0.795, 0.035)
    public static let easeOutExpo = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutExpo"), controlPoints: 0.19, 1, 0.22, 1)
    public static let easeInOutExpo = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutExpo"), controlPoints: 1, 0, 0, 1)
    public static let easeInCirc = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInCirc"), controlPoints: 0.6, 0.04, 0.98, 0.335)
    public static let easeOutCirc = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutCirc"), controlPoints: 0.075, 0.82, 0.165, 1)
    public static let easeInOutCirc = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutCirc"), controlPoints: 0.785, 0.135, 0.15, 0.86)
    public static let easeInBack = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInBack"), controlPoints: 0.6, -0.28, 0.735, 0.045)
    public static let easeOutBack = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeOutBack"), controlPoints: 0.175, 0.885, 0.32, 1.275)
    public static let easeInOutBack = TimingFunction(name: TimingFunction.NameValue(rawValue: "easeInOutBack"), controlPoints: 0.68, -0.55, 0.265, 1.55)
    #else
    public static let easeInSine = TimingFunction(name: "easeInSine", controlPoints: 0.47, 0, 0.745, 0.715)
    public static let easeOutSine = TimingFunction(name: "easeOutSine", controlPoints: 0.39, 0.575, 0.565, 1)
    public static let easeInOutSine = TimingFunction(name: "easeInOutSine", controlPoints: 0.445, 0.05, 0.55, 0.95)
    public static let easeInQuad = TimingFunction(name: "easeInQuad", controlPoints: 0.55, 0.085, 0.68, 0.53)
    public static let easeOutQuad = TimingFunction(name: "easeOutQuad", controlPoints: 0.25, 0.46, 0.45, 0.94)
    public static let easeInOutQuad = TimingFunction(name: "easeInOutQuad", controlPoints: 0.455, 0.03, 0.515, 0.955)
    public static let easeInCubic = TimingFunction(name: "easeInCubic", controlPoints: 0.55, 0.055, 0.675, 0.19)
    public static let easeOutCubic = TimingFunction(name: "easeOutCubic", controlPoints: 0.215, 0.61, 0.355, 1)
    public static let easeInOutCubic = TimingFunction(name: "easeInOutCubic", controlPoints: 0.645, 0.045, 0.355, 1)
    public static let easeInQuart = TimingFunction(name: "easeInQuart", controlPoints: 0.895, 0.03, 0.685, 0.22)
    public static let easeOutQuart = TimingFunction(name: "easeOutQuart", controlPoints: 0.165, 0.84, 0.44, 1)
    public static let easeInOutQuart = TimingFunction(name: "easeInOutQuart", controlPoints: 0.77, 0, 0.175, 1)
    public static let easeInQuint = TimingFunction(name: "easeInQuint", controlPoints: 0.755, 0.05, 0.855, 0.06)
    public static let easeOutQuint = TimingFunction(name: "easeOutQuint", controlPoints: 0.23, 1, 0.32, 1)
    public static let easeInOutQuint = TimingFunction(name: "easeInOutQuint", controlPoints: 0.86, 0, 0.07, 1)
    public static let easeInExpo = TimingFunction(name: "easeInExpo", controlPoints: 0.95, 0.05, 0.795, 0.035)
    public static let easeOutExpo = TimingFunction(name: "easeOutExpo", controlPoints: 0.19, 1, 0.22, 1)
    public static let easeInOutExpo = TimingFunction(name: "easeInOutExpo", controlPoints: 1, 0, 0, 1)
    public static let easeInCirc = TimingFunction(name: "easeInCirc", controlPoints: 0.6, 0.04, 0.98, 0.335)
    public static let easeOutCirc = TimingFunction(name: "easeOutCirc", controlPoints: 0.075, 0.82, 0.165, 1)
    public static let easeInOutCirc = TimingFunction(name: "easeInOutCirc", controlPoints: 0.785, 0.135, 0.15, 0.86)
    public static let easeInBack = TimingFunction(name: "easeInBack", controlPoints: 0.6, -0.28, 0.735, 0.045)
    public static let easeOutBack = TimingFunction(name: "easeOutBack", controlPoints: 0.175, 0.885, 0.32, 1.275)
    public static let easeInOutBack = TimingFunction(name: "easeInOutBack", controlPoints: 0.68, -0.55, 0.265, 1.55)
    #endif
}
