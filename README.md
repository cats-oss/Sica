# AbemaAnimator
AbemaAnimator is CAAnimation wrapper animator

## Usage

### Sample Animation

#### Sequence Animation
```swift
let animator = Animator(view: sampleView, forKey: "sampleAnimation")
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 2, timingFunction: .easeOutExpo)
    .addSpringAnimation(keyPath: .boundsSize, from: sampleView.frame.size, to: CGSize(width: 240, height: 240), damping: 12, mass: 1, stiffness: 240, initialVelocity: 0, duration: 1)
    .run(type: .sequence)
```
![SequenceAnimation](resources/sequenceAnimation.gif)


#### Parallel Animation
```swift
let animator = Animator(view: sampleView, forKey: "sampleAnimation")
animator
    .addBasicAnimation(keyPath: .positionX, from: 50, to: 150, duration: 5, timingFunction: .easeOutExpo)
    .addBasicAnimation(keyPath: .transformRotationZ, from: 0, to: CGFloat.pi, duration: 3, timingFunction: .easeOutExpo)
    .run(type: .parallel)
```
![ParallelAnimation](resources/parallelAnimation.gif)



#### Forever Animation
```swift
let animator = Animator(view: sampleView, forKey: "sampleAnimation")
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


## License
AbemaAnimator is available under the MIT license. See the LICENSE file for more info.
