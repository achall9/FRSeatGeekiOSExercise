//
//  Date.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

extension String {

    func getDisplayDate(inputFormat: String = "yyyy-MM-dd'T'HH:mm:ss", timeTBD: Bool = false) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = inputFormat
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let displayFormat = timeTBD ? "EEEE, dd MMM yyyy" : "EEEE, dd MMM yyyy hh:mma"
        dateFormatter.dateFormat = displayFormat
        return dateFormatter.string(from: date) + (timeTBD ? " TBD" : "")
    }
    
}
