//
//  ViewController.swift
//  Dynamic-ChessBoard
//
//  Created by Georgios Zervos on 26/5/23.
//

import UIKit



class ViewController: UIViewController {
    @IBOutlet weak var text_value: UILabel!
    @IBOutlet weak var numberSelector: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text_value.text = "Chess Board Dimension: " + String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))

    }

    @IBAction func slider(_ sender: Any) {
        text_value.text = "Chess Board Dimension: " +  String(Int(numberSelector.value)) + " x " + String(Int(numberSelector.value))

    }
    
}

