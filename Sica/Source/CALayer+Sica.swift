//
//  CALayer+Sica.swift
//  Sica-iOS
//
//  Created by 中澤 郁斗 on 2018/07/05.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

import Foundation
import QuartzCore

private let _animatorAssociatedKey = UnsafeMutablePointer<UInt>.allocate(capacity: 1)

extension CALayer {
    public var sica: Animator {
        set {
            objc_setAssociatedObject(self, _animatorAssociatedKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            guard let animator = objc_getAssociatedObject(self, _animatorAssociatedKey) as? Animator else {
                let animator =  Animator(layer: self)
                objc_setAssociatedObject(self, _animatorAssociatedKey, animator, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                return animator
            }
            return animator
        }
    }
}
