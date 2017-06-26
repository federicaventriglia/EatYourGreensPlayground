import UIKit

/**
 Creates the 'Onion' character.
 */
public func createOnion(forVC vc : UIViewController) {
    animation.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
    animation.center = CGPoint(x: 300, y: 400)
    animation.createOnion()
    vc.view.addSubview(animation)
}

// - MARK: Functions that will be used by the user

/** Create function
 */

public func create(){
    createOnion(forVC: vc)
}

/**
 Moves the character.
 */
public func move() {
    vc.setupBackground(forColors: pearGradientColors)
    animation.openOnion()
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
    vc.setupBackground(forColors: backgroundGradientColors)
    vc.view.willRemoveSubview(animation)
    animation.removeFromSuperview()
}
