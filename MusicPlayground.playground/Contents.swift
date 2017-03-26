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

var view = SKView(frame: CGRect(x: 0, y: 0, width: 640, height: 480))
view.backgroundColor = .white
view.presentScene(scene)

var titleView = TitleBar()
view.addSubview(titleView)

var controls = ControlBar(scene: scene)
view.addSubview(controls)

var intro = IntroView()
view.addSubview(intro)

//:Set these to "true" if you want to see SpriteKit values.
view.showsFPS = true
view.showsFields = true
view.showsPhysics = true
view.showsNodeCount = true


PlaygroundPage.current.liveView = view
