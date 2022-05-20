//
//  ContentView.swift
//  Tourism
//
//  Created by としや on 2021/08/12.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // $0 クロージャ
        userData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top) // 最上部のエリアも表示に使う
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    Button(action: {
                        // isFavoriteを切り替える
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        // もしお気に入りならば
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                                // 塗りつぶされたスター
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.yellow)
                        } else {
                            // 白抜きスター
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                Text(landmark.name)
                    .font(.title)
                HStack {
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
