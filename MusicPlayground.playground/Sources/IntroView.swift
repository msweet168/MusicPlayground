import Foundation
import UIKit

public class IntroView:UIView {
    
    public init() {
        super.init(frame:CGRect(x:0, y:0, width:640, height:480))
        backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        
        viewSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var musicLabel = UILabel()
    var playgroundLabel = UILabel()
    var creatorLabel = UILabel()
    var desc = UILabel()
    var instructions = UILabel()
    
    var squareImage = UIImageView()
    var circleImage = UIImageView()
    var rectImage = UIImageView()
    
    func viewSetup() {
        
        let instructionsString = "Select a shape and tap on the playground to add it.\nSelect a barrier and drag a line where you want it.\nEvery time a shape hits the walls or a barrier, it will play its sound.\nUse the slider to control tempo.\n\nWhat can you create?\n\n(Tap anywhere to continue)"
        
        musicLabel = createLabel(title: "Music", fontSize: 35, textColor: .white, x: 187, y: 31, width: 100, height: 47)
        playgroundLabel = createLabel(title: "Playground", fontSize: 50, textColor: .white, x: 186, y: 57, width: 268, height: 69)
        creatorLabel = createLabel(title: "by Mitchell Sweet", fontSize: 15, textColor: .white, x: 329, y: 115, width: 125, height: 20)
        desc = createLabel(title: "Squares are bass, circles are lead,\nrectangles are drums", fontSize: 15, textColor: .white, x: 203, y: 159, width: 260, height: 40)
        instructions = createLabel(title: instructionsString, fontSize: 15, textColor: .white, x: 87, y: 289, width: 467, height: 160)
        
        musicLabel.textAlignment = .left
        musicLabel.numberOfLines = 0
        playgroundLabel.textAlignment = .center
        playgroundLabel.numberOfLines = 0
        creatorLabel.textAlignment = .right
        creatorLabel.numberOfLines = 0
        desc.textAlignment = .center
        desc.numberOfLines = 0
        instructions.textAlignment = .center
        instructions.numberOfLines = 0
        
        let square = UIImage(named: "Square")!
        let oval = UIImage(named: "Oval")!
        let rect = UIImage(named: "Rectangle")!
        
        squareImage = createImageView(image: square, x: 204, y: 215, width: 58, height: 58)
        circleImage = createImageView(image: oval, x: 291, y: 215, width: 58, height: 58)
        rectImage = createImageView(image: rect, x: 378, y: 226, width: 71, height: 36)
        
        self.addSubview(musicLabel)
        self.addSubview(playgroundLabel)
        self.addSubview(creatorLabel)
        self.addSubview(desc)
        self.addSubview(instructions)
        self.addSubview(squareImage)
        self.addSubview(circleImage)
        self.addSubview(rectImage)
        
        
    }
    
    func createLabel(title: String, fontSize: CGFloat, textColor: UIColor, x: Double, y: Double, width: Double, height: Double) -> UILabel {
        
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: label.font.fontName, size: fontSize)
        label.textColor = textColor
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return label
        
    }
    
    func createImageView(image: UIImage, x: Double, y: Double, width: Double, height: Double) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return imageView
    }
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }, completion: { _ in self.removeFromSuperview() })
        
    }

    
}

