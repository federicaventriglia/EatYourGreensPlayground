import UIKit

public class AnimationView: UIView {
    
    // - MARK: Outlets
    var max = 5
    var count = 0
    var pear = PearView()
    var strawberry = StrawberryView()
    var onion = OnionView()
    
    // - MARK: Creating Pear Animation
    public func createPear(){
        pear.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
        self.addSubview(pear)
    }
    
    public func movePear(){
        pear.removeAllAnimations()
        pear.addMoveAnimation()
        
    }
    
    public func stop(){
        pear.removeAllAnimations()
        strawberry.removeAllAnimations()
        onion.removeAllAnimations()
    }
    
    // - MARK: Creating Strawberry Animation - Chapter 1 Page 2
    
    public func createStrawberry(){
        strawberry.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
        self.addSubview(strawberry)
    }
    
    public func walkStrawberry(){
        strawberry.removeAllAnimations()
        strawberry.addWalkAnimation()
    }
    
    
    public func danceStrawberry(){
        strawberry.removeAllAnimations()
        strawberry.addDanceAnimation()
    }
    
    // - MARK: Creating Onion Animation - Chapter 2 Page 2
    
    public func createOnion() {
        onion.frame = CGRect(origin: .zero, size: CGSize(width: 375, height: 667))
        self.addSubview(onion)
    }
    
    public func openOnion(){
        // In the background thread
        // semaphore identifier 0
        let semaphore = DispatchSemaphore(value: 0)
        
        // 1) Main thread
        DispatchQueue.main.async {
            // Start animation on main thread
            self.onion.addOpenAnimation(completion: { _ in
                // Future: finished execution, sends a message to the wait
                semaphore.signal()
            })
        }
        
        // 2) puts the main thread to sleep
        semaphore.wait()
    }
    
}
