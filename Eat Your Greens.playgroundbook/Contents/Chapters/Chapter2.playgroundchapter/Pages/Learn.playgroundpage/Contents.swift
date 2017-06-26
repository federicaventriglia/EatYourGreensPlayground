//#-hidden-code
//
//
//  Copyright (c) 2017 Federica Ventriglia. All Rights Reserved.
//
//#-end-hidden-code
/*:
## **Green Yo-Self**
 
Well here we are again, entering probably the section you fear most! **Vegetables** ! If you're thinking _"okay but my pizza had also tomatoe on it last night other than pineapple"_ , let's not get into that again...
 
Like in the first chapter, interact with the characters on the screen and have fun with them, tap on a vegetable to learn more about it and scroll away!

Tap `Run My Code` to start.
 
 Go to the next page to enjoy the last mini-challenge.

 [**Next Page**](@next)

 */
//#-hidden-code
//#-code-completion(everything, hide)

import PlaygroundSupport
import UIKit

/// Create Storyboard.
let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
PlaygroundPage.current.liveView = sb.instantiateViewController(withIdentifier: "VegetablesVC")

//#-end-hidden-code

