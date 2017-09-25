import Foundation
import UIKit

/// UIView which appears at the top of the playground and holds the name and info button.
public class TitleBar: UIView {
    
    // Initalizes view with size and background color.
    public init() {
        super.init(frame:CGRect(x:0, y:0, width:640, height:36))
        backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 0.68)
        
        viewSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Creates a property for IntroView.
    public var intro = IntroView()
    
    /// Function called by initalizer which sets up subviews in TitleBar.
    func viewSetup() {
        
        // Create title label.
        let titleLabel = UILabel()
        titleLabel.text = "Music Playground"
        titleLabel.font = UIFont(name: "Chalkboard SE", size: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 235, y: 0, width: 170, height: 29)
        self.addSubview(titleLabel)
        
        // Create info button.
        let infoImage = UIImage(named: "info")
        let infoHighlight = UIImage(named: "infoHighlight")
        let infoButton = UIButton()
        infoButton.setImage(infoImage, for: .normal)
        infoButton.setImage(infoHighlight, for: .highlighted)
        infoButton.frame = CGRect(x: 18, y: 8, width: 20, height: 20)
        infoButton.addTarget(self, action: #selector(infoScreen), for: .touchUpInside)
        self.addSubview(infoButton)
        
        
    }
    
    /// Function which sets IntroView's alpha to 1 so it is visable.
    @objc func infoScreen() {
        UIView.animate(withDuration: 0.5, animations: {
            self.intro.alpha = 1
        })
    }
    
    
}
