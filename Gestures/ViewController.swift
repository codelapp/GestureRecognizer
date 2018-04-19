import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        label.addGestureRecognizer(tap)
    */
    }

/*
    @objc func tapAction(){
        print("he dado un tap")
    }
 */
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        print("tap desde action")
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "derecha", sender: self)
    }
    @IBAction func vista(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            let movimiento = sender.translation(in: sender.view)
            let x = (sender.view?.center.x)! + movimiento.x
            let y = (sender.view?.center.y)! + movimiento.y
            
            sender.view?.center = CGPoint(x: x, y: y)
            sender.setTranslation(CGPoint.zero, in: sender.view)
            
        }
        
    }
    
}

