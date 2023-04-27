//
//  ProfileHost.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

//The ProfileHost view will host both a static, summary view of profile information and an edit mode.

struct ProfileHost: View {
    // buat toggle antara edit mode n display mode
    @Environment(\.editMode) var editMode
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20 ) {
            HStack {
                // display cancel button if edit mode is active
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                EditButton()
            }
            
            
            if editMode?.wrappedValue == .inactive {
                // munculin ProfileSummary JIKA edit mode nya ga aktif
                ProfileSummary(profile: modelData.profile)
            } else {
                // munculin ProfileSummary JIKA edit mode nya aktif
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

// preview ProfileHost
struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
