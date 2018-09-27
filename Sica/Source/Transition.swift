//
//  Transition.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import QuartzCore

public struct Transition {
    #if swift(>=4.2)
    typealias RawValue = CATransitionType
    public static let fade = Transition(rawValue: .fade)
    public static let moveIn = Transition(rawValue: .moveIn)
    public static let push = Transition(rawValue: .push)
    public static let reveal = Transition(rawValue: .reveal)
    #else
    typealias RawValue = String
    public static let fade = Transition(rawValue: kCATransitionFade)
    public static let moveIn = Transition(rawValue: kCATransitionMoveIn)
    public static let push = Transition(rawValue: kCATransitionPush)
    public static let reveal = Transition(rawValue: kCATransitionReveal)
    #endif

    let rawValue: RawValue
}

public struct TransitionSub {
    #if swift(>=4.2)
    typealias RawValue = CATransitionSubtype
    public static let right = TransitionSub(rawValue: .fromRight)
    public static let left = TransitionSub(rawValue: .fromLeft)
    public static let top = TransitionSub(rawValue: .fromTop)
    public static let bottom = TransitionSub(rawValue: .fromBottom)
    #else
    typealias RawValue = String
    public static let right = TransitionSub(rawValue: kCATransitionFromRight)
    public static let left = TransitionSub(rawValue: kCATransitionFromLeft)
    public static let top = TransitionSub(rawValue: kCATransitionFromTop)
    public static let bottom = TransitionSub(rawValue: kCATransitionFromBottom)
    #endif

    let rawValue: RawValue
}
