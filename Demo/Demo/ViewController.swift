//
//  ViewController.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let sampleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        sampleView.center.x = self.view.frame.width / 2
        sampleView.center.y = self.view.frame.height / 2
        sampleView.backgroundColor = .red
        view.addSubview(sampleView)

        Animation: do {
            let animator = Animator(view: sampleView)
            let v: [CGFloat] = [0, 12, 10, 4, 10, -22].map { $0 + sampleView.center.y }
            let d = [0.5, 1.5, 0.2, 0.8, 0.2]
            let timingFunctions: [TimingFunction] = [.easeOutExpo, .easeInOutCubic, .easeOutCubic, .easeInOutSine, .easeInQuint]

            animator.delay(4)
                .addBasicAnimation(keyPath: .positionY, from: v[0], to: v[1], duration: d[0], timingFunction: timingFunctions[0])
                .addBasicAnimation(keyPath: .positionY, from: v[1], to: v[2], duration: d[1], timingFunction: timingFunctions[1])
                .addBasicAnimation(keyPath: .positionY, from: v[2], to: v[3], duration: d[2], timingFunction: timingFunctions[2])
                .addBasicAnimation(keyPath: .positionY, from: v[3], to: v[4], duration: d[3], timingFunction: timingFunctions[3])
                .addBasicAnimation(keyPath: .positionY, from: v[4], to: v[5], duration: d[4], delay: 0.7, timingFunction: timingFunctions[4])
                .addSpringAnimation(keyPath: .boundsSize, from: CGSize(width: 0, height: 0), to:  CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
                .run(type: .sequence) {
                    print("Animation Done")
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
