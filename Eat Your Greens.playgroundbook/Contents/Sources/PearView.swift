
import UIKit


public class PearPassthroughView: UIView {
    override public func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if subview.point(inside: convert(point, to: subview), with: event) { return true }
        }
        return false
    }
}

@IBDesignable
@objc (PearView)
public class PearView : UIView, CAAnimationDelegate {

	var viewsByName: [String : UIView]!

	// - MARK: Init

	convenience public init() {
		self.init(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
	}

	override public init(frame: CGRect) {
		super.init(frame: frame)
		self.setupHierarchy()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.setupHierarchy()
	}

	// - MARK: Creating PearView

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
		__scaling__.bounds = CGRect(x:0, y:0, width:375, height:667)
		__scaling__.center = CGPoint(x:187.5, y:333.5)
		__scaling__.layer.masksToBounds = true
		self.addSubview(__scaling__)
		viewsByName["__scaling__"] = __scaling__

		let pearBody__root = PearPassthroughView()
		let pearBody__xScale = PearPassthroughView()
		let pearBody__yScale = PearPassthroughView()
		let pearBody = UIImageView()
		let imgPearBody = UIImage(named:"PearBody.png", in: bundle, compatibleWith: nil)
		if imgPearBody == nil {
			print("** Warning: Could not create image from 'PearBody.png'")
		}
		pearBody.image = imgPearBody
		pearBody.contentMode = .center
		pearBody.bounds = CGRect(x:0, y:0, width:468.0, height:738.0)
		pearBody__root.layer.position = CGPoint(x:187.500, y:333.500)
		pearBody__xScale.transform = CGAffineTransform(scaleX: 0.35, y: 1.00)
		pearBody__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.35)
		pearBody__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(pearBody__root)
		pearBody__root.addSubview(pearBody__xScale)
		pearBody__xScale.addSubview(pearBody__yScale)
		pearBody__yScale.addSubview(pearBody)
		__scaling__.addSubview(pearBody__root)
		viewsByName["PearBody__root"] = pearBody__root
		viewsByName["PearBody__xScale"] = pearBody__xScale
		viewsByName["PearBody__yScale"] = pearBody__yScale
		viewsByName["PearBody"] = pearBody

		let arm__root = PearPassthroughView()
		let arm__xScale = PearPassthroughView()
		let arm__yScale = PearPassthroughView()
		let arm = UIImageView()
		let imgArm = UIImage(named:"Arm.png", in: bundle, compatibleWith: nil)
		if imgArm == nil {
			print("** Warning: Could not create image from 'Arm.png'")
		}
		arm.image = imgArm
		arm.contentMode = .center
		arm.layer.anchorPoint = CGPoint(x:0.046, y:1.034)
		arm.bounds = CGRect(x:0, y:0, width:114.0, height:264.0)
		arm__root.layer.position = CGPoint(x:239.172, y:329.220)
		arm__xScale.transform = CGAffineTransform(scaleX: 0.40, y: 1.00)
		arm__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.40)
		arm__root.transform = CGAffineTransform(rotationAngle: 0.271)
		__scaling__.addSubview(arm__root)
		arm__root.addSubview(arm__xScale)
		arm__xScale.addSubview(arm__yScale)
		arm__yScale.addSubview(arm)
		__scaling__.addSubview(arm__root)
		viewsByName["Arm__root"] = arm__root
		viewsByName["Arm__xScale"] = arm__xScale
		viewsByName["Arm__yScale"] = arm__yScale
		viewsByName["Arm"] = arm

		let leaf__root = PearPassthroughView()
		let leaf__xScale = PearPassthroughView()
		let leaf__yScale = PearPassthroughView()
		let leaf = UIImageView()
		let imgLeaf = UIImage(named:"leaf.png", in: bundle, compatibleWith: nil)
		if imgLeaf == nil {
			print("** Warning: Could not create image from 'leaf.png'")
		}
		leaf.image = imgLeaf
		leaf.contentMode = .center
		leaf.bounds = CGRect(x:0, y:0, width:150.0, height:222.0)
		leaf__root.layer.position = CGPoint(x:268.525, y:202.323)
		leaf__xScale.transform = CGAffineTransform(scaleX: 0.40, y: 1.00)
		leaf__yScale.transform = CGAffineTransform(scaleX: 1.00, y: 0.40)
		leaf__root.transform = CGAffineTransform(rotationAngle: 0.000)
		__scaling__.addSubview(leaf__root)
		leaf__root.addSubview(leaf__xScale)
		leaf__xScale.addSubview(leaf__yScale)
		leaf__yScale.addSubview(leaf)
		__scaling__.addSubview(leaf__root)
		viewsByName["leaf__root"] = leaf__root
		viewsByName["leaf__xScale"] = leaf__xScale
		viewsByName["leaf__yScale"] = leaf__yScale
		viewsByName["leaf"] = leaf

		self.viewsByName = viewsByName
	}

	// - MARK: Animations

	public func addMoveAnimation() {
		addMoveAnimation(beginTime: 0, fillMode: kCAFillModeBoth, removedOnCompletion: false)
	}

	public func addMoveAnimation(removedOnCompletion: Bool) {
		addMoveAnimation(beginTime: 0, fillMode: removedOnCompletion ? kCAFillModeRemoved : kCAFillModeBoth, removedOnCompletion: removedOnCompletion)
	}

	public func addMoveAnimation(beginTime: CFTimeInterval, fillMode: String, removedOnCompletion: Bool) {
		let anticOverTiming = CAMediaTimingFunction(controlPoints: 0.42, -0.30, 0.58, 1.30)

		let leafRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		leafRotationAnimation.duration = 3.000
		leafRotationAnimation.values = [0.000, -0.679, 0.000] as [Float]
		leafRotationAnimation.keyTimes = [0.000, 0.500, 1.000] as [NSNumber]
		leafRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming]
		leafRotationAnimation.repeatCount = HUGE
		leafRotationAnimation.beginTime = beginTime
		leafRotationAnimation.fillMode = fillMode
		leafRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["leaf__root"]?.layer.add(leafRotationAnimation, forKey:"Move_Rotation")

		let leafTranslationXAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
		leafTranslationXAnimation.duration = 3.000
		leafTranslationXAnimation.values = [0.000, -72.321, 0.000] as [Float]
		leafTranslationXAnimation.keyTimes = [0.000, 0.500, 1.000] as [NSNumber]
		leafTranslationXAnimation.timingFunctions = [anticOverTiming, anticOverTiming]
		leafTranslationXAnimation.repeatCount = HUGE
		leafTranslationXAnimation.beginTime = beginTime
		leafTranslationXAnimation.fillMode = fillMode
		leafTranslationXAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["leaf__root"]?.layer.add(leafTranslationXAnimation, forKey:"Move_TranslationX")

		let leafTranslationYAnimation = CAKeyframeAnimation(keyPath: "transform.translation.y")
		leafTranslationYAnimation.duration = 3.000
		leafTranslationYAnimation.values = [0.000, -4.637, 0.000] as [Float]
		leafTranslationYAnimation.keyTimes = [0.000, 0.500, 1.000] as [NSNumber]
		leafTranslationYAnimation.timingFunctions = [anticOverTiming, anticOverTiming]
		leafTranslationYAnimation.repeatCount = HUGE
		leafTranslationYAnimation.beginTime = beginTime
		leafTranslationYAnimation.fillMode = fillMode
		leafTranslationYAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["leaf__root"]?.layer.add(leafTranslationYAnimation, forKey:"Move_TranslationY")

		let armRotationAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
		armRotationAnimation.duration = 3.000
		armRotationAnimation.values = [0.271, -0.281, 0.279] as [Float]
		armRotationAnimation.keyTimes = [0.000, 0.500, 1.000] as [NSNumber]
		armRotationAnimation.timingFunctions = [anticOverTiming, anticOverTiming]
		armRotationAnimation.repeatCount = HUGE
		armRotationAnimation.beginTime = beginTime
		armRotationAnimation.fillMode = fillMode
		armRotationAnimation.isRemovedOnCompletion = removedOnCompletion
		self.viewsByName["Arm__root"]?.layer.add(armRotationAnimation, forKey:"Move_Rotation")
	}

	public func removeMoveAnimation() {
		self.viewsByName["leaf__root"]?.layer.removeAnimation(forKey: "Move_Rotation")
		self.viewsByName["leaf__root"]?.layer.removeAnimation(forKey: "Move_TranslationX")
		self.viewsByName["leaf__root"]?.layer.removeAnimation(forKey: "Move_TranslationY")
		self.viewsByName["Arm__root"]?.layer.removeAnimation(forKey: "Move_Rotation")
	}

	public func removeAllAnimations() {
		for subview in viewsByName.values {
			subview.layer.removeAllAnimations()
		}
	}
}
