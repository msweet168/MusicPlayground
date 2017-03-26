import Foundation
import SpriteKit

public class Interface: SKScene, SKPhysicsContactDelegate {
    
    
    public override func sceneDidLoad() {
        size = CGSize(width: 640, height: 390)
        backgroundColor = .white
        setUpPhysics()
        shapeType = ObjectType.bass
    }
    
    func setUpPhysics() {
        let body = SKPhysicsBody(edgeLoopFrom: frame)
        body.categoryType = .scene
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)
        physicsBody = body
    }

    public func didBegin(_ contact: SKPhysicsContact) {
        //if contact.bodyA.node is BarrierNode && contact.bodyB.node is SoundNode {
        //}
        if let soundNode = contact.bodyA.node as? SoundNode {
            soundNode.playSound()
        }
        if let soundNode = contact.bodyB.node as? SoundNode {
            soundNode.playSound()
        }
    }
    
    var shapeType:ObjectType?
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first!
        let location = touch.location(in: self)
        let existing = nodes(at: location)
        
        if existing.isEmpty {
            addObject(point: location)
        } else {
            removeChildren(in: existing)
        }

    }
    
    func addObject(point: CGPoint) {
        
        var node:SKSpriteNode!
        
        if shapeType == ObjectType.bass {
            node = BassNode()
        }
        else if shapeType == ObjectType.lead {
            node = LeadNode()
        }
        else if shapeType == ObjectType.drums {
            node = DrumsNode()
        }
        else if shapeType == ObjectType.barrier {
            
            //Place barrier node on scene.
            
            //node = BarrierNode()
            print("Barrier node clicked.")
            
            //Temporory to prevent crashes:
            node = BassNode()
        }
        else
        {
            print("Error: Node not set, inserting bass node by default.")
            node = BassNode()
        }
        
        node.position = point
        addChild(node)
    }
}
