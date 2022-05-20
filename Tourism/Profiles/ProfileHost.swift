//
//  ProfileHost.swift
//  Tourism
//
//  Created by としや on 2021/09/02.
//

import SwiftUI

struct ProfileHost: View {
    
    @Environment(\.editMode) var editMode   // 編集モードか否かを保持
    @EnvironmentObject var userData: UserData
    @State private var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = userData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive { // アクティブで無い時
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear() {
                        // Done
                        draftProfile = userData.profile
                    }
                    .onDisappear() {
                        // Cancel
                        userData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(UserData())
    }
}
