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

public typealias BasicValue<T> = (from: T, to: T)
public typealias SpringValue<T> = (from: T, to: T, damping: CGFloat, mass: CGFloat, stiffness: CGFloat, initialVelocity: CGFloat)
public typealias TransitionValue<T> = (startProgress: Float, endProgress: Float, type: TransitionType, subtype: TransitionSubType)

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
    public func addBasicAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, value: BasicValue<T>, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let basicAnimation = CABasicAnimation(keyPath: keyPath.rawValue)
        basicAnimation.fromValue = value.from
        basicAnimation.toValue = value.to
        basicAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(basicAnimation)
        return self
    }

    @discardableResult
    public func addSpringAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, value: SpringValue<T>, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let springAnimation = CASpringAnimation(keyPath: keyPath.rawValue)
        springAnimation.fromValue = value.from
        springAnimation.toValue = value.to
        springAnimation.damping = value.damping
        springAnimation.mass = value.mass
        springAnimation.stiffness = value.stiffness
        springAnimation.initialVelocity = value.initialVelocity
        springAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(springAnimation)
        return self
    }

    @discardableResult
    public func addTransitionAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, value: TransitionValue<T>, delay: Double = 0, duration: Double, timingFunction: TimingFunction = .default) -> Self {
        let transitionAnimation = CATransition()
        transitionAnimation.startProgress = value.startProgress
        transitionAnimation.endProgress = value.endProgress
        transitionAnimation.type = value.type.rawValue
        transitionAnimation.subtype = value.subtype.rawValue
        transitionAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(transitionAnimation)
        return self
    }
}
