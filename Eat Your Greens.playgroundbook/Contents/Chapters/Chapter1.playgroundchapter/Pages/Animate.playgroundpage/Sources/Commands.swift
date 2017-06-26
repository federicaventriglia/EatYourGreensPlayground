import UIKit

/**
 Creates the 'pear' character.
 */
public func createPear(forVC vc : UIViewController) {
    animation.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
    animation.center = CGPoint(x: 300, y: 400)
    animation.createPear()
    vc.view.addSubview(animation)
}

public func createStrawberry(forVC vc: UIViewController) {
    animation.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
    animation.center = CGPoint(x: 300, y: 400)
    animation.createStrawberry()
    vc.view.addSubview(animation)
}

/**
 Create Pear Or Strawberry
 */

public func createPear(){
    clear()
    createPear(forVC: vc)
}

public func createStrawberry(){
    clear()
    createStrawberry(forVC: vc)
}

/**
 Moves the character.
 */
public func movePear() {
    animation.movePear()
}

public func moveStrawberry(){
    animation.walkStrawberry()
}

public func danceStrawberry(){
    UIView.animate(withDuration: 2.0) {
        vc.setupBackground(forColors: strawberryGradientColors)
    }
    animation.danceStrawberry()
}

/**
 Stops all the animations added to the character.
 */
public func stop() {
    animation.stop()
}

/**
 Clear all
 */

public func clear() {
    vc.view.willRemoveSubview(animation)
    vc.setupBackground(forColors: backgroundGradientColors)
    animation.removeFromSuperview()
}
