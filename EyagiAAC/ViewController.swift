//
//  ViewController.swift
//  EyagiAAC
//
//  Created by Donghoon Shin on 2018. 6. 13..
//  Copyright © 2018년 Donghoon Shin. All rights reserved.
//

import UIKit


extension ViewController : SendDataDelegate {
    func sendData(data: UIImage) {
        profilePic.image = data
    }
}

extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = 90
        self.clipsToBounds = true
        self.layer.borderColor = UIColor(red: 0.62, green: 0.83, blue: 0.95, alpha: 1).cgColor
        self.layer.borderWidth = 6
    }
}

class ViewController: UIViewController {
    

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var statusLabel: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var leftButton: UIBarButtonItem!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VCconnection" {
            let vc : ScrollVC = segue.destination as! ScrollVC
            vc.delegate = self
        }
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        
        sideMenus()
                
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        
        statusLabel.layer.borderColor = UIColor(red: 0.62, green: 0.83, blue: 0.95, alpha: 1).cgColor
        statusLabel.layer.borderWidth = 3
        statusLabel.layer.cornerRadius = 10
        statusLabel.layer.shadowColor = UIColor(red: 0.62, green: 0.83, blue: 0.95, alpha: 1).cgColor
        statusLabel.layer.shadowOpacity = 0.7
        statusLabel.layer.shadowOffset = CGSize.zero
        
        profilePic.roundedImage()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        profilePic.isUserInteractionEnabled = true
        profilePic.addGestureRecognizer(tapGestureRecognizer)
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
        
        
        //여기에 TOUCH EVENT 추가하기!!
        
        /* let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "dimmedView")
        present(nextView, animated: true, completion: nil) */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*func buttonTapped(sender: UITapGestureRecognizer) {
        if (sender.state == .ended) {
            print("터치 이벤트")
        }
    }*/
    
    func sideMenus() {
        if revealViewController() != nil {
            
            leftButton.target = revealViewController()
            leftButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
}

