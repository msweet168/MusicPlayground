//: Welcome to Music Playground!

//: Music Playground is the most fun way to make a cool beat!
//: Squares are bass, circles are lead, and rectangles are drums. 
//: Choose a shape and drop it in the playground and it will start bouncing. 
//: Whenever a shape hits a barrier or a wall, it will play its sound.
//: Control the speed with the slider. Wanna start over, just tap "clear".
//: What awesome beats can you make?

import UIKit
import PlaygroundSupport
import SpriteKit


var scene = Interface()

var view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 640, height: 480)
view.backgroundColor = .white

var skView = SKView(frame: CGRect(x: 0, y: 36, width: 640, height: 354))
skView.backgroundColor = .white
skView.presentScene(scene)
view.addSubview(skView)

var controls = ControlBar(scene: scene)
view.addSubview(controls)

var titleView = TitleBar()
view.addSubview(titleView)

var intro = IntroView()
view.addSubview(intro)


//:Set these to "true" if you want to see SpriteKit values.
skView.showsFPS = false
skView.showsPhysics = false
skView.showsNodeCount = false



PlaygroundPage.current.liveView = view
