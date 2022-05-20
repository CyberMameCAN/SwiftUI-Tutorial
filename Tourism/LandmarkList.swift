//
//  LandmarkList.swift
//  Tourism
//
//  Created by としや on 2021/08/13.
//

import SwiftUI

struct LandmarkList: View {
    // @Stateは、変更されたらすぐにビューへの再描画を行う
    // @State var showFavoritesOnly: Bool = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView {    // ビューをナビゲーションとする場合は囲む
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite{
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
//        LandmarkList()
        ForEach(["iPhone X"], id: \.self) { deviceName in
        LandmarkList()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
            .environmentObject(UserData())
        }
    }
}
