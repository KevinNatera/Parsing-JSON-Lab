//
//  ColorViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/28/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import Foundation
import UIKit

class ColorViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var colors = [ColorResponse]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = colorTableOutlet.dequeueReusableCell(withIdentifier: "colors")
        
        let color = colors[indexPath.row]
        
        cell?.textLabel?.text = color.name.value
        cell?.backgroundColor = UIColor(displayP3Red: CGFloat(color.rgb.fraction.r), green: CGFloat(color.rgb.fraction.g), blue: CGFloat(color.rgb.fraction.b), alpha: 1.0)
        
        return cell!
    }
    
    @IBOutlet weak var colorTableOutlet: UITableView!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorDetailVC = segue.destination as? ColorDetailViewController else { fatalError() }
        
        colorDetailVC.color = colors[colorTableOutlet.indexPathForSelectedRow!.row]
    }
    
    
    
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "color", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let colorsFromJSON = try ColorResponse.getColors(from: data)
            colors = colorsFromJSON
        } catch {
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorTableOutlet.delegate = self
        colorTableOutlet.dataSource = self
        loadData()
    }
}
