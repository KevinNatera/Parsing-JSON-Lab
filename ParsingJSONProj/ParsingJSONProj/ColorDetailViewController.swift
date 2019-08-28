//
//  ColorDetailViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/28/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class ColorDetailViewController : UIViewController {
    var color: ColorResponse!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rgbLabel: UILabel!
    
    @IBOutlet weak var hexLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = color.name.value
        rgbLabel.text = "R: \((color.rgb.fraction.r * 255)) G: \((color.rgb.fraction.g * 255)) B: \((color.rgb.fraction.b * 255))"
        hexLabel.text = "Hex: \(color.hex.value)"
        
        view.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1.0)
    }
}
