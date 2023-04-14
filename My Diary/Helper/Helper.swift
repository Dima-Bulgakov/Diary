//
//  Helper.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit

enum Helper {
    
    enum String {
        enum TabBar {
            static let diary = "Diary"
            static let settings = "Settings"
        }
    }
    
    enum Image {
        enum TabBar {
            static let diary = UIImage(systemName: "book.fill") ?? UIImage()
            static let settings = UIImage(systemName: "slider.horizontal.3") ?? UIImage()
        }
        enum Theme {
            static let theme1 = UIImage(named: "theme1") ?? UIImage()
            static let theme2 = UIImage(named: "theme2") ?? UIImage()
            static let theme3 = UIImage(named: "theme3") ?? UIImage()
            static let theme4 = UIImage(named: "theme4") ?? UIImage()
            static let theme5 = UIImage(named: "theme5") ?? UIImage()
            static let theme6 = UIImage(named: "theme6") ?? UIImage()
        }
        enum Icon {
            static let icon1 = UIImage(named: "icon1") ?? UIImage()
            static let icon2 = UIImage(named: "icon2") ?? UIImage()
            static let icon3 = UIImage(named: "icon3") ?? UIImage()
            static let icon4 = UIImage(named: "icon4") ?? UIImage()
        }
    }
    
    enum Color {
        enum Main {
            static var dark = UIColor(hexString: "#222831")
            static var middle = UIColor(hexString: "#4E5460")
            static var bright = UIColor(hexString: "#FFD369")
            static var light = UIColor(hexString: "#EEEEEE")
        }
        
        enum Theme1 {
            static var dark = UIColor(hexString: "#222831")
            static var middle = UIColor(hexString: "#4E5460")
            static var bright = UIColor(hexString: "#FFD369")
            static var light = UIColor(hexString: "#EEEEEE")
        }
        
        enum Theme2 {
            static var dark = UIColor(hexString: "#363062")
            static var middle = UIColor(hexString: "#56548E")
            static var bright = UIColor(hexString: "#9584AF")
            static var light = UIColor(hexString: "#EEEEEE")
        }
        
        enum Theme3 {
            static var dark = UIColor(hexString: "#2C3639")
            static var middle = UIColor(hexString: "#4C5E60")
            static var bright = UIColor(hexString: "#CF9D77")
            static var light = UIColor(hexString: "#E3DED1")
        }
        
        enum Theme4 {
            static var dark = UIColor(hexString: "#2C3333")
            static var middle = UIColor(hexString: "#2E4F4F")
            static var bright = UIColor(hexString: "#0E8387")
            static var light = UIColor(hexString: "#CAE4DE")
        }
        
        enum Theme5 {
            static var dark = UIColor(hexString: "#222831")
            static var middle = UIColor(hexString: "#5D5850")
            static var bright = UIColor(hexString: "#E96479")
            static var light = UIColor(hexString: "#7DB9B6")
        }
        
        enum Theme6 {
            static var dark = UIColor(hexString: "#3F513B")
            static var middle = UIColor(hexString: "#4E7D54")
            static var bright = UIColor(hexString: "#9DC08B")
            static var light = UIColor(hexString: "#EDF1D7")
        }
    }
}

