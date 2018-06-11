# AbemaAnimator
AbemaAnimator can execute various animations sequentially or parallely

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

### SwiftPackageManager
AbemaAnimator is available through `SwiftPM`, create ` Package.swift` and add `dependencies` value
```Package.swift
dependencies: [
    .package(url: "git@github.com:abema/AbemaAnimator.git", from: "1.0.0")
]
```
See also: [GitHub - j-channings/swift-package-manager-ios: Example of how to use SPM v4 to manage iOS dependencies](https://github.com/j-channings/swift-package-manager-ios)


## License
AbemaAnimator is available under the MIT license. See the LICENSE file for more info.
