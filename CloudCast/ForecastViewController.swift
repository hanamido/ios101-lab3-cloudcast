//
//  ForecastViewController.swift
//  CloudCast
//
//  Created by Hanami Do on 9/28/23.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // this is an IBOutlet (link connecting the UI element in the storyboard to your Swift code, allows you to reference and modify the UI element)
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var forecastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    // IBActions are functions that get called when the user interacts with a certain UI element
    @IBAction func didTapBackButton(_ sender: UIButton) {
        selectedForecastIndex = max(0, selectedForecastIndex - 1) // don't go lower than 0 index
        configure(with: forecasts[selectedForecastIndex]) // change the forecast shown in the UI
    }
    
    @IBAction func didTapForwardButton(_ sender: UIButton) {
        selectedForecastIndex = min(forecasts.count - 1, selectedForecastIndex + 1) // don't go higher than the number of forecasts
        configure(with: forecasts[selectedForecastIndex]) // change the forecast shown in the UI
    }
    
    private var forecasts = [WeatherForecast]() // tracks all the possible forecasts
    private var selectedForecastIndex = 0 // tracks which forecast is being shown, defaults to 0
    
    // Class declaration, including the name of the class and its subclass (UIViewController)
    override func viewDidLoad() {
        
        // Function override for the view controller
        // This is fired when the view has finished loading for the first time
        super.viewDidLoad()
        forecasts = createMockData()
        configure(with: forecasts[selectedForecastIndex])  // configure the UI to show the first mock data
        }
    
    // returns an array of fake WeatherForecast data models to show
    private func createMockData() -> [WeatherForecast] {
        // uses Calendar API to get a few random dates
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.day = 1
        let tomorrow = Calendar.current.date(byAdding: dateComponents, to: today)!
        let dayAfterTomorrow = Calendar.current.date(byAdding: dateComponents, to: tomorrow)!
        // Create a few mock data to show
        let mockData1 = WeatherForecast(temperature: 59.5,
                                        date: today,
                                        weatherCode: .violentRainShowers,
                                        windSpeed: 3.3,
                                        precipitation: 33.3)
        let mockData2 = WeatherForecast(temperature: 65.5,
                                        date: tomorrow,
                                        weatherCode: .fog,
                                        windSpeed: 3.7,
                                        precipitation: 13.3)
        let mockData3 = WeatherForecast(temperature: 49.5,
                                        date: dayAfterTomorrow,
                                        weatherCode: .partlyCloudy,
                                        windSpeed: 2.8,
                                        precipitation: 23.3)
        return [mockData1, mockData2, mockData3]
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
