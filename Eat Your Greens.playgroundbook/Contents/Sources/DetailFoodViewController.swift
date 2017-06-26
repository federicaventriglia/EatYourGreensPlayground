import UIKit
import PlaygroundSupport
// PlaygroundLiveViewSafeAreaContainer
@objc (DetailFoodViewController)
public class DetailFoodViewController: BaseViewController, PlaygroundLiveViewSafeAreaContainer {
    
    var greensArray = DataModel.shared.fruitArray
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var passedItem: Fruit?
    var passedIndex: IndexPath!
    
    // - MARK: Overrides
    public override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.currentPage = passedIndex.row
        pageControl.isHidden = true
        setupBackground(forColors: (passedItem?.gradientColors)!)
        
        NSLayoutConstraint.activate([
            detailCollectionView.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor),
            detailCollectionView.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
            ])
    }
    
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(greensArray.count)
        print("passed index: \(passedIndex.row)")
        detailCollectionView.alpha = 0.0
     //   detailCollectionView.reloadData()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.detailCollectionView.selectItem(at: self.passedIndex, animated: false, scrollPosition: UICollectionViewScrollPosition.left)
        UIView.animate(withDuration: 0.3) {
            self.detailCollectionView.alpha = 1.0
        }

    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        detailCollectionView.reloadData()
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // - MARK: Dismiss
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let itemWidth = self.view.bounds.width
        let itemSpacing = CGFloat(0)
        
        let pageWidth = Float(itemWidth + itemSpacing)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(detailCollectionView.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
        
        setupBackground(forColors: greensArray[pageControl.currentPage].gradientColors)

    }
    
}
// - MARK: CollectionView Delegate and DataSource
extension DetailFoodViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailCell", for: indexPath) as! DetailCollectionViewCell
        cell.customView.image = nil
        cell.config(forFruit: greensArray[indexPath.row])
        print("config")
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return greensArray.count
    }
    
}
// - MARK: CollectionView Flow Layout
extension DetailFoodViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.frame.width < collectionView.frame.height {
            return collectionView.bounds.size
        }
        else {
            return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
}


