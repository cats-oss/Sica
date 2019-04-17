//
//  Animator.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
public typealias View = UIView
#elseif os(macOS)
import AppKit
public typealias View = NSView
#endif

public final class Animator {

    public enum AnimationPlayType {
        /// run animation sequentially
        case sequence

        /// run animation parallelly
        case parallel
    }

    private weak var layer: CALayer?
    private var group = CAAnimationGroup()
    private var animations = [CAAnimation]()
    public private(set) var isCompleted: Bool = false

    public let key: String

    #if DEBUG
    private var _deinit: (() -> ())? = nil
    deinit {
        _deinit?()
    }
    #endif

    public init(view: View, forKey key: String? = nil) {
        #if os(iOS) || os(tvOS)
        self.layer = view.layer
        #elseif os(macOS)
        view.wantsLayer = true
        if let layer = view.layer {
            self.layer = layer
        } else {
            fatalError("view.layer is nil in \(#file)_\(#function)_\(#line)")
        }
        #endif

        self.key = key ?? UUID().uuidString
    }

    public init(layer: CALayer, forKey key: String? = nil) {
        self.layer = layer
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

    public func removeAll() -> Self {
        layer?.removeAllAnimations()
        group = CAAnimationGroup()
        animations = []
        isCompleted = false
        return self
    }

    public func cancel() {
        layer?.removeAnimation(forKey: key)
    }

    public func run(type: AnimationPlayType, fillMode: FillMode = FillMode.forwards, isRemovedOnCompletion: Bool = false, completion: (() -> Void)? = nil) {

        if case .sequence = type {
            calculateBeginTime()
        }
        group.animations = animations
        group.duration = totalDuration(type: type)
        group.fillMode = fillMode.rawValue
        group.isRemovedOnCompletion = isRemovedOnCompletion

        if let completion = completion {
            CATransaction.begin()
            CATransaction.setCompletionBlock {
                completion()
            }
            layer?.add(group, forKey: key)
            CATransaction.commit()
        } else {
            layer?.add(group, forKey: key)
        }
        isCompleted = true
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

    @available(iOS 9, tvOS 10.0, macOS 10.11, *)
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

    public func addTransitionAnimation(startProgress: Float, endProgress: Float, type: Transition, subtype: TransitionSub, duration: Double, delay: Double = 0, timingFunction: TimingFunction = .default) -> Self {
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

#if DEBUG
extension Animator {
    struct Test {
        fileprivate let base: Animator
        
        var group: CAAnimationGroup {
            return base.group
        }
        var animations: [CAAnimation] {
            return base.animations
        }

        func setDeinit(_ _deinit: (() -> ())?) {
            base._deinit = _deinit
        }
    }

    var test: Test {
        return Test(base: self)
    }
}
#endif
