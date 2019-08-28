//
//  ViewController.swift
//  ParsingJSONProj
//
//  Created by Kevin Natera on 8/27/19.
//  Copyright © 2019 Kevin Natera. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var weatherData = [WeatherResponse]()
    
    @IBOutlet weak var weatherTableOutlet: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableOutlet.dequeueReusableCell(withIdentifier: "weather")
        
        cell?.textLabel?.text = weatherData[indexPath.row].name

        return cell!
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let weatherDetailVC = segue.destination as? WeatherDetailViewController else { fatalError() }
        
        weatherDetailVC.city = weatherData[weatherTableOutlet.indexPathForSelectedRow!.row]
    }
    
    private func loadData() {
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("Couldn't find json file")
        }
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            let data = try Data(contentsOf: url)
            let weatherDataFromJSON = try WeatherResponse.getWeatherData(from: data)
            weatherData = weatherDataFromJSON
        } catch {
            print(error)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableOutlet.delegate = self
        weatherTableOutlet.dataSource = self
        loadData()
    }


}

