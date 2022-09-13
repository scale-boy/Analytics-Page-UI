//
//  Download.swift
//  Analytics-Page-UI
//
//  Created by Nguyen Van Thuan on 13/09/2022.
//

import SwiftUI

struct Download: Identifiable {
    
    var id = UUID().uuidString
    var download: CGFloat
    var weekDay: String
}

var downloads: [Download] = [
    Download(download: 500, weekDay: "Mon"),
    Download(download: 260, weekDay: "Tue"),
    Download(download: 320, weekDay: "Wed"),
    Download(download: 465, weekDay: "Thu"),
    Download(download: 698, weekDay: "Fri"),
    Download(download: 940, weekDay: "Sat"),
    Download(download: 160, weekDay: "Sun")
]
