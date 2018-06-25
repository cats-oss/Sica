//
//  Transition.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

public struct Transition {
    public static let fade = Transition(rawValue: kCATransitionFade)
    public static let moveIn = Transition(rawValue: kCATransitionMoveIn)
    public static let push = Transition(rawValue: kCATransitionPush)
    public static let reveal = Transition(rawValue: kCATransitionReveal)

    let rawValue: String
}

public struct TransitionSub {
    public static let right = TransitionSub(rawValue: kCATransitionFromRight)
    public static let left = TransitionSub(rawValue: kCATransitionFromLeft)
    public static let top = TransitionSub(rawValue: kCATransitionFromTop)
    public static let bottom = TransitionSub(rawValue: kCATransitionFromBottom)

    let rawValue: String
}
