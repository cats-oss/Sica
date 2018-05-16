//
//  AbemaAnimator.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import Foundation
import UIKit

public enum AnimationPlayType {
    case sequence
    case parallel
}


final public class AbemaAnimator {

    private let group = CAAnimationGroup()
    private var animations = [CAAnimation]()

    @discardableResult
    public func delay(_ delay: Double = 0) -> Self {
        group.beginTime = CACurrentMediaTime() + delay
        return self
    }

    @discardableResult
    public func run(type: AnimationPlayType, view: UIView, completion: (() -> Void)? = nil) -> AnimationCanceller {

        if case .sequence = type {
            animations.sequence()
        }
        group.animations = animations
        group.duration = animations.totalDuration(type: type)
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false


        let key = UUID().uuidString
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            completion?()
        }
        view.layer.add(group, forKey: key)
        CATransaction.commit()
        return AnimationCanceller(layer: view.layer, key: key)
    }

    @discardableResult
    public func addBasicAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let basicAnimation = CABasicAnimation(keyPath: keyPath.rawValue)
        basicAnimation.fromValue = from
        basicAnimation.toValue = to
        basicAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(basicAnimation)
        return self
    }

    @discardableResult
    public func addSpringAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, damping: CGFloat, mass: CGFloat, stiffness: CGFloat, initialVelocity: CGFloat, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let springAnimation = CASpringAnimation(keyPath: keyPath.rawValue)
        springAnimation.fromValue = from
        springAnimation.toValue = to
        springAnimation.damping = damping
        springAnimation.mass = mass
        springAnimation.stiffness = stiffness
        springAnimation.initialVelocity = initialVelocity
        springAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(springAnimation)
        return self
    }

    @discardableResult
    public func addTransitionAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, startProgress: Float, endProgress: Float, type: TransitionType, subtype: TransitionSubType, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let transitionAnimation = CATransition()
        transitionAnimation.startProgress = startProgress
        transitionAnimation.endProgress = endProgress
        transitionAnimation.type = type.rawValue
        transitionAnimation.subtype = subtype.rawValue
        transitionAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(transitionAnimation)
        return self
    }
}
