//
//  ProfileEditor.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    // bikin range tgl yg dmulai 1 th sblm user's goalDate dan ends 1 year stlh user's goalDate
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            //toggle yg on off
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            //memilih emoji seasonal photo - kok lucu plzz
            // ini pke for each biar gausah describe satu2 jd lgsg for each datanya season itu
            VStack(alignment: .leading, spacing: 20) {
                Text("Seasonal Photo").bold()
                // provide choice for user to pick
                Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            //tanggal tp hrs ada var datarange kyk di atas
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date").bold()
            }
        }
    }
}

// preview ProfileEditor
struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}

