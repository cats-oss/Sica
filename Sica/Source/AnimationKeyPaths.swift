//
//  AnimationKeyPaths.swift
//  Demo
//
//  Created by 中澤 郁斗 on 2018/05/16.
//  Copyright © 2018年 中澤 郁斗. All rights reserved.
//

#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

open class AnimationKeyPaths {
    fileprivate init() {}
}

public protocol AnimationValueType {}

public final class AnimationKeyPath<ValueType: AnimationValueType>: AnimationKeyPaths {
    let rawValue: String

    init(keyPath: String) {
        self.rawValue = keyPath
    }
}

extension Array: AnimationValueType {}
extension Bool: AnimationValueType {}
extension CALayer: AnimationValueType {}
extension CATransform3D: AnimationValueType {}
extension CGColor: AnimationValueType {}
extension CGFloat: AnimationValueType {}
extension CGPath: AnimationValueType {}
extension CGPoint: AnimationValueType {}
extension CGRect: AnimationValueType {}
extension CGSize: AnimationValueType {}
extension CIFilter: AnimationValueType {}

extension AnimationKeyPaths {
    public static let anchorPoint       = AnimationKeyPath<CGPoint>(keyPath: #keyPath(CALayer.anchorPoint))
    public static let backgroundColor   = AnimationKeyPath<CGColor>(keyPath: #keyPath(CALayer.backgroundColor))
    public static let borderColor       = AnimationKeyPath<CGColor>(keyPath: #keyPath(CALayer.borderColor))
    public static let borderWidth       = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.borderWidth))
    public static let bounds            = AnimationKeyPath<CGRect>(keyPath: #keyPath(CALayer.bounds))
    public static let contents          = AnimationKeyPath<[Any]>(keyPath: #keyPath(CALayer.contents))
    public static let contentsRect      = AnimationKeyPath<CGRect>(keyPath: #keyPath(CALayer.contentsRect))
    public static let cornerRadius      = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.cornerRadius))
    public static let filters           = AnimationKeyPath<[CIFilter]>(keyPath: #keyPath(CALayer.filters))
    public static let frame             = AnimationKeyPath<CGRect>(keyPath: #keyPath(CALayer.frame))
    public static let hidden            = AnimationKeyPath<Bool>(keyPath: #keyPath(CALayer.hidden))
    public static let mask              = AnimationKeyPath<CALayer>(keyPath: #keyPath(CALayer.mask))
    public static let masksToBounds     = AnimationKeyPath<Bool>(keyPath: #keyPath(CALayer.masksToBounds))
    public static let opacity           = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.opacity))
    public static let path              = AnimationKeyPath<CGPath>(keyPath: #keyPath(CAShapeLayer.path))
    public static let position          = AnimationKeyPath<CGPoint>(keyPath: #keyPath(CALayer.position))
    public static let shadowColor       = AnimationKeyPath<CGColor>(keyPath: #keyPath(CALayer.shadowColor))
    public static let shadowOffset      = AnimationKeyPath<CGSize>(keyPath: #keyPath(CALayer.shadowOffset))
    public static let shadowOpacity     = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.shadowOpacity))
    public static let shadowPath        = AnimationKeyPath<CGPath>(keyPath: #keyPath(CALayer.shadowPath))
    public static let shadowRadius      = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.shadowRadius))
    public static let sublayers         = AnimationKeyPath<[CALayer]>(keyPath: #keyPath(CALayer.sublayers))
    public static let sublayerTransform = AnimationKeyPath<CATransform3D>(keyPath: #keyPath(CALayer.sublayerTransform))
    public static let transform         = AnimationKeyPath<CATransform3D>(keyPath: #keyPath(CALayer.transform))
    public static let zPosition         = AnimationKeyPath<CGFloat>(keyPath: #keyPath(CALayer.zPosition))
}

extension AnimationKeyPaths {
    public static let anchorPointX = AnimationKeyPath<CGPoint>(keyPath: "\(#keyPath(CALayer.anchorPoint)).x")
    public static let anchorPointy = AnimationKeyPath<CGPoint>(keyPath: "\(#keyPath(CALayer.anchorPoint)).y")
}

extension AnimationKeyPaths {
    public static let boundsOrigin     = AnimationKeyPath<CGPoint>(keyPath: "\(#keyPath(CALayer.bounds)).origin")
    public static let boundsOriginX    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.bounds)).origin.x")
    public static let boundsOriginY    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.bounds)).origin.y")
    public static let boundsSize       = AnimationKeyPath<CGSize>(keyPath: "\(#keyPath(CALayer.bounds)).size")
    public static let boundsSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.bounds)).size.width")
    public static let boundsSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.bounds)).size.height")

}

extension AnimationKeyPaths {
    public static let contentsRectOrigin     = AnimationKeyPath<CGPoint>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin")
    public static let contentsRectOriginX    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin.x")
    public static let contentsRectOriginY    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.contentsRect)).origin.y")
    public static let contentsRectSize       = AnimationKeyPath<CGSize>(keyPath: "\(#keyPath(CALayer.contentsRect)).size")
    public static let contentsRectSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.contentsRect)).size.width")
    public static let contentsRectSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.contentsRect)).size.height")
}

extension AnimationKeyPaths {
    public static let frameOrigin     = AnimationKeyPath<CGPoint>(keyPath: "\(#keyPath(CALayer.frame)).origin")
    public static let frameOriginX    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.frame)).origin.x")
    public static let frameOriginY    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.frame)).origin.y")
    public static let frameSize       = AnimationKeyPath<CGSize>(keyPath: "\(#keyPath(CALayer.frame)).size")
    public static let frameSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.frame)).size.width")
    public static let frameSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.frame)).size.height")
}

extension AnimationKeyPaths {
    public static let positionX = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.position)).x")
    public static let positionY = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.position)).y")
}

extension AnimationKeyPaths {
    public static let shadowOffsetWidth  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.shadowOffset)).width")
    public static let shadowOffsetHeight = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.shadowOffset)).height")
}

extension AnimationKeyPaths {
    public static let sublayerTransformRotationX    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.x")
    public static let sublayerTransformRotationY    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.y")
    public static let sublayerTransformRotationZ    = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).rotation.z")
    public static let sublayerTransformScaleX       = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.x")
    public static let sublayerTransformScaleY       = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.y")
    public static let sublayerTransformScaleZ       = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).scale.z")
    public static let sublayerTransformTranslationX = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.x")
    public static let sublayerTransformTranslationY = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.y")
    public static let sublayerTransformTranslationZ = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.sublayerTransform)).translation.z")
}

extension AnimationKeyPaths {
    public static let transformRotationX     = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).rotation.x")
    public static let transformRotationY     = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).rotation.y")
    public static let transformRotationZ     = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).rotation.z")
    public static let transformScaleX        = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).scale.x")
    public static let transformScaleY        = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).scale.y")
    public static let transformScaleZ        = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).scale.z")
    public static let transformTranslationX  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).translation.x")
    public static let transformTranslationY  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).translation.y")
    public static let transformTranslationZ  = AnimationKeyPath<CGFloat>(keyPath: "\(#keyPath(CALayer.transform)).translation.z")
}
