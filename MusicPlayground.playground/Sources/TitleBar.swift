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
        titleLabel.font = UIFont(name: titleLabel.font.fontName, size: 20)
        titleLabel.textColor = UIColor.white
        titleLabel.frame = CGRect(x: 237, y: 6, width: 200, height: 27)
        self.addSubview(titleLabel)
        
    }
    
    
}
