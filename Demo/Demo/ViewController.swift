//
//  ViewController.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import UIKit
import AbemaAnimator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sampleView.center.x = self.view.frame.width / 2
        sampleView.center.y = self.view.frame.height / 2
        sampleView.backgroundColor = .red
        view.addSubview(sampleView)

        Animation: do {
            let animator = Animator(view: sampleView, forKey: "sampleAnimation")

            animator.delay(4)
                .addBasicAnimation(keyPath: .positionY, from: 368, to: 380, duration: 0.5, timingFunction: .easeOutExpo)
                .addBasicAnimation(keyPath: .positionY, from: 380, to: 378, duration: 1.5, timingFunction: .easeInOutCubic)
                .addBasicAnimation(keyPath: .positionY, from: 378, to: 372, duration: 0.2, timingFunction: .easeOutCubic)
                .addBasicAnimation(keyPath: .positionY, from: 372, to: 378, duration: 0.8, timingFunction: .easeInOutSine)
                .addBasicAnimation(keyPath: .positionY, from: 378, to: 346, duration: 0.2, delay: 0.7, timingFunction: .easeInQuint)
                .addSpringAnimation(keyPath: .boundsSize, from: CGSize(width: 0, height: 0), to: CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
                .run(type: .sequence) {
                    print("Animation Done")
            }
        }
    }
}
