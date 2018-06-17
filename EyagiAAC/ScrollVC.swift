//
//  ScrollVC.swift
//  EyagiAAC
//
//  Created by Donghoon Shin on 2018. 6. 15..
//  Copyright © 2018년 Donghoon Shin. All rights reserved.
//

import UIKit


protocol SendDataDelegate {
    func sendData(data: UIImage)
}

class ScrollVC: UIViewController {
    
    var delegate: SendDataDelegate?
    
    @IBAction func emotionButton(_ sender: UIButton) {
        if let data = sender.currentImage {
            delegate?.sendData(data: data)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func dismissScroll(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
