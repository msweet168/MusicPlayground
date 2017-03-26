import Foundation
import UIKit

public class ControlBar:UIView {
    
    var mainScene = Interface()
    
    public init(scene: Interface) {
        super.init(frame:CGRect(x:0, y:390, width:640, height:90))
        backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 0.68)
        
        mainScene = scene
        
        viewSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var hideButton = UIButton()
    
    var bassButton = UIButton()
    var leadButton = UIButton()
    var drumButton = UIButton()
    var barrierButton = UIButton()
    var playPause = UIButton()
    var clearButton = UIButton()
    
    var speedSlider = UISlider()
    
    var bassLabel = UILabel()
    var leadLabel = UILabel()
    var drumLabel = UILabel()
    var barrierLabel = UILabel()
    var speedLabel = UILabel()
    
    
    
    func viewSetup() {
        
        hideButton = createButton(title: "Hide", backColor: UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1), radius: 7, titleColor: .black, highlighted: .gray, x: 7, y: 12, width: 42, height: 66)
        bassButton = createButton(title: "", backColor: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), radius: 10, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 60, y: 28, width: 45, height: 45)
        leadButton = createButton(title: "", backColor: UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1), radius: 22, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 118, y: 28, width: 45, height: 45)
        drumButton = createButton(title: "", backColor: UIColor(red: 138/255, green: 6/255, blue: 165/255, alpha: 1), radius: 10, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 178, y: 32, width: 71, height: 36)
        barrierButton = createButton(title: "", backColor: UIColor.black, radius: 10, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 266, y: 44, width: 108, height: 10)
        
        hideButton.addTarget(self, action: #selector(hideControls), for: .touchUpInside)
        bassButton.addTarget(self, action: #selector(setBass), for: .touchUpInside)
        leadButton.addTarget(self, action: #selector(setLead), for: .touchUpInside)
        drumButton.addTarget(self, action: #selector(setDrum), for: .touchUpInside)
        barrierButton.addTarget(self, action: #selector(setBarrier), for: .touchUpInside)
        
        hideButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        
        bassButton.layer.borderColor = UIColor.black.cgColor
        bassButton.layer.borderWidth = 2
        
        self.addSubview(hideButton)
        self.addSubview(bassButton)
        self.addSubview(leadButton)
        self.addSubview(drumButton)
        self.addSubview(barrierLabel)
        
        bassLabel = createLabel(title: "Bass", fontSize: 13, textColor: .white, x: 68, y: 5, width: 30, height: 18)
        leadLabel = createLabel(title: "Lead", fontSize: 13, textColor: .white, x: 126, y: 5, width: 30, height: 18)
        drumLabel = createLabel(title: "Drums", fontSize: 13, textColor: .white, x: 192, y: 5, width: 41, height: 18)
        barrierLabel = createLabel(title: "Barrier", fontSize: 13, textColor: .white, x: 299, y: 5, width: 43, height: 18)
        
        bassLabel.textAlignment = .center
        leadLabel.textAlignment = .center
        drumLabel.textAlignment = .center
        barrierLabel.textAlignment = .center
        
        self.addSubview(bassLabel)
        self.addSubview(leadLabel)
        self.addSubview(drumLabel)
        //Add Barrier Label
        
        
        //Create slider
        //Create pause/play button
        //Create clear button
        
        
    
    }
    
    
    func createButton(title: String, backColor: UIColor, radius: CGFloat, titleColor: UIColor, highlighted: UIColor, x: Double, y: Double, width: Double, height: Double) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backColor
        button.layer.cornerRadius = radius
        button.setTitleColor(titleColor, for: .normal)
        button.setTitleColor(highlighted, for: .highlighted)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return button
        
    }
    
    
    func createLabel(title: String, fontSize: CGFloat, textColor: UIColor, x: Double, y: Double, width: Double, height: Double) -> UILabel {
        
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: label.font.fontName, size: fontSize)
        label.textColor = textColor
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return label
        
    }
    
    func hideControls() {
        
    }
    
    func setBass() {
        mainScene.shapeType = ObjectType.bass
        setBorder(button: bassButton)
    }
    
    func setLead() {
        mainScene.shapeType = ObjectType.lead
        setBorder(button: leadButton)
    }
    
    func setDrum() {
        mainScene.shapeType = ObjectType.drums
        setBorder(button: drumButton)
    }
    
    func setBarrier() {
        mainScene.shapeType = ObjectType.barrier
        setBorder(button: barrierButton)
    }
    
    func setBorder(button: UIButton) {
        
        bassButton.layer.borderWidth = 0
        leadButton.layer.borderWidth = 0
        drumButton.layer.borderWidth = 0
        barrierButton.layer.borderWidth = 0
        
        if button == barrierButton {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
        }
        else
        {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
        }
        
        
        
    }

    
}

