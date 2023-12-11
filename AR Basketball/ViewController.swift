

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var addHoopButton: UIButton!
    
    var currentNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        sceneView.delegate = self
        
        sceneView.showsStatistics = true
        
        let scene = SCNScene()
        
        sceneView.scene = scene
        
        registerGesture()
    }
    
    func registerGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        sceneView.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(gestureRegocnizer: UIGestureRecognizer) {
        guard let sceneView = gestureRegocnizer.view as? ARSCNView else {
            return
        }
        
        guard let centerPoint = sceneView.pointOfView else {
            return
        }
        
        let cameraTransform = centerPoint.transform
        let cameraLocation = SCNVector3(x: cameraTransform.m41 ,y: cameraTransform.m42, z:cameraTransform.m43)
        let cameraOrientation = SCNVector3(x: -cameraTransform.m31 ,y: -cameraTransform.m32, z: -cameraTransform.m33 )
        let cameraPosition = SCNVector3Make(cameraLocation.x + cameraOrientation.x, cameraLocation.y + cameraOrientation.y, cameraLocation.z + cameraOrientation.z)
    
        let ball = SCNSphere(radius: 0.15)
        let ballMaterial = SCNMaterial()
        ballMaterial.diffuse.contents = UIImage(named: "basketballSkin.png")
        ball.materials = [ballMaterial]
        
        let ballNode = SCNNode(geometry: ball)
        ballNode.position = cameraPosition
        
        let physicsShape = SCNPhysicsShape(node: ballNode, options: nil)
        let physicsBody = SCNPhysicsBody(type: .dynamic, shape: physicsShape)
        ballNode.physicsBody = physicsBody
        
        let forceVector : Float = 6
        ballNode.physicsBody?.applyForce(SCNVector3(x: cameraOrientation.x * forceVector, y: cameraOrientation.y * forceVector, z: cameraOrientation.z * forceVector), asImpulse: true)
        
        sceneView.scene.rootNode.addChildNode(ballNode)
        
    }
    
    func addBackboard() {
        guard let backboardScene = SCNScene(named: "art.scnassets/hoop.scn") else {
            return
        }
        
        guard let backboardNode = backboardScene.rootNode.childNode(withName: "backboard", recursively: false) else {
            return
        }
        
        backboardNode.position = SCNVector3(x: 0, y: -0.5, z: -3)
        
        
        let physicsShape = SCNPhysicsShape(node: backboardNode, options: [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.concavePolyhedron])
        let physicsBody = SCNPhysicsBody(type: .static, shape: physicsShape)
        
        backboardNode.physicsBody = physicsBody
        
        sceneView.scene.rootNode.addChildNode(backboardNode)
        
        currentNode = backboardNode
    }
    
    func horizontalAction(node: SCNNode) {
        let leftAction = SCNAction.move(by: SCNVector3(x: -1, y: 0, z: 0), duration: 3)
        let rightAction = SCNAction.move(by: SCNVector3(x: 1, y: 0, z: 0), duration: 3)
        
        
        let actionSequence = SCNAction.sequence([leftAction, rightAction])
        
        node.runAction(SCNAction.repeat(actionSequence, count: 2))
    }
    
    func roundAction(node: SCNNode) {
       
        let upLeft = SCNAction.move(by: SCNVector3(x: 1, y: 1, z: 0), duration: 2)
        let downRight = SCNAction.move(by: SCNVector3(x: 1, y: -1, z: 0), duration: 2)
        let downLeft = SCNAction.move(by: SCNVector3(x: -1, y: -1, z: 0), duration: 2)
        let upRight = SCNAction.move(by: SCNVector3(x: -1, y: 1, z: 0), duration: 2)
        
       
        let actionSequence = SCNAction.sequence([upLeft, downRight, downLeft, upRight])
        node.runAction(SCNAction.repeat(actionSequence, count: 2))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
       
        let configuration = ARWorldTrackingConfiguration()

      
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

  
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        
    }
    
    @IBAction func startRoundAction(_ sender: Any) {
        roundAction(node: currentNode)
    }
    
    @IBAction func stopAction(_ sender: Any) {
        currentNode.removeAllActions()
    }
    
    @IBAction func startHorizontalAction(_ sender: Any) {
        horizontalAction(node: currentNode)
    }
    
    @IBAction func addHoop(_ sender: Any) {
        addBackboard()
        addHoopButton.isHidden = true
    }
    
}
