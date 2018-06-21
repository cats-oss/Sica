# AbemaAnimator
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager)
[![Version](https://img.shields.io/cocoapods/v/AbemaAnimator.svg?style=flat)](https://cocoapods.org/pods/AbemaAnimator)
[![License](https://img.shields.io/cocoapods/l/AbemaAnimator.svg?style=flat)](https://cocoapods.org/pods/AbemaAnimator)

AbemaAnimator can execute various animations sequentially or parallely

## Features
- Animation with duration and delay
- parallel / sequence animation
- Easings
- Springs
- Transition

## Usage

### Sample Animation

#### Sequence Animation
```swift
let animator = Animator(view: sampleView)
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 2, timingFunction: .easeOutExpo)
    .addSpringAnimation(keyPath: .boundsSize, from: sampleView.frame.size, to: CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
    .run(type: .sequence)
```
![SequenceAnimation](resources/sequenceAnimation.gif)


#### Parallel Animation
```swift
let animator = Animator(view: sampleView)
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 5, timingFunction: .easeOutExpo)
    .addBasicAnimation(keyPath: .transformRotationZ, from: 0, to: CGFloat.pi, duration: 3, timingFunction: .easeOutExpo)
    .run(type: .parallel)
```
![ParallelAnimation](resources/parallelAnimation.gif)



#### Forever Animation
```swift
let animator = Animator(view: sampleView)
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 2, timingFunction: .easeOutExpo)
    .addBasicAnimation(keyPath: .positionX, from: 150, to: 50, duration: 2, timingFunction: .easeOutExpo)
    .forever(autoreverses: false)
    .run(type: .sequence)
```
![Forever](resources/forever.gif)

## Support

### Animation
- CABasicAnimation
- CATransition
- CASpringAnimation

### AnimationPlayType
you can choose animation play type
- run animation sequentially
- run animation parallely

### EasingFunctions
you can choose various timing functions

![EasingFunctions](resources/EasingFunctions.gif)

### KeyPaths Table
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.anchorPoint`|`anchorPoint`|
|`.backgroundColor`|`backgroundColor`|
|`.borderColor`|`borderColor`|
|`.borderWidth`|`borderWidth`|
|`.bounds`|`bounds`|
|`.contents`|`contents`|
|`.contentsRect`|`contentsRect`|
|`.cornerRadius`|`cornerRadius`|
|`.filters`|`filters`|
|`.frame`|`frame`|
|`.hidden`|`hidden`|
|`.mask`|`mask`|
|`.masksToBounds`|`masksToBounds`|
|`.opacity`|`opacity`|
|`.path`|`path`|
|`.position`|`position`|
|`.shadowColor`|`shadowColor`|
|`.shadowOffset`|`shadowOffset`|
|`.shadowOpacity`|`shadowOpacity`|
|`.shadowPath`|`shadowPath`|
|`.shadowRadius`|`shadowRadius`|
|`.sublayers`|`sublayers`|
|`.sublayerTransform`|`sublayerTransform`|
|`.transform`|`transform`|
|`.zPosition`|`zPosition`|

#### Anchor Point
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.anchorPointX`|`anchorPoint.x`|
|`.anchorPointy`|`anchorPoint.y`|

#### Bounds
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.boundsOrigin`|`bounds.origin`|
|`.boundsOriginX`|`bounds.origin.x`|
|`.boundsOriginY`|`bounds.origin.y`|
|`.boundsSize`|`bounds.size`|
|`.boundsSizeWidth`|`bounds.size.width`|
|`.boundsSizeHeight`|`bounds.size.height`|

#### Contents
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.contentsRectOrigin`|`contentsRect.origin`|
|`.contentsRectOriginX`|`contentsRect.origin.x`|
|`.contentsRectOriginY`|`contentsRect.origin.y`|
|`.contentsRectSize`|`contentsRect.size`|
|`.contentsRectSizeWidth`|`contentsRect.size.width`|
|`.contentsRectSizeHeight`|`contentsRect.size.height`|

#### Frame
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.frameOrigin`|`frame.origin`|
|`.frameOriginX`|`frame.origin.x`|
|`.frameOriginY`|`frame.origin.y`|
|`.frameSize`|`frame.size`|
|`.frameSizeWidth`|`frame.size.width`|
|`.frameSizeHeight`|`frame.size.height`|

#### Position
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.positionX`|`position.x`|
|`.positionY`|`position.y`|


#### Shadow Offset
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.shadowOffsetWidth`|`shadowOffset.width`|
|`.shadowOffsetHeight`|`shadowOffset.height`|

#### Sublayer Transform
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.sublayerTransformRotationX`|`sublayerTransform.rotation.x`|
|`.sublayerTransformRotationY`|`sublayerTransform.rotation.y`|
|`.sublayerTransformRotationZ`|`sublayerTransform.rotation.z`|
|`.sublayerTransformScaleX`|`sublayerTransform.scale.x`|
|`.sublayerTransformScaleY`|`sublayerTransform.scale.y`|
|`.sublayerTransformScaleZ`|`sublayerTransform.scale.z`|
|`.sublayerTransformTranslationX`|`sublayerTransform.translation.x`|
|`.sublayerTransformTranslationY`|`sublayerTransform.translation.y`|
|`.sublayerTransformTranslationZ`|`sublayerTransform.translation.z`|

#### Transform
|AbemaAnimator|KeyPath|
|:-:|:-:|
|`.transformRotationX`|`transform.rotation.x`|
|`.transformRotationY`|`transform.rotation.y`|
|`.transformRotationZ`|`transform.rotation.z`|
|`.transformScaleX`|`transform.scale.x`|
|`.transformScaleY`|`transform.scale.y`|
|`.transformScaleZ`|`transform.scale.z`|
|`.transformTranslationX`|`transform.translation.x`|
|`.transformTranslationY`|`transform.translation.y`|
|`.transformTranslationZ`|`transform.translation.z`|

## Requirements
- Xcode 9.3
- iOS 9 or greater


## Installation

### Carthage

If you’re using [Carthage](https://github.com/Carthage/Carthage), simply add
AbemaAnimator to your `Cartfile`:

```ruby
github "abema/AbemaAnimator"
```

### CocoaPods

AbemaAnimator is available through [CocoaPods](https://cocoapods.org). To instal
it, simply add the following line to your Podfile:

```ruby
pod 'AbemaAnimator'
```

### Swift Package Manager
AbemaAnimator is available through `SwiftPM`, create ` Package.swift` and add `dependencies` value
```Package.swift
dependencies: [
    .package(url: "git@github.com:abema/AbemaAnimator.git", from: "0.1.0")
]
```
See also: [GitHub - j-channings/swift-package-manager-ios: Example of how to use SPM v4 to manage iOS dependencies](https://github.com/j-channings/swift-package-manager-ios)


## License
AbemaAnimator is available under the MIT license. See the LICENSE file for more info.
