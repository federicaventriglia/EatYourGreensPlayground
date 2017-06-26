import UIKit

public final class DataModel {
    
    public static let shared = DataModel()
    
    
    /**
     Array of fruits
     */
    public let fruitArray: [Fruit] = [Fruit(name: "Mr. Orange", description: "About 20 % of the total crop of oranges is sold as whole fruit; the remainder is used in preparing orange juice, extracts, and preserves.", image: UIImage(named: "Orange")!, gradientColors: orangeGradientColors) , Fruit(name: "Old Pear", description: "The first pear tree was planted in the North America in 1620 in the Massachusetts Bay colony.", image: UIImage(named:"Pear")!, gradientColors: pearGradientColors) , Fruit(name: "Happy Strawberry", description: "They are the only fruit that wear their seeds on the outside. The average berry is adorned with some 200 of them. No wonder it only takes one bite to get seeds stuck in your teeth.", image: UIImage(named: "Strawberry")!, gradientColors: strawberryGradientColors), Fruit(name: "Cool Pineapple", description: "American colonists regarded pineapples as a luxurious treat because of their rarity and cost.", image: UIImage(named: "Pineapple")!, gradientColors: pineappleGradientColors), Fruit(name: "Sporty Banana", description: "Yellow fruits help keep you from getting sick. Also bananas are probably the first fruit on earth, which means they’ve been working for ages!", image: UIImage(named:"Banana")!, gradientColors: bananaGradientColors), Fruit(name: "Fancy Watermelon", description: "Many years ago explorers used empty watermelons to carry water on long expeditions, which is funny considering a watermelon is 92% water.", image: UIImage(named:"Watermelon")!, gradientColors: watermelonGradientColors)]

    
    /**
     Array of Vegetables
     */
    public let vegetablesArray: [Fruit] = [Fruit(name: "Fierce Lemon", description: "You bet this Lemon is a fierce as Queen Bey is, as a matter of fact lemons are often used in schools to show experiments about electricity!", image: UIImage(named: "Lemon")!, gradientColors: bananaGradientColors) , Fruit(name: "Disco Broccoli", description: "Broccoli are just like me, italian! The most common type of broccoli is the Calabrese broccoli, which is named after its place of origin: Calabria, Italy.", image: UIImage(named:"Broccoli")!, gradientColors: pearGradientColors) , Fruit(name: "Shy Onion", description: "We all know onions are pretty shy, that's why we always end up tearing up when they open up and they don't wanna hurt us! Try to hold a piece of bread in your mouth to stop the tears from falling while opening one.", image: UIImage(named: "Onion")!, gradientColors: strawberryGradientColors), Fruit(name: "Italian Tomatoe", description: "The French used to refer to the tomatoe as the 'apple of love'. because guess what? A tomato isn't a vegetable but a fruit!", image: UIImage(named: "Tomatoe")!, gradientColors: pineappleGradientColors), Fruit(name: "Tall Cucumber", description: "If you made a mistake while writing down something, you can use the outside of the cucumber as a biologic eraser, how cool is that!?", image: UIImage(named:"Cucumber")!, gradientColors: orangeGradientColors), Fruit(name: "Surprise Carrot", description: "If you eat as many carrots as bugs bunny does your skin is more likely to turn orange-y", image: UIImage(named:"Carrot")!, gradientColors: watermelonGradientColors)]

}
