//
//  AnimationCanceller.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import UIKit

public struct AnimationCanceller {
    let layer: CALayer
    let key: String

    public func cancelAnimation() {
        layer.removeAnimation(forKey: key)
    }
}
