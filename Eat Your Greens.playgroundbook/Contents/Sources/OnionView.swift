
import UIKit

public class OnionPassthroughView: UIView {
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@objc (OnionView)
public class OnionView : UIView, CAAnimationDelegate {


	var animationCompletions = Dictionary<CAAnimation, (Bool) -> Void>()
	var viewsByName: [String : UIView]!

	// - MARK: Init

	convenience public init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 375, height: 668))
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Creating the OnionView

	override public func layoutSubviews() {
		super.layoutSubviews()

		if let scalingView = self.viewsByName["__scaling__"] {
			var xScale = self.bounds.size.width / scalingView.bounds.size.width
			var yScale = self.bounds.size.height / scalingView.bounds.size.height
			switch contentMode {
			case .scaleToFill:
				break
			case .scaleAspectFill:
				let scale = max(xScale, yScale)
				xScale = scale
				yScale = scale
			default:
				let scale = min(xScale, yScale)
				xScale = scale
				yScale = scale
			}
			scalingView.transform = CGAffineTransform(scaleX: xScale, y: yScale)
			scalingView.center = CGPoint(x:self.bounds.midX, y:self.bounds.midY)
		}
	}

	// - MARK: Setup

	func setupHierarchy() {
		var viewsByName: [String : UIView] = [:]
		let bundle = Bundle(for:type(of: self))
		let __scaling__ = UIView()
		__scaling__.bounds = CGRect(x:0, y:0, width:375, height:668)
		__scaling__.center = CGPoint(x:187.5, y:334.0)
		__scaling__.layer.masksToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let onion__root = OnionPassthroughView()
		let onion__xScale = OnionPassthroughView()
		let onion__yScale = OnionPassthroughView()
		let onion = UIView()
		onion.bounds = CGRect(x:0, y:0, width:326.2, height:325.9)
		onion__root.layer.position = CGPoint(x:177.383, y:340.046)
		onion__xScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		onion__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 1.00)
		onion__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(onion__root)
		onion__root.addSubview(onion__xScale)
		onion__xScale.addSubview(onion__yScale)
		onion__yScale.addSubview(onion)
		__scaling__.addSubview(onion__root)
		viewsByName["Onion__root"] = onion__root
		viewsByName["Onion__xScale"] = onion__xScale
		viewsByName["Onion__yScale"] = onion__yScale
		viewsByName["Onion"] = onion

		let onionFace__root = OnionPassthroughView()
		let onionFace__xScale = OnionPassthroughView()
		let onionFace__yScale = OnionPassthroughView()
		let onionFace = UIImageView()
		let imgOnionFace = UIImage(named:"OnionFace.png", in: bundle, compatibleWith: nil)
		if imgOnionFace == nil {
			print("** Warning: Could not create image from 'OnionFace.png'")
		}
		onionFace.image = imgOnionFace
		onionFace.contentMode = .center
		onionFace.bounds = CGRect(x:0, y:0, width:564.0, height:612.0)
		onionFace__root.layer.position = CGPoint(x:151.859, y:156.908)
		onionFace__xScale.transform = CGAffineTransform(scaleX: 0.40, y: 1.00)
		onionFace__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.40)
		onionFace__root.transform = CGAffineTransform(rotationAngle: 5.879)
		onion.addSubview(onionFace__root)
		onionFace__root.addSubview(onionFace__xScale)
		onionFace__xScale.addSubview(onionFace__yScale)
		onionFace__yScale.addSubview(onionFace)
		onion.addSubview(onionFace__root)
		viewsByName["OnionFace__root"] = onionFace__root
		viewsByName["OnionFace__xScale"] = onionFace__xScale
		viewsByName["OnionFace__yScale"] = onionFace__yScale
		viewsByName["OnionFace"] = onionFace

		let onionBack__root = OnionPassthroughView()
		let onionBack__xScale = OnionPassthroughView()
		let onionBack__yScale = OnionPassthroughView()
		let onionBack = UIImageView()
		let imgOnionBack = UIImage(named:"OnionBack.png", in: bundle, compatibleWith: nil)
		if imgOnionBack == nil {
			print("** Warning: Could not create image from 'OnionBack.png'")
		}
		onionBack.image = imgOnionBack
		onionBack.contentMode = .center
		onionBack.bounds = CGRect(x:0, y:0, width:558.0, height:582.0)
		onionBack__root.layer.position = CGPoint(x:165.676, y:164.908)
		onionBack__xScale.transform = CGAffineTransform(scaleX: 0.40, y: 1.00)
		onionBack__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.40)
		onionBack__root.transform = CGAffineTransform(rotationAngle: 0.708)
		onion.addSubview(onionBack__root)
		onionBack__root.addSubview(onionBack__xScale)
		onionBack__xScale.addSubview(onionBack__yScale)
		onionBack__yScale.addSubview(onionBack)
		onion.addSubview(onionBack__root)
		viewsByName["OnionBack__root"] = onionBack__root
		viewsByName["OnionBack__xScale"] = onionBack__xScale
		viewsByName["OnionBack__yScale"] = onionBack__yScale
		viewsByName["OnionBack"] = onionBack

		let onionShadow__root = OnionPassthroughView()
		let onionShadow__xScale = OnionPassthroughView()
		let onionShadow__yScale = OnionPassthroughView()
		let onionShadow = UIImageView()
		let imgOnionShadow = UIImage(named:"OnionShadow.png", in: bundle, compatibleWith: nil)
		if imgOnionShadow == nil {
			print("** Warning: Could not create image from 'OnionShadow.png'")
		}
		onionShadow.image = imgOnionShadow
		onionShadow.contentMode = .center
		onionShadow.bounds = CGRect(x:0, y:0, width:516.0, height:24.0)
		onionShadow__root.layer.position = CGPoint(x:178.913, y:466.586)
		onionShadow__xScale.transform = CGAffineTransform(scaleX: 0.40, y: 1.00)
		onionShadow__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.40)
		onionShadow__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(onionShadow__root)
		onionShadow__root.addSubview(onionShadow__xScale)
		onionShadow__xScale.addSubview(onionShadow__yScale)
		onionShadow__yScale.addSubview(onionShadow)
		__scaling__.addSubview(onionShadow__root)
		viewsByName["OnionShadow__root"] = onionShadow__root
		viewsByName["OnionShadow__xScale"] = onionShadow__xScale
		viewsByName["OnionShadow__yScale"] = onionShadow__yScale
		viewsByName["OnionShadow"] = onionShadow

		self.viewsByName = viewsByName
	}

	// - MARK: Animations

	public func addOpenAnimation() {
		addOpenAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: nil)
	}

	public func addOpenAnimation(completion: ((Bool) -> Void)?) {
		addOpenAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false, completion: completion)
	}

	public func addOpenAnimation(removedOnCompletion: Bool) {
		addOpenAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: nil)
	}

	public func addOpenAnimation(removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		addOpenAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion, completion: completion)
	}

	public func addOpenAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool, completion: ((Bool) -> Void)?) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)
		let linearTiming = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
		if let complete = completion {
			let representativeAnimation = CABasicAnimation(keyPath: "not.a.real.key")
			representativeAnimation.duration = 1.750
			representativeAnimation.delegate = self
			self.layer.add(representativeAnimation, forKey: "Open")
			self.animationCompletions[layer.animation(forKey: "Open")!] = complete
		}

		let onionShadowTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		onionShadowTranslationYAnimation.duration = 1.750
		onionShadowTranslationYAnimation.values = [0.000, 24.000, 18.000] as [Float]
		onionShadowTranslationYAnimation.keyTimes = [0.000, 0.857, 1.000] as [NSNumber]
		onionShadowTranslationYAnimation.timingFunctions = [anticOverTiming, anticOverTiming]
		onionShadowTranslationYAnimation.beginTime = beginTime
		onionShadowTranslationYAnimation.fillMode = fillMode
		onionShadowTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionShadow__root"]?.layer.add(onionShadowTranslationYAnimation, forKey:"open_TranslationY")

		let onionTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		onionTranslationXAnimation.duration = 1.750
		onionTranslationXAnimation.values = [0.000, 0.988, 0.988] as [Float]
		onionTranslationXAnimation.keyTimes = [0.000, 0.571, 1.000] as [NSNumber]
		onionTranslationXAnimation.timingFunctions = [anticOverTiming, linearTiming]
		onionTranslationXAnimation.beginTime = beginTime
		onionTranslationXAnimation.fillMode = fillMode
		onionTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Onion__root"]?.layer.add(onionTranslationXAnimation, forKey:"open_TranslationX")

		let onionTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		onionTranslationYAnimation.duration = 1.750
		onionTranslationYAnimation.values = [0.000, -8.672, 1.211, -7.535, 4.117, 4.117] as [Float]
		onionTranslationYAnimation.keyTimes = [0.000, 0.143, 0.286, 0.429, 0.571, 1.000] as [NSNumber]
		onionTranslationYAnimation.timingFunctions = [anticOverTiming, anticOverTiming, anticOverTiming, anticOverTiming, linearTiming]
		onionTranslationYAnimation.beginTime = beginTime
		onionTranslationYAnimation.fillMode = fillMode
		onionTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Onion__root"]?.layer.add(onionTranslationYAnimation, forKey:"open_TranslationY")

		let onionFaceRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		onionFaceRotationAnimation.duration = 1.750
		onionFaceRotationAnimation.values = [5.879, 6.380] as [Float]
		onionFaceRotationAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		onionFaceRotationAnimation.timingFunctions = [anticOverTiming]
		onionFaceRotationAnimation.beginTime = beginTime
		onionFaceRotationAnimation.fillMode = fillMode
		onionFaceRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionFace__root"]?.layer.add(onionFaceRotationAnimation, forKey:"open_Rotation")

		let onionFaceTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		onionFaceTranslationXAnimation.duration = 1.750
		onionFaceTranslationXAnimation.values = [0.000, 76.000] as [Float]
		onionFaceTranslationXAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		onionFaceTranslationXAnimation.timingFunctions = [anticOverTiming]
		onionFaceTranslationXAnimation.beginTime = beginTime
		onionFaceTranslationXAnimation.fillMode = fillMode
		onionFaceTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionFace__root"]?.layer.add(onionFaceTranslationXAnimation, forKey:"open_TranslationX")

		let onionFaceTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		onionFaceTranslationYAnimation.duration = 1.750
		onionFaceTranslationYAnimation.values = [0.000, 7.000] as [Float]
		onionFaceTranslationYAnimation.keyTimes = [0.000, 1.000] as [NSNumber]
		onionFaceTranslationYAnimation.timingFunctions = [anticOverTiming]
		onionFaceTranslationYAnimation.beginTime = beginTime
		onionFaceTranslationYAnimation.fillMode = fillMode
		onionFaceTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionFace__root"]?.layer.add(onionFaceTranslationYAnimation, forKey:"open_TranslationY")

		let onionBackRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		onionBackRotationAnimation.duration = 1.750
		onionBackRotationAnimation.values = [0.708, 0.186, 0.186] as [Float]
		onionBackRotationAnimation.keyTimes = [0.000, 0.857, 1.000] as [NSNumber]
		onionBackRotationAnimation.timingFunctions = [anticOverTiming, linearTiming]
		onionBackRotationAnimation.beginTime = beginTime
		onionBackRotationAnimation.fillMode = fillMode
		onionBackRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionBack__root"]?.layer.add(onionBackRotationAnimation, forKey:"open_Rotation")

		let onionBackTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		onionBackTranslationXAnimation.duration = 1.750
		onionBackTranslationXAnimation.values = [0.000, -60.000, -67.000, -67.000] as [Float]
		onionBackTranslationXAnimation.keyTimes = [0.000, 0.857, 0.943, 1.000] as [NSNumber]
		onionBackTranslationXAnimation.timingFunctions = [anticOverTiming, anticOverTiming, linearTiming]
		onionBackTranslationXAnimation.beginTime = beginTime
		onionBackTranslationXAnimation.fillMode = fillMode
		onionBackTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionBack__root"]?.layer.add(onionBackTranslationXAnimation, forKey:"open_TranslationX")

		let onionBackTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		onionBackTranslationYAnimation.duration = 1.750
		onionBackTranslationYAnimation.values = [0.000, 14.000, 14.000] as [Float]
		onionBackTranslationYAnimation.keyTimes = [0.000, 0.857, 1.000] as [NSNumber]
		onionBackTranslationYAnimation.timingFunctions = [anticOverTiming, linearTiming]
		onionBackTranslationYAnimation.beginTime = beginTime
		onionBackTranslationYAnimation.fillMode = fillMode
		onionBackTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["OnionBack__root"]?.layer.add(onionBackTranslationYAnimation, forKey:"open_TranslationY")
	}

	public func removeOpenAnimation() {
		self.layer.removeAnimation(forKey: "Open")
		self.viewsByName["OnionShadow__root"]?.layer.removeAnimation(forKey: "open_TranslationY")
		self.viewsByName["Onion__root"]?.layer.removeAnimation(forKey: "open_TranslationX")
		self.viewsByName["Onion__root"]?.layer.removeAnimation(forKey: "open_TranslationY")
		self.viewsByName["OnionFace__root"]?.layer.removeAnimation(forKey: "open_Rotation")
		self.viewsByName["OnionFace__root"]?.layer.removeAnimation(forKey: "open_TranslationX")
		self.viewsByName["OnionFace__root"]?.layer.removeAnimation(forKey: "open_TranslationY")
		self.viewsByName["OnionBack__root"]?.layer.removeAnimation(forKey: "open_Rotation")
		self.viewsByName["OnionBack__root"]?.layer.removeAnimation(forKey: "open_TranslationX")
		self.viewsByName["OnionBack__root"]?.layer.removeAnimation(forKey: "open_TranslationY")
	}

	// MARK: Delegate
	public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if let completion = self.animationCompletions[anim] {
			self.animationCompletions.removeValue(forKey: anim)
			completion(flag)
		}
	}

	public func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
		self.layer.removeAnimation(forKey: "Open")
	}
}
