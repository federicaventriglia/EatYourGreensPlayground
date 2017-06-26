import UIKit
import PlaygroundSupport

@objc(FruitViewController)
public class FruitViewController: BaseViewController, PlaygroundLiveViewSafeAreaContainer {
    
    // - MARK: Outlets and Variables
    let fruitArray = DataModel.shared.fruitArray
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var fruitCollectionView: UICollectionView!
    @IBOutlet weak var bgWave: WaveFormView!
    var selectedFruit: Fruit?
    
    // - MARK: Overrides
    public override func viewDidLoad() {
        super.viewDidLoad()
        fruitCollectionView.reloadData()
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor),
            fruitCollectionView.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
            ])
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.layoutIfNeeded()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        UIView.animate(withDuration: 0.2) {
            self.fruitCollectionView.reloadData()
        }
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
// - MARK: Collection View Delegate and DataSource
extension FruitViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.height / 3 )
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

// - MARK: Collection View Flow Layout 
extension FruitViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fruitCell", for: indexPath) as! FruitCollectionViewCell
        cell.config(forFruit: fruitArray[indexPath.row])
 
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FruitCollectionViewCell
        selectedFruit = cell.currentFruit
        
        let fruitDetail = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailFoodViewController
        fruitDetail.passedItem = selectedFruit
        fruitDetail.passedIndex = indexPath
        present(fruitDetail, animated: true, completion: nil)
        
        
    }
}
