import PlaygroundSupport
import UIKit

// storyboard reference
let sb = UIStoryboard(name: "Main", bundle: Bundle.main)
public var vc = sb.instantiateViewController(withIdentifier: "AnimateVC") as! AnimationViewController

/**
 View that will contain the character
 */
public var animation = AnimationView()

/**
 Setup Function to call in the Content.swift
 */
public func setup(){
    // Setup the Live View
    PlaygroundPage.current.liveView = vc
    // Define hints and solution
    PlaygroundPage.current.assessmentStatus = PlaygroundPage.AssessmentStatus.fail(hints: ["First you need to create your character otherwise how will you be able to give life to it?!","Once the character has been created and you've checked that you can move on to animate it!"], solution: "First use `createStrawberry()`to create the character , With `moveStrawberry()` you can see your character more or with `danceStrawberry()` you can see your friend jamming to 'Single Ladies' ")
}
