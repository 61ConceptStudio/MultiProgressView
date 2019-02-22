//
//  UIColor+Extensions.swift
//  MultiProgressView_Example
//
//  Created by Mac Gallagher on 1/5/19.
//  Copyright © 2019 Mac Gallagher. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    //MARK: - Storage Example Colors
    
    static let progressRed = UIColor.rgb(red: 251, green: 16, blue: 68)
    
    static let progressGreen = UIColor.rgb(red: 67, green: 213, blue: 82)
    
    static let progressPurple = UIColor.rgb(red: 70, green: 58, blue: 205)
    
    static let progressYellow = UIColor.rgb(red: 252, green: 196, blue: 9)
    
    static let progressBlue = UIColor.rgb(red: 10, green: 96, blue: 253)
    
    static let progressOrange = UIColor.rgb(red: 251, green: 128, blue: 7)
    
    static let progressGray = UIColor.rgb(red: 188, green: 186, blue: 194)
    
    static let progressBackground = UIColor.rgb(red: 224, green: 224, blue: 224)
    
    //MARK: - Other Example Colors
    
    static let slateGray = UIColor.rgb(red: 85, green: 98, blue: 112)
    
    static let pacificBlue = UIColor.rgb(red: 78, green: 205, blue: 196)
    
    static let appleGreen = UIColor.rgb(red: 199, green: 244, blue: 100)
    
    static let cherryRed = UIColor.rgb(red: 255, green: 107, blue: 107)
    
    static let roseRed = UIColor.rgb(red: 196, green: 77, blue: 88)
}
