//
//  DateFormatter.swift
//  Slide News
//
//  Created by Aman Kumar on 28/04/24.
//

import Foundation

func convertDate(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    guard let date = dateFormatter.date(from: dateString) else {
        return "Invalid Date"
    }
    
    let updatedDateFormatter = DateFormatter()
    updatedDateFormatter.dateFormat = "MMM dd, yyyy"
    let convertedDateString = updatedDateFormatter.string(from: date)
    
    return convertedDateString
}
