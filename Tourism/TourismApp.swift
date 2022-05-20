//
//  TourismApp.swift
//  Tourism
//
//  Created by としや on 2021/08/12.
//

import SwiftUI

@main
struct TourismApp: App {
    
//    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            CategoryHome()
                .environmentObject(UserData())
//            LandmarkDetail(landmark: landmarkData[0])
//                .environmentObject(UserData())
        }
    }
}
