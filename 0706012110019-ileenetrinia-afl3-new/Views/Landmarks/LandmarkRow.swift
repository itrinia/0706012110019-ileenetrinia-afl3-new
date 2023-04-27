//
//  LandmarkRow.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
            // ini bwh code buat image nya biar resizable
                .resizable()
                .frame(width: 50, height: 50)
            //cornerradius ini juga buat mac nya
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(landmark.name)
                // buat ngebold textnya
                    .bold()
                Text(landmark.park)
                    .font(.caption)
                // gnti foreground color jd ke secondary color
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                //biar warnanya kuningg bintangnya klo misalnya landmark nya jadi fav
                    .foregroundColor(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

// Preview LandMark Row
struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        Group{
            // preview landmark row di index 0 n 1
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
