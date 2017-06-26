import PlaygroundSupport
import UIKit

// storyboard reference with viewcontroller that will appear
let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
public var vc = sb.instantiateViewController(withIdentifier: "AnimateVC") as! AnimationViewController

// animation view, will contain our character to animate
public var animation = AnimationView()

// - MARK: Setup the playground
public func setup(){
    PlaygroundPage.current.liveView = vc
    
    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["After you've created and animated the character for the first time, why not try to make it happen more than once?","Explore the `for` loop with the `move()` function and see what happens "], solution: "Example Code:  `create() for i in 0...3 {\n move() } `")
}

