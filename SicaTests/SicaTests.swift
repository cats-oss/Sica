//
//  SicaTests.swift
//  SicaTests
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import XCTest
@testable import Sica

class SicaTests: XCTestCase {
    var animator = Animator(view: View())
    
    override func setUp() {
        super.setUp()
        animator = Animator(view: View())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAnimationsCount() {
        _ = animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 1, to: 0, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 3, duration: 1)

        XCTAssertEqual(animator.test.animations.count, 3)
    }

    func testAnimationCompleted() {
        XCTAssertEqual(animator.isCompleted, false)

        animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 1, to: 0, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 3, duration: 1)
            .run(type: .sequence) { [weak self] in
                guard let me = self else { return }
                XCTAssertEqual(me.animator.isCompleted, true)
        }
    }

    func testAddBasicAnimation() {
        _ = animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1, delay: 3, timingFunction: .easeIn)

        guard let animation = animator.test.animations.first as? CABasicAnimation,
            let key = animation.keyPath,
            let from = animation.fromValue as? CGFloat,
            let to = animation.toValue as? CGFloat,
            let timingFunction = animation.timingFunction else {
                XCTFail("CABasicAnimation has not been added")
                return
        }

        XCTAssertEqual(key, AnimationKeyPaths.positionY.rawValue)
        XCTAssertEqual(from, 0)
        XCTAssertEqual(to, 1)
        XCTAssertEqual(animation.duration, 1)
        XCTAssertEqual(animation.beginTime, 3)
        XCTAssertEqual(timingFunction, TimingFunction.easeIn.rawValue)
    }

    func testAddSpringAnimation() {
        _ = animator
            .addSpringAnimation(keyPath: .positionY, from: 0, to: 1, damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1, delay: 2, timingFunction: .easeIn)

        guard let animation = animator.test.animations.first as? CASpringAnimation,
            let key = animation.keyPath,
            let from = animation.fromValue as? CGFloat,
            let to = animation.toValue as? CGFloat,
            let timingFunction = animation.timingFunction else {
                XCTFail("CASpringAnimation has not been added")
                return
        }

        XCTAssertEqual(key, AnimationKeyPaths.positionY.rawValue)
        XCTAssertEqual(from, 0)
        XCTAssertEqual(to, 1)
        XCTAssertEqual(animation.damping, 12)
        XCTAssertEqual(animation.mass, 1)
        XCTAssertEqual(animation.stiffness, 240)
        XCTAssertEqual(animation.initialVelocity, 0)
        XCTAssertEqual(animation.duration, 1)
        XCTAssertEqual(animation.beginTime, 2)
        XCTAssertEqual(timingFunction, TimingFunction.easeIn.rawValue)
    }

    func testAddTransition() {
        _ = animator
            .addTransitionAnimation(startProgress: 0, endProgress: 1, type: .fade, subtype: .right, duration: 1, delay: 2, timingFunction: .easeIn)

        guard let animation = animator.test.animations.first as? CATransition,
            let timingFunction = animation.timingFunction else {
                XCTFail("CATransition has not been added")
                return
        }

        XCTAssertEqual(animation.startProgress, 0)
        XCTAssertEqual(animation.endProgress, 1)
        XCTAssertEqual(animation.type, Transition.fade.rawValue)
        XCTAssertEqual(animation.subtype, TransitionSub.right.rawValue)
        XCTAssertEqual(animation.duration, 1)
        XCTAssertEqual(animation.beginTime, 2)
        XCTAssertEqual(timingFunction, TimingFunction.easeIn.rawValue)
    }

    func testSequenceAnimation() {
        animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 1, to: 0, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 3, duration: 1)
            .run(type: .sequence)

        XCTAssertEqual(animator.test.group.duration, 3)
    }

    func testPrallelAnimation() {
        animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 1, to: 0, duration: 10)
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 3, duration: 1)
            .run(type: .parallel)

        XCTAssertEqual(animator.test.group.duration, 10)
    }

    func testRemoveAll() {
        animator
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 1, duration: 1)
            .addBasicAnimation(keyPath: .positionY, from: 1, to: 0, duration: 10)
            .addBasicAnimation(keyPath: .positionY, from: 0, to: 3, duration: 1)
            .run(type: .parallel)
        
        _ = animator.removeAll()
        XCTAssertEqual(animator.test.group.duration, 0)
        XCTAssertEqual(animator.test.animations.count, 0)
        XCTAssertEqual(animator.isCompleted, false)
    }
}
