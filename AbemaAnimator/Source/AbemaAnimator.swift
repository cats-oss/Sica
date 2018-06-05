//
//  AbemaAnimator.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import UIKit

public final class Animator {

    public enum AnimationPlayType {
        /// run animation sequentially
        case sequence

        /// run animation parallelly
        case parallel
    }

    private let view: UIView
    private let group = CAAnimationGroup()
    private var animations = [CAAnimation]()
    public private(set) var isCompleted: Bool = false

    public let key: String

    public init(view: UIView, forKey key: String? = nil) {
        self.view = view
        self.key = key ?? UUID().uuidString
    }

    private func calculateBeginTime() {
        for (i, anim) in animations.enumerated() where i > 0 {
            let prev = animations[i - 1]
            anim.beginTime += prev.beginTime + prev.duration
        }
    }

    private func totalDuration(type: AnimationPlayType) -> Double {
        switch type {
        case .sequence:
            return animations.last.map { $0.beginTime + $0.duration } ?? 0
        case .parallel:
            return animations.map { $0.duration }.max() ?? 0
        }
    }

    public func delay(_ delay: Double) -> Self {
        if isCompleted { return self }
        let beginTime = delay < 0.0 ? 0.0 : delay
        group.beginTime = CACurrentMediaTime() + beginTime
        return self
    }

    public func forever(autoreverses: Bool = true) -> Self {
        if isCompleted { return self }
        group.repeatCount = Float.greatestFiniteMagnitude
        group.autoreverses = autoreverses
        return self
    }

    public func cancel() {
        view.layer.removeAnimation(forKey: key)
    }

    public func run(type: AnimationPlayType, isRemovedOnCompletion: Bool = false, completion: (() -> Void)? = nil) {

        if case .sequence = type {
            calculateBeginTime()
        }
        group.animations = animations
        group.duration = totalDuration(type: type)
        group.fillMode = kCAFillModeForwards
        group.isRemovedOnCompletion = isRemovedOnCompletion

        if let completion = completion {
            CATransaction.begin()
            CATransaction.setCompletionBlock { [weak self] in
                guard let me = self else { return }
                me.isCompleted = true
                completion()
            }
            view.layer.add(group, forKey: key)
            CATransaction.commit()
        } else {
            view.layer.add(group, forKey: key)
        }
    }

    public func addBasicAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
        if isCompleted { return self }
        let basicAnimation = CABasicAnimation(keyPath: keyPath.rawValue)
        basicAnimation.fromValue = from
        basicAnimation.toValue = to
        basicAnimation.configure(delay: delay, duration: duration, timingFunction: timingFunction)

        animations.append(basicAnimation)
        return self
    }

    public func addSpringAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, from: T, to: T, damping: CGFloat, mass: CGFloat, stiffness: CGFloat, initialVelocity: CGFloat, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
        if isCompleted { return self }
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

    public func addTransitionAnimation<T: AnimationValueType>(keyPath: AnimationKeyPath<T>, startProgress: Float, endProgress: Float, type: Transition, subtype: TransitionSub, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
        if isCompleted { return self }
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
