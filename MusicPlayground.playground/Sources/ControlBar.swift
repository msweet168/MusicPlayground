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
    
    var bassButton = UIButton()
    var leadButton = UIButton()
    var drumButton = UIButton()
    var barrierButton = UIButton()
    var playPause = UIButton()
    var clearButton = UIButton()
    var resetTempo = UIButton()
    
    var tempoSlider = UISlider()
    
    var bassLabel = UILabel()
    var leadLabel = UILabel()
    var drumLabel = UILabel()
    var barrierLabel = UILabel()
    var speedLabel = UILabel()
    
    var playLabel = UILabel()
    var clearLabel = UILabel()
    var tempoLabel = UILabel()
    
    
    
    func viewSetup() {
        
        bassButton = createButton(title: "", backColor: UIColor(red: 208/255, green: 2/255, blue: 27/255, alpha: 1), radius: 10, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 30, y: 28, width: 45, height: 45)
        leadButton = createButton(title: "", backColor: UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1), radius: 22, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 88, y: 28, width: 45, height: 45)
        drumButton = createButton(title: "", backColor: UIColor(red: 138/255, green: 6/255, blue: 165/255, alpha: 1), radius: 10, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 148, y: 32, width: 71, height: 36)
        barrierButton = createButton(title: "", backColor: UIColor.black, radius: 5, titleColor: UIColor.clear, highlighted: UIColor.clear, x: 246, y: 44, width: 108, height: 10)
        
        bassButton.addTarget(self, action: #selector(setBass), for: .touchUpInside)
        leadButton.addTarget(self, action: #selector(setLead), for: .touchUpInside)
        drumButton.addTarget(self, action: #selector(setDrum), for: .touchUpInside)
        barrierButton.addTarget(self, action: #selector(setBarrier), for: .touchUpInside)
        
        
        bassButton.layer.borderColor = UIColor.black.cgColor
        bassButton.layer.borderWidth = 2
        
        bassLabel = createLabel(title: "Bass", fontSize: 13, textColor: .white, x: 38, y: 5, width: 30, height: 18)
        leadLabel = createLabel(title: "Melody", fontSize: 13, textColor: .white, x: 89, y: 5, width: 45, height: 18)
        drumLabel = createLabel(title: "Drums", fontSize: 13, textColor: .white, x: 162, y: 5, width: 41, height: 18)
        barrierLabel = createLabel(title: "Barrier", fontSize: 13, textColor: .white, x: 278, y: 5, width: 43, height: 18)
        
        bassLabel.textAlignment = .center
        leadLabel.textAlignment = .center
        drumLabel.textAlignment = .center
        barrierLabel.textAlignment = .center
        
        
        let pauseImage = UIImage(named: "pause")
        let pauseHighlight = UIImage(named: "pauseHighlight")
        playPause = createButton(title: "", backColor: .clear, radius: 0, titleColor: .clear, highlighted: .clear, x: 374, y: 28, width: 37, height: 37)
        playPause.setImage(pauseImage, for: .normal)
        playPause.setImage(pauseHighlight, for: .highlighted)
        playPause.addTarget(self, action: #selector(pausePlay), for: .touchUpInside)
        playLabel = createLabel(title: "Playback", fontSize: 13, textColor: .white, x: 363, y: 5, width: 60, height: 18)
        
        let trashImage = UIImage(named: "clear")
        let trashHighlight = UIImage(named: "clearHighlight")
        clearButton = createButton(title: "", backColor: .clear, radius: 0, titleColor: .clear, highlighted: .clear, x: 435, y: 28, width: 37, height: 37)
        clearButton.setImage(trashImage, for: .normal)
        clearButton.setImage(trashHighlight, for: .highlighted)
        clearButton.addTarget(self, action: #selector(clearAll), for: .touchUpInside)
        clearLabel = createLabel(title: "Clear", fontSize: 13, textColor: .white, x: 435, y: 5, width: 40, height: 18)
        
        
        tempoSlider.maximumValue = 2
        tempoSlider.minimumValue = 0.1
        tempoSlider.value = 1
        tempoSlider.minimumTrackTintColor = UIColor.white
        tempoSlider.thumbTintColor = UIColor.black
        tempoSlider.frame = CGRect(x: 485, y: 30, width: 145, height: 31)
        tempoSlider.addTarget(self, action: #selector(changeTempo), for: .valueChanged)
        tempoLabel = createLabel(title: "Tempo", fontSize: 13, textColor: .white, x: 533, y: 5, width: 50, height: 18)
        resetTempo = createButton(title: "Reset", backColor: .clear, radius: 0, titleColor: .white, highlighted: .gray, x: 530, y: 65, width: 50, height: 18)
        resetTempo.addTarget(self, action: #selector(tempoReset), for: .touchUpInside)
        
        
        
        self.addSubviews(bassButton, leadButton, drumButton, barrierButton, bassLabel, leadLabel, drumLabel, barrierLabel, playPause, playLabel, clearButton, clearLabel, tempoSlider, tempoLabel, resetTempo)
        
        
        
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
    
    func setBass() {
        mainScene.shapeType = .bass
        setBorder(button: bassButton)
    }
    
    func setLead() {
        mainScene.shapeType = .lead
        setBorder(button: leadButton)
    }
    
    func setDrum() {
        mainScene.shapeType = .drums
        setBorder(button: drumButton)
    }
    
    func setBarrier() {
        mainScene.shapeType = .barrier
        setBorder(button: barrierButton)
    }
    
    func setBorder(button: UIButton) {
        
        bassButton.layer.borderWidth = 0
        leadButton.layer.borderWidth = 0
        drumButton.layer.borderWidth = 0
        barrierButton.layer.borderWidth = 0
        
        if button == barrierButton {
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
        }
        else
        {
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
        }
        
    }
    
    func pausePlay() {
        
        let image = UIImage(named: mainScene.isPaused ? "pause" : "play")!
        let highlightImage = UIImage(named: mainScene.isPaused ? "pauseHighlight" : "playHighlight")
        mainScene.isPaused = !mainScene.isPaused
        playPause.setImage(image, for: .normal)
        playPause.setImage(highlightImage, for: .highlighted)
        
    }
    
    func clearAll() {
        mainScene.removeAllChildren()
    }
    
    func changeTempo() {
        mainScene.physicsWorld.speed = CGFloat(tempoSlider.value)
    }
    
    func tempoReset() {
        tempoSlider.value = 1
        mainScene.physicsWorld.speed = 1
    }
    
}

