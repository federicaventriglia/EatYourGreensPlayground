import UIKit

@objc(FruitCollectionViewCell)
public class FruitCollectionViewCell: UICollectionViewCell {
    
    // - MARK: Outlets and Variables
    
    @IBOutlet weak var fruitImage: UIImageView!
    var currentFruit: Fruit?
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    // - MARK: Config for Fruit Object
    public func config(forFruit fruit: Fruit){
        fruitImage.image = fruit.fruitImage
        currentFruit = fruit
    }
    
    // backup config
    public func config(forName name: String){
        fruitImage.image = UIImage(named: name)
        if fruitImage.image != nil {
            print(" image added ")
        }
        fruitImage.contentMode = .scaleAspectFit
        print("added \(name)")
    }
}

