//
//  TransitionType.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

public struct TransitionType {
    public static let fade = TransitionType(rawValue: kCATransitionFade)
    public static let moveIn = TransitionType(rawValue: kCATransitionMoveIn)
    public static let push = TransitionType(rawValue: kCATransitionPush)
    public static let reveal = TransitionType(rawValue: kCATransitionReveal)

    let rawValue: String
}

public struct TransitionSubType {
    public static let right = TransitionType(rawValue: kCATransitionFromRight)
    public static let left = TransitionType(rawValue: kCATransitionFromLeft)
    public static let top = TransitionType(rawValue: kCATransitionFromTop)
    public static let bottom = TransitionType(rawValue: kCATransitionFromBottom)

    let rawValue: String
}
