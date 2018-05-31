# AbemaAnimator
AbemaAnimator is CAAnimation wrapper animator

## Usage

##### Sample Animation
```swift
let animator = Animator(view: sampleView, forKey: "sampleAnimation")
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 2, timingFunction: .easeOutExpo)
    .addSpringAnimation(keyPath: .boundsSize, from: sampleView.frame.size, to: CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
    .run(type: .sequence)
```
![SampleAnimation](resources/sampleAnimation.gif)


#### Forever Animation
```swift
let animator = Animator(view: sampleView, forKey: "sampleAnimation")

animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 2, timingFunction: .easeOutExpo)
    .addSpringAnimation(keyPath: .boundsSize, from: sampleView.frame.size, to: CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
    .forever()
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


## License
AbemaAnimator is available under the MIT license. See the LICENSE file for more info.
