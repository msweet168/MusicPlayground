import Foundation
import UIKit


public class TitleBar:UIView {
    
    public init() {
        super.init(frame:CGRect(x:0, y:0, width:640, height:36))
        backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 0.68)
        
        viewSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func viewSetup() {
        
        let titleLabel = UILabel()
        titleLabel.text = "Music Playground"
        titleLabel.font = UIFont(name: "Chalkboard SE", size: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 235, y: 0, width: 170, height: 29)
        self.addSubview(titleLabel)
        
        let infoImage = UIImage(named: "info")
        let infoHighlight = UIImage(named: "infoHighlight")
        let infoButton = UIButton()
        infoButton.setImage(infoImage, for: .normal)
        infoButton.setImage(infoHighlight, for: .highlighted)
        infoButton.frame = CGRect(x: 18, y: 8, width: 20, height: 20)
        infoButton.addTarget(self, action: #selector(infoScreen), for: .touchUpInside)
        self.addSubview(infoButton)
        
        
    }
    
    func infoScreen() {
        let info = IntroView()
        self.frame = CGRect(x: 0, y: 0, width: 640, height: 480)
        self.addSubview(info)
    }
    
    public override func willRemoveSubview(_ subview: UIView) {
        self.frame = CGRect(x: 0, y: 0, width: 640, height: 36)
    }
    
}
