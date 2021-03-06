import Foundation
import SpriteKit

/// Allows for multiple subviews to be added to the UIView in one statement.
extension UIView {
    func addSubviews(_ views: UIView...) {
       for view in views { addSubview(view) }
    }
}

/// Lists categories for different types of nodes.
struct NodeType: OptionSet {
    let rawValue: UInt32
    static let scene = NodeType(rawValue: 1 << 0)
    static let bass = NodeType(rawValue: 1 << 1)
    static let lead = NodeType(rawValue: 1 << 2)
    static let drum = NodeType(rawValue: 1 << 3)
    static let barrier = NodeType(rawValue: 1 << 4)
}

/// Support on SKPhysicsBody for option-set based bitmasks
/// to replace the bug-prone integer bitmasks.
extension SKPhysicsBody {
    /// The "category" of this node.
    var categoryType: NodeType {
        get { return NodeType(rawValue: categoryBitMask) }
        set { categoryBitMask = newValue.rawValue }
    }
    /// The categories of nodes that will cause a collision with this node.
    var collisionType: NodeType {
        get { return NodeType(rawValue: collisionBitMask) }
        set { collisionBitMask = newValue.rawValue }
    }
    /// The categories of nodes that will cause a call to didBegin/didEndContact.
    var contactTestType: NodeType {
        get { return NodeType(rawValue: contactTestBitMask) }
        set { contactTestBitMask = newValue.rawValue }
    }
}

/// Describes the node currently selected.
enum ObjectType {
    case bass
    case lead
    case drums
    case barrier
}

/// Describes different octaves which nodes can play sounds at. 
enum SoundModifier {
    case high
    case medium
    case low
}
