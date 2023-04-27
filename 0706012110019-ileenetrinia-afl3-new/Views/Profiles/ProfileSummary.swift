//
//  ProfileSummary.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct ProfileSummary: View {
    // access data from ModelData
    @EnvironmentObject var modelData : ModelData
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    // horizontal scroll
                    ScrollView(.horizontal) {
                        // list of badges
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()
                
                
                //aji" pemanggilan recent hikes yang ada grafik tuing2nya itu, jd dipanggil hikeview dulu (nama filenya) trs modeldata nya
                //tiba2 duarrr kepanggil deh
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

// Show preview of ProfileSummary
struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
            .environmentObject(ModelData())
    }
}
