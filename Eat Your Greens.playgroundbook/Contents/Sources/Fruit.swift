import UIKit

public class Fruit {
    
    /**
     Name
     */
    public var name: String?
    
    /**
     Description
     */
    public var description: String?
    
    /**
     Image
     */
    public var fruitImage: UIImage?
    
    /* Background Gradient Colors */
    
    public var gradientColors: [CGColor]
    
    /**
     Required init
     */
    public required init(name: String, description: String, image: UIImage, gradientColors: [CGColor]) {
        self.name = name
        self.description = description
        self.fruitImage = image
        self.gradientColors = gradientColors
    }
    
}

