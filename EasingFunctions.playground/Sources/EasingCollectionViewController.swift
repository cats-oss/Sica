import Foundation
import UIKit
import Shika

public class EasingCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView: UICollectionView!
    let timingFunctions: [TimingFunction] = [
        .default,
        .linear,
        .easeIn,
        .easeOut,
        .easeInEaseOut,
        .easeInSine,
        .easeOutSine,
        .easeInOutSine,
        .easeInQuad,
        .easeOutQuad,
        .easeInOutQuad,
        .easeInCubic,
        .easeOutCubic,
        .easeInOutCubic,
        .easeInQuart,
        .easeOutQuart,
        .easeInOutQuart,
        .easeInQuint,
        .easeOutQuint,
        .easeInOutQuint,
        .easeInExpo,
        .easeOutExpo,
        .easeInOutExpo,
        .easeInCirc,
        .easeOutCirc,
        .easeInOutCirc,
        .easeInBack,
        .easeOutBack,
        .easeInOutBack
    ]

    public override func viewDidLoad() {
        super.viewDidLoad()

        let width: CGFloat = 600
        let height: CGFloat = 600
        self.view.frame = CGRect(x: 0, y: 0, width: width, height: height)

        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 6.0
        flowLayout.minimumLineSpacing = 6.0
        
        let cellWidth = (width - (flowLayout.minimumInteritemSpacing * 7)) / 6
        let cellHight = (height - (flowLayout.minimumLineSpacing * 7)) / 6
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHight)

        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.register(EasingCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightGray
        self.view.addSubview(self.collectionView)

        let startButton = UIButton(frame: CGRect(x: 0, y: self.collectionView.frame.size.height - 20, width: 60, height: 20))
        startButton.setTitle("start", for: .normal)
        startButton.backgroundColor = .blue
        startButton.addTarget(self, action: #selector(self.tappedStartButton), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EasingCell
        cell.configure(timingFunction: timingFunctions[indexPath.row])
        return cell
    }

    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timingFunctions.count
    }

    @objc func tappedStartButton() {
        guard let visibleCells = self.collectionView.visibleCells as? [EasingCell] else { return }
        for cell in visibleCells {
            cell.animate()
        }
    }
}
