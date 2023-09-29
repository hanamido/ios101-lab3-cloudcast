//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Hanami Do on 9/28/23.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // this is an IBOutlet (link connecting the UI element in the storyboard to your Swift code
    // (allows you to reference and modify the UI element
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // Class declaration, including the name of the class and its subclass (UIViewController)
    override func viewDidLoad() {
        
        // Function override for the view controller
        // This is fired when the view has finished loading for the first time
        super.viewDidLoad()
        
        let fakeData = WeatherForecast(temperature: 70.0,
                                       date: Date(),
                                       weatherCode: .partlyCloudy)
        configure(with: fakeData)
    }
    
    private func configure(with forecast: WeatherForecast) {
        forecastImageView.image = forecast.weatherCode.image
        descriptionLabel.text = forecast.weatherCode.description
        temperatureLabel.text = "\(forecast.temperature)°F"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        dateLabel.text = dateFormatter.string(from: forecast.date)
    }

}
