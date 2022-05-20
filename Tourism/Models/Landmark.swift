//
//  Landmark.swift
//  Tourism
//
//  Created by としや on 2021/08/13.
//  モデルには通常、構造体やクラスを用いて作成する
//

import UIKit
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int                     //
    var name: String                // 観光地名
    fileprivate var imageName: String           // 画像名
    fileprivate var coordinates: Coordinates    // 座標
    var state: String               // 州名
    var park: String                // 公園名
    var category: Category          // カテゴリー
    var isFavorite: Bool            // お気に入り
    var isFeatured: Bool            // 取り上げられた
    
    // CaseIterableは全ケースをCategory.allCasesで配列として取得できるプロトコル
    enum Category: String, CaseIterable, Hashable, Codable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
