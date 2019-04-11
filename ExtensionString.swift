
/
//  ExtensionString.swift
//  App Utilities
//
//  Created by Shubham on 03/10/18.
//  Copyright © 2018 Shubham. All rights reserved.
//

import UIKit
import Foundation

extension String {

      ///////////////////////////////////////////////////////**** UI VALIDATIONS  ******/////////////////////////
        var isPhoneNumber: Bool {
            do {
                let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
                let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count))
                if let res = matches.first {
                    return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.characters.count
                } else {
                    return false
                }
            } catch {
                return false
            }
        }
          //To check text field or String is blank or not
      var isBlank: Bool {
        get {
            let trimmed = stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatchInString(self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
        
        
        
        
        
        
    /////////////////////////////////////////////////////// HTML To String /////////////////////////
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
}
