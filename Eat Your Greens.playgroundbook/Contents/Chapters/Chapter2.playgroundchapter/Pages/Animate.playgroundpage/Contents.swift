/*:
## **Animate Yo-Greens**
**Challenge**: Find the right place where to use the `move()` function in the code written below, in order to repeat the animation 4 times.
 
 You're being introduced to **loop cycles**. Know what that is? A `for` loop allows you to repeat an action for a specific number of times. Well now that looks familiar doesn't it? If you want to know how it works look at the following example.
 
 ` for i 0...3 { `
 
 `myFunction()`
 
 `}`
 
 Tap `Run My Code` to see your code in action.
 
 */
//#-hidden-code

import PlaygroundSupport
import UIKit

/// Create Storyboard and instantiate view controller for the animation
let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
public var vc = sb.instantiateViewController(withIdentifier: "AnimateVC")
clear()
setup() // setting up the playground live view

//#-end-hidden-code
//#-code-completion(everything, hide)
//#-code-completion(identifier, show, create(), move(), stop(), clear(), for)
//#-hidden-code
DispatchQueue.global(qos: .userInteractive).async {
//#-end-hidden-code
//#-editable-code
    // ENTER CODE 
    create()
    
    // LOOP 
    for i in 0...3 {
        
    }
//#-end-editable-code
//#-hidden-code
}
//#-end-hidden-code
