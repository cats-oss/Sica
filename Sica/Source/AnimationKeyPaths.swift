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
    public static let anchorPoint       = AnimationKeyPath<CGPoint>(keyPath: "anchorPoint")
    public static let backgroundColor   = AnimationKeyPath<CGColor>(keyPath: "backgroundColor")
    public static let borderColor       = AnimationKeyPath<CGColor>(keyPath: "borderColor")
    public static let borderWidth       = AnimationKeyPath<CGFloat>(keyPath: "borderWidth")
    public static let bounds            = AnimationKeyPath<CGRect>(keyPath: "bounds")
    public static let contents          = AnimationKeyPath<[Any]>(keyPath: "contents")
    public static let contentsRect      = AnimationKeyPath<CGRect>(keyPath: "contentsRect")
    public static let cornerRadius      = AnimationKeyPath<CGFloat>(keyPath: "cornerRadius")
    public static let filters           = AnimationKeyPath<[CIFilter]>(keyPath: "filters")
    public static let frame             = AnimationKeyPath<CGRect>(keyPath: "frame")
    public static let hidden            = AnimationKeyPath<Bool>(keyPath: "hidden")
    public static let mask              = AnimationKeyPath<CALayer>(keyPath: "mask")
    public static let masksToBounds     = AnimationKeyPath<Bool>(keyPath: "masksToBounds")
    public static let opacity           = AnimationKeyPath<CGFloat>(keyPath: "opacity")
    public static let path              = AnimationKeyPath<CGPath>(keyPath: "path")
    public static let position          = AnimationKeyPath<CGPoint>(keyPath: "position")
    public static let shadowColor       = AnimationKeyPath<CGColor>(keyPath: "shadowColor")
    public static let shadowOffset      = AnimationKeyPath<CGSize>(keyPath: "shadowOffset")
    public static let shadowOpacity     = AnimationKeyPath<CGFloat>(keyPath: "shadowOpacity")
    public static let shadowPath        = AnimationKeyPath<CGPath>(keyPath: "shadowPath")
    public static let shadowRadius      = AnimationKeyPath<CGFloat>(keyPath: "shadowRadius")
    public static let sublayers         = AnimationKeyPath<[CALayer]>(keyPath: "sublayers")
    public static let sublayerTransform = AnimationKeyPath<CATransform3D>(keyPath: "sublayerTransform")
    public static let transform         = AnimationKeyPath<CATransform3D>(keyPath: "transform")
    public static let zPosition         = AnimationKeyPath<CGFloat>(keyPath: "zPosition")
}

extension AnimationKeyPaths {
    public static let anchorPointX = AnimationKeyPath<CGPoint>(keyPath: "anchorPoint.x")
    public static let anchorPointy = AnimationKeyPath<CGPoint>(keyPath: "anchorPoint.y")
}

extension AnimationKeyPaths {
    public static let boundsOrigin     = AnimationKeyPath<CGPoint>(keyPath: "bounds.origin")
    public static let boundsOriginX    = AnimationKeyPath<CGFloat>(keyPath: "bounds.origin.x")
    public static let boundsOriginY    = AnimationKeyPath<CGFloat>(keyPath: "bounds.origin.y")
    public static let boundsSize       = AnimationKeyPath<CGSize>(keyPath: "bounds.size")
    public static let boundsSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "bounds.size.width")
    public static let boundsSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "bounds.size.height")

}

extension AnimationKeyPaths {
    public static let contentsRectOrigin     = AnimationKeyPath<CGPoint>(keyPath: "contentsRect.origin")
    public static let contentsRectOriginX    = AnimationKeyPath<CGFloat>(keyPath: "contentsRect.origin.x")
    public static let contentsRectOriginY    = AnimationKeyPath<CGFloat>(keyPath: "contentsRect.origin.y")
    public static let contentsRectSize       = AnimationKeyPath<CGSize>(keyPath: "contentsRect.size")
    public static let contentsRectSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "contentsRect.size.width")
    public static let contentsRectSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "contentsRect.size.height")
}

extension AnimationKeyPaths {
    public static let frameOrigin     = AnimationKeyPath<CGPoint>(keyPath: "frame.origin")
    public static let frameOriginX    = AnimationKeyPath<CGFloat>(keyPath: "frame.origin.x")
    public static let frameOriginY    = AnimationKeyPath<CGFloat>(keyPath: "frame.origin.y")
    public static let frameSize       = AnimationKeyPath<CGSize>(keyPath: "frame.size")
    public static let frameSizeWidth  = AnimationKeyPath<CGFloat>(keyPath: "frame.size.width")
    public static let frameSizeHeight = AnimationKeyPath<CGFloat>(keyPath: "frame.size.height")
}

extension AnimationKeyPaths {
    public static let positionX = AnimationKeyPath<CGFloat>(keyPath: "position.x")
    public static let positionY = AnimationKeyPath<CGFloat>(keyPath: "position.y")
}

extension AnimationKeyPaths {
    public static let shadowOffsetWidth  = AnimationKeyPath<CGFloat>(keyPath: "shadowOffset.width")
    public static let shadowOffsetHeight = AnimationKeyPath<CGFloat>(keyPath: "shadowOffset.height")
}

extension AnimationKeyPaths {
    public static let sublayerTransformRotationX    = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.rotation.x")
    public static let sublayerTransformRotationY    = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.rotation.y")
    public static let sublayerTransformRotationZ    = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.rotation.z")
    public static let sublayerTransformScaleX       = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.scale.x")
    public static let sublayerTransformScaleY       = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.scale.y")
    public static let sublayerTransformScaleZ       = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.scale.z")
    public static let sublayerTransformTranslationX = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.translation.x")
    public static let sublayerTransformTranslationY = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.translation.y")
    public static let sublayerTransformTranslationZ = AnimationKeyPath<CGFloat>(keyPath: "sublayerTransform.translation.z")
}

extension AnimationKeyPaths {
    public static let transformRotationX     = AnimationKeyPath<CGFloat>(keyPath: "transform.rotation.x")
    public static let transformRotationY     = AnimationKeyPath<CGFloat>(keyPath: "transform.rotation.y")
    public static let transformRotationZ     = AnimationKeyPath<CGFloat>(keyPath: "transform.rotation.z")
    public static let transformScaleX        = AnimationKeyPath<CGFloat>(keyPath: "transform.scale.x")
    public static let transformScaleY        = AnimationKeyPath<CGFloat>(keyPath: "transform.scale.y")
    public static let transformScaleZ        = AnimationKeyPath<CGFloat>(keyPath: "transform.scale.z")
    public static let transformTranslationX  = AnimationKeyPath<CGFloat>(keyPath: "transform.translation.x")
    public static let transformTranslationY  = AnimationKeyPath<CGFloat>(keyPath: "transform.translation.y")
    public static let transformTranslationZ  = AnimationKeyPath<CGFloat>(keyPath: "transform.translation.z")
}
