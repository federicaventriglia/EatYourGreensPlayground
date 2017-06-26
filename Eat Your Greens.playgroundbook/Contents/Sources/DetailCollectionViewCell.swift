import UIKit

@objc (DetailCollectionViewCell)
public class DetailCollectionViewCell: UICollectionViewCell {
    
    // - MARK: Outlets and Variables 
    
    @IBOutlet weak var customView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var selectedFruit: Fruit?
    var gradientLayer = CAGradientLayer()
    var gradientBackgroundView = UIView()

    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // - MARK: Cell Config
    public func config(forFruit fruit: Fruit) {
        customView.backgroundColor = .clear
        self.nameLabel.text = fruit.name
        self.descriptionLabel.text = fruit.description
        self.customView.image = fruit.fruitImage
        self.selectedFruit = fruit
    }

    
}

