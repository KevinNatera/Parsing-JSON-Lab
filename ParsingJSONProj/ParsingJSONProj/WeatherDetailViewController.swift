//
//  WeatherDetailViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/28/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailViewController : UIViewController {
    
    var city: WeatherResponse!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = city.name
        temperatureLabel.text = " Temp: \(String(city.main.temp)) C"
        weatherLabel.text = city.weather[0].description.capitalized
    }
}
