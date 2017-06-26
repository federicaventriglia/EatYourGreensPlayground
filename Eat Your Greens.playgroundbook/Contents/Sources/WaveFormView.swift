import UIKit

@objc (WaveFormView)
@IBDesignable
public class WaveFormView : UIView {
    
    // - MARK: Variables
    
    public var numberOfWaves : UInt = 1
    @IBInspectable public var waveColor : UIColor = UIColor.white
    @IBInspectable public var primaryWaveLineWidth : CGFloat = 3
    @IBInspectable public var secondaryWaveLineWidth : CGFloat = 1
    @IBInspectable public var idleAmplitude : CGFloat = 0.01
    @IBInspectable public var frequency : CGFloat = 1.5
    @IBInspectable public var amplitude : CGFloat = 1
    @IBInspectable public var density : CGFloat = 5
    @IBInspectable public var phaseShift : CGFloat = -0.15
    @IBInspectable public var drawJustStroke : Bool = false
    
    public var phase : CGFloat = 0 //TODO
    
    public func update(withLevel level: CGFloat) {
        self.phase += self.phaseShift
        self.amplitude = fmax(level, self.idleAmplitude)
        
        self.setNeedsDisplay()
    }
    
    // - MARK: Draw Override
    
    public override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.clear(self.bounds)
        
        self.backgroundColor?.set()
        
        context.fill(rect)
        
        for index in 0..<self.numberOfWaves {
            guard let context = UIGraphicsGetCurrentContext() else {
                return
            }
            context.setLineWidth(index == 0 ? self.primaryWaveLineWidth : self.secondaryWaveLineWidth)
            
            let halfHeight : CGFloat = self.bounds.height / 4
            let width : CGFloat = self.bounds.width
            let halfWidth : CGFloat = width / 2
            
            let maxAmplitude : CGFloat = halfHeight - 4
            
            let progress : CGFloat = 1 - CGFloat(index) / CGFloat(self.numberOfWaves)
            let normedAmplitude : CGFloat = (1.5 * progress - 0.5) * self.amplitude
            
            let multiplier = min(1, (progress / 6) + (1/3))
            
            self.waveColor.withAlphaComponent(multiplier * self.waveColor.cgColor.alpha).set()
            
            var index2 : CGFloat = 0
            
            while index2 < (width + self.density)  {
                let scaling : CGFloat = -pow(1/halfWidth * (index2 - halfWidth), 2) + 1
                let y = scaling * maxAmplitude * normedAmplitude * sin(2 * CGFloat.pi * (index2 / width) * self.frequency + self.phase) + halfHeight
                
        
                if index2 == 0 {
                    context.move(to: CGPoint(x: 0, y: y))
                } else {
                    context.addLine(to: CGPoint(x: index2, y: y) )
                }
                
                index2 += self.density
            }
            
            
            context.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height))
            context.addLine(to: CGPoint(x: 0, y: self.bounds.height))
            context.addLine(to: CGPoint(x: 0, y: halfHeight))
      
                        let colorComponents = self.waveColor.components
            context.setFillColor(red: colorComponents.red, green: colorComponents.green, blue: colorComponents.blue, alpha: colorComponents.alpha)
            
            self.drawJustStroke ? context.strokePath() : context.fillPath()
            
            context.saveGState()
            context.setBlendMode(.overlay)
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            
            context.endTransparencyLayer()
            context.restoreGState()
            

    
        }
    }
    
}

extension UIColor {
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let color = CIColor(color: self)
        return (red: color.red,green: color.green,blue: color.blue,alpha: color.alpha)
    }
}
