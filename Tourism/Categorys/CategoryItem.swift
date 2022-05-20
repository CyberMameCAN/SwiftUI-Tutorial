//
//  CategoryItem.swift
//  Tourism
//
//  Created by としや on 2021/09/02.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original) // ナビゲーションリンク化したアイテムは自動で、
                                          // テキストはアクセントカラー(青とか)に、
                                          // 画像も青くなってしまうのを回避
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundColor(.primary)  // 同上
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: UserData().landmarks[0])
    }
}
