import UIKit

class SegundoViewController: UIViewController {

    @IBOutlet weak var vistamover: UIView!
    @IBOutlet weak var vistafinal: UIView!
    var origen : CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        origen = vistamover.frame.origin
        view.bringSubview(toFront: vistamover)
        
    }

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "izquierda", sender: self)
    }
    
    @IBAction func mover(_ sender: UIPanGestureRecognizer) {
        
        let vista = sender.view
        let movimiento = sender.translation(in: vista)
        
        switch sender.state {
        case .began, .changed:
            let x = (sender.view?.center.x)! + movimiento.x
            let y = (sender.view?.center.y)! + movimiento.y
            vista?.center = CGPoint(x: x, y: y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        case .ended:
            if (vista?.frame.intersects(vistafinal.frame))! {
                print("llego")
            }else{
                UIView.animate(withDuration: 0.3, animations: {
                    self.vistamover.frame.origin = self.origen
                })
            }
        default:
            break
        }
        
    }
    
}










