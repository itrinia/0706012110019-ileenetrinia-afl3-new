//
//  HikeDetail.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct HikeDetail: View {
    let hike: Hike
    @State var dataToShow = \Hike.Observation.elevation
    
    // Buttons buat change graph nya
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]
    
    var body: some View {
        VStack {
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)
            
            HStack(spacing: 25) {
                // Call each buttons
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundColor(value.1 == dataToShow
                                             ? .gray
                                             : .accentColor)
                        // Show no animation
                            .animation(nil)
                    }
                }
            }
        }
    }
}

// Preview HikeDetail
struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: ModelData().hikes[0])
    }
}
