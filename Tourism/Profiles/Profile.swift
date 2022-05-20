//
//  Profile.swift
//  Tourism
//
//  Created by としや on 2021/09/02.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter // 季節ごとの写真
    var goalDate = Date()
    
    // defaultはswich-case構文で予約された単語なので、通常変数名などでは使えない
    // もし変数名としてどうしても扱いたい場合は、``で囲む
    static let `default` = Profile(username: "CyberMameCAN")
                                                // シングルトン(staticで定義)　デザインパターン(インスタンスを１つしか持たない構造体やクラス)
                                                // 自分自身の構造体のインスタンスを内部でプロパティとして保持
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
}
