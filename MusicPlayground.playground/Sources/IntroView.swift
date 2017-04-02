import Foundation
import UIKit

/// UIView which gives instructions on how to use Music Playground. Appears when playground is launched and when info button is clicked.
public class IntroView: UIView {
    
    // Initalizes view with a frame and background color.
    public init() {
        super.init(frame:CGRect(x:0, y:0, width:640, height:480))
        backgroundColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1)
        
        viewSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Creates attributes for buttons and images.
    var musicLabel = UILabel()
    var playgroundLabel = UILabel()
    var creatorLabel = UILabel()
    var desc = UILabel()
    var instructions = UILabel()
    
    var squareImage = UIImageView()
    var circleImage = UIImageView()
    var rectImage = UIImageView()
    
    // Function called by initalizer which sets up subviews in IntroView.
    func viewSetup() {
        
        // Create a string for lengthy instructions.
        let instructionsString = "Select a shape and tap on the playground to add it.\nSelect barrier and drag a line where you want it.\nEvery time a shape hits the walls or a barrier, it will play its sound.\nLower octaves on the left,\nhigher octaves on the right.\nUse the slider to control tempo.\n\nWhat can you create?\n\n(Tap anywhere to continue)"
        
        // Create labels for view.
        musicLabel = createLabel(title: "Music", fontSize: 35, textColor: .white, x: 194, y: 31, width: 100, height: 47)
        musicLabel.font = UIFont(name: "Chalkboard SE", size: 35)
        playgroundLabel = createLabel(title: "Playground", fontSize: 50, textColor: .white, x: 186, y: 57, width: 268, height: 69)
        playgroundLabel.font = UIFont(name: "Chalkboard SE", size: 50)
        creatorLabel = createLabel(title: "by Mitchell Sweet", fontSize: 15, textColor: .white, x: 321, y: 115, width: 133, height: 20)
        creatorLabel.font = UIFont(name: "AvenirNext-Bold", size: 15)
        desc = createLabel(title: "Squares are bass, circles are melody,\nrectangles are drums", fontSize: 15, textColor: .white, x: 194, y: 153, width: 260, height: 50)
        desc.font = UIFont(name: "AvenirNext-Medium", size: 15)
        instructions = createLabel(title: instructionsString, fontSize: 13, textColor: .white, x: 122, y: 280, width: 397, height: 180)
        instructions.font = UIFont(name: "AvenirNext-Medium", size: 13)
        
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
        
        // Create images for image views.
        let square = UIImage(named: "Square")!
        let oval = UIImage(named: "Oval")!
        let rect = UIImage(named: "Rectangle")!
        
        squareImage = createImageView(image: square, x: 204, y: 205, width: 58, height: 58)
        circleImage = createImageView(image: oval, x: 291, y: 205, width: 58, height: 58)
        rectImage = createImageView(image: rect, x: 378, y: 216, width: 71, height: 36)
        
        // Adds all subviews via extension created on UIView.
        self.addSubviews(musicLabel, playgroundLabel, creatorLabel, desc, instructions, squareImage, circleImage, rectImage)
        
        
    }
    
    /// Function which takes in parameters for basic label attributes and returns a label object.v
    func createLabel(title: String, fontSize: CGFloat, textColor: UIColor, x: Double, y: Double, width: Double, height: Double) -> UILabel {
        
        let label = UILabel()
        label.text = title
        label.font = UIFont(name: label.font.fontName, size: fontSize)
        label.textColor = textColor
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return label
        
    }
    
    /// Function which takes in parameters for basic UIImageView attributes and returns a label object.
    func createImageView(image: UIImage, x: Double, y: Double, width: Double, height: Double) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        return imageView
    }
    
    // called when user touches anywhere on the view and dismisses it via animation. 
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        })
        
    }
    
}

