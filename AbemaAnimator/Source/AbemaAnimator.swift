//
//  AbemaAnimator.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import Foundation
import UIKit



final public class Animator {

    public enum AnimationPlayType {
        case sequence
        case parallel
    }

    private let view: UIView
    private let group = CAAnimationGroup()
    private var animations = [CAAnimation]()

    public init(view: UIView) {
        self.view = view
    }

    private func sequence() {
        for (i, anim) in animations.enumerated() where i > 0 {
            let prev = animations[i - 1]
            anim.beginTime += prev.beginTime + prev.duration
        }
    }

    private func totalDuration(type: AnimationPlayType) -> Double {
        switch type {
        case .sequence:
            return animations.last.map { $0.beginTime + $0.duration} ?? 0
        case .parallel:
            return animations.map { $0.duration }.max() ?? 0
        }
    }

    public func delay(_ delay: Double = 0) -> Self {
        group.beginTime = CACurrentMediaTime() + delay
        return self
    }

    @discardableResult
    public func run(type: AnimationPlayType, completion: (() -> Void)? = nil) -> AnimationCanceller {

        if case .sequence = type {
            sequence()
        }
        group.animations = animations
        group.duration = totalDuration(type: type)
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = false


        let key = UUID().uuidString

        if let completion = completion {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                completion()
            }
            view.layer.add(group, forKey: key)
            CATransaction.commit()
        } else {
            view.layer.add(group, forKey: key)
        }
        return AnimationCanceller(layer: view.layer, key: key)
    }

    public func addBasicAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
        let basicAnimation = CABasicAnimation(keyPath: keyPath.rawValue)
        basicAnimation.fromValue = from
        basicAnimation.toValue = to
        basicAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(basicAnimation)
        return self
    }

    public func addSpringAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, damping: CGFloat, mass: CGFloat, stiffness: CGFloat, initialVelocity: CGFloat, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
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

    public func addTransitionAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, startProgress: Float, endProgress: Float, type: TransitionType, subtype: TransitionSubType, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
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
