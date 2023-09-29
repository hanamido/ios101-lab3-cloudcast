//
//  WeatherForecast.swift
//  CloudCast
//
//  Created by Hanami Do on 9/28/23.
//

import Foundation
import UIKit

// data model for displaying weather forecast
struct WeatherForecast {
    let temperature: Double
    let date: Date
    let weatherCode: WeatherCode
}

// enum is a collection of related values
enum WeatherCode {
    case clearSky
    case mainlyClear
    case partlyCloudy
    case overcast
    case fog
    case lightDrizzle
    case moderateDrizzle
    case denseDrizzle
    case slightRainShowers
    case moderateRainShowers
    case violentRainShowers

    // change the description based on the WeatherCode
    var description: String {
        switch self {
        case .clearSky:
            return "Clear skies"
        case .mainlyClear:
            return "Mainly clear"
        case .partlyCloudy:
            return "Partly cloudy"
        case .overcast:
            return "Overcast"
        case .fog:
            return "Foggy"
        case .lightDrizzle:
            return "Light Drizzle"
        case .moderateDrizzle:
            return "Moderate Drizzle"
        case .denseDrizzle:
            return "Dense Drizzle"
        case .slightRainShowers:
            return "Slight Showers"
        case .moderateRainShowers:
            return "Moderate Showers"
        case .violentRainShowers:
            return "Violent Showers"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .clearSky, .mainlyClear:
            return UIImage(named: "sun")
        case .partlyCloudy:
            return UIImage(named: "cloud-sun")
        case .overcast:
            return UIImage(named: "cloud")
        case .fog:
            return UIImage(named: "fog")
        case .lightDrizzle, .moderateDrizzle, .denseDrizzle:
            return UIImage(named: "drizzle")
        case .slightRainShowers, .moderateRainShowers, .violentRainShowers:
            return UIImage(named: "cloud-drizzle")
        }
    }
}
