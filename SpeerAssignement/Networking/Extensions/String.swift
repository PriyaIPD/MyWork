//
//  String.swift
//  Kenlo
//
//   .
//

import Foundation

extension String {
    // Validation for find if email is valid
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    // Localized String
    func localized() -> String {
        // Call the NSLocalizedString function to get the localized string for this key
        // The comment parameter is optional and can be used to provide context for translators
        return NSLocalizedString(self, comment: "")
    }
    
    func strToDate(dateString : String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        // Parse the string to a Date
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
        }
        return Date()
    }
    
    func strHrsToDate(dateString : String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"

        // Parse the time string into a Date object
        if let date = dateFormatter.date(from: dateString) {
            // Set up another date formatter to display only hours and minutes
            let displayFormatter = DateFormatter()
            displayFormatter.dateFormat = "HH:mm"
          
            // Format the date to display only hours and minutes
            let formattedTime = displayFormatter.string(from: date)
            print(formattedTime)
            if let date = displayFormatter.date(from: formattedTime) {
                // Set up another date formatter to display the desired format
                let displayFormatter = DateFormatter()
                displayFormatter.dateFormat = "HH'h'mm"
                
                // Format the date to display in the desired format
                let formattedTime = displayFormatter.string(from: date)
                print(formattedTime)
                return formattedTime

            } else {
                print("Invalid time format")
            }
            return formattedTime

        } else {
            print("Invalid time format")
        }
        return ""
    }
    
    func strCalenderToDate(dateString : String) -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // Parse the string to a Date
        if let date = dateFormatter.date(from: dateString) {
            return date
        } else {
        }
        return Date()
    }

}
