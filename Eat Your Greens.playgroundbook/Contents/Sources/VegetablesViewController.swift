import UIKit
import PlaygroundSupport

@objc(VegetablesViewController)
public class VegetablesViewController: BaseViewController, PlaygroundLiveViewSafeAreaContainer {
    
    // - MARK: Outlets and Variables 
    
    let greensArray = DataModel.shared.vegetablesArray
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var vegCollectionView: UICollectionView!
    @IBOutlet weak var bgWave: WaveFormView!
    var selectedItem: Fruit?
    
    
    // - MARK: Overrides 
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        vegCollectionView.reloadData()
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: liveViewSafeAreaGuide.topAnchor),
            vegCollectionView.bottomAnchor.constraint(equalTo: liveViewSafeAreaGuide.bottomAnchor)
            ])
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.view.layoutIfNeeded()
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        UIView.animate(withDuration: 0.2) {
            self.vegCollectionView.reloadData()
        }
    }
    
    public override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
// - MARK: CollectionView Flow Layout Delegate
extension VegetablesViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 3 , height: collectionView.frame.height / 3 )
        
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
// - MARK: CollectionView Delegate and DataSource 
extension VegetablesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fruitCell", for: indexPath) as! FruitCollectionViewCell
        cell.config(forFruit: greensArray[indexPath.row])
        
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return greensArray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FruitCollectionViewCell
        selectedItem = cell.currentFruit
        
        let fruitDetail = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailFoodViewController
        fruitDetail.passedItem = selectedItem
        fruitDetail.passedIndex = indexPath
        fruitDetail.greensArray = greensArray
        present(fruitDetail, animated: true, completion: nil)
        
        
    }
}
