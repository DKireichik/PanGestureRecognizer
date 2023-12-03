//
//  ViewController.swift
//  PanGestureRecognizer
//
//  Created by Darya on 30.11.23.
//

import UIKit

class ViewController: UIViewController {
    let blueView = {
        let blueView = UIView(frame: CGRect(x: 200, y: 300, width: 100, height: 100))
        blueView.translatesAutoresizingMaskIntoConstraints = false
        return blueView
    }() 
    let purpleView = {
        let purpleView = UIView()
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        return purpleView
    }()
    let button = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(blueView)
        view.addSubview(purpleView)
        view.addSubview(button)
        button.backgroundColor = .green
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        button.addTarget(self, action: #selector(getResult), for: .touchUpInside)

        blueView.backgroundColor = .blue
    
    
        purpleView.backgroundColor = .purple
        purpleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        purpleView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        purpleView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        purpleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(viewMoved))
        blueView.addGestureRecognizer(panGestureRecognizer)
  
    }
    @objc func viewMoved (_ sender : UIPanGestureRecognizer){
       let translation = sender.translation(in:view)
       if let blueView = sender.view {
            blueView.center = CGPoint(x: blueView.center.x + translation.x, y: blueView.center.y + translation.y)
            sender.setTranslation(.zero, in: view)
            if blueView.frame.intersects(purpleView.frame) {
                button.setTitle("Start again", for: .normal)
                sender.isEnabled = false
                
            }
        }
       
    }
    @IBAction func getResult(_ sender: UIButton) {
        blueView.center = CGPoint(x: 300, y: 300)

    }
    
    
}
