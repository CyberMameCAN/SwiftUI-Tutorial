//
//  CategoryRow.swift
//  Tourism
//
//  Created by としや on 2021/09/02.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String    // カテゴリ名
    var items: [Landmark]       // カテゴリに属する観光地リスト
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.headline)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                                CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = UserData().landmarks     // プレビューでは観光地データを直接使用
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,   // 仮で先頭の観光地カテゴリ名
            items: Array(landmarks.prefix(5)))  // 仮で先頭から３要素だけ
    }
}
