//
//  UserData.swift
//  Tourism
//
//  Created by としや on 2021/08/13.
//  showFavoritesOnlyとlandmarkDataを監視可能オブジェクトとして登録
//  監視下で、変更に応じて全てのビューに対しての再描画を行わせたいプロパティには、
//  @Published属性を付与する.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var hikes = hikeData
    @Published var features = featuresData
    @Published var categories = categoriesData
    @Published var profile = Profile.default
}
