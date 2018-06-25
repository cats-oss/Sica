import UIKit
import Sica

class EasingCell: UICollectionViewCell {
    
    var label: UILabel!
    var animationView: UIView!
    var timingFunction: TimingFunction = .default
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .white
        self.contentView.layer.borderWidth = 3
        
        animationView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        animationView.center.x = contentView.frame.width / 2
        animationView.center.y = contentView.frame.height / 2
        animationView.backgroundColor = .red
        contentView.addSubview(animationView)
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: 30))
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .center
        label.center.x = contentView.frame.width / 2
        label.center.y = contentView.frame.height - 15
        contentView.addSubview(label)
    }
    
    func configure(timingFunction: TimingFunction) {
        label.text = timingFunction.name
        self.timingFunction = timingFunction
    }
    
    func animate() {
        let animator = Animator(view: animationView, forKey: "sampleAnimation")
        animator
            .addBasicAnimation(keyPath: .positionX, from: 15, to: 50, duration: 2, timingFunction: timingFunction)
            .addBasicAnimation(keyPath: .positionX, from: 50, to: 15, duration: 2, timingFunction: timingFunction)
            .forever(autoreverses: false)
            .run(type: .sequence) {
                print("Animation Done")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
