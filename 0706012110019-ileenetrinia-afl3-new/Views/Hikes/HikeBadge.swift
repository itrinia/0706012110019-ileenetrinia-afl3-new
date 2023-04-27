//
//  HikeBadge.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

//menyusun badges dari Drawing Paths and Shapes dg beberapa teks deskriptif ttg hike
//The badge is just a graphic, so the text in HikeBadge along with the accessibilityLabel(_:) modifier make the meaning of the badge clearer to other users.
//The badge’s drawing logic produces a result that depends on the size of the frame in which it renders.

struct HikeBadge: View {
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            // calls the badge and displays it
            Badge()
            //To ensure the desired appearance, render in a frame of 300 x 300 points.
                .frame(width: 300, height: 300)
            //To get the desired size for the final graphic, then scale the rendered result and place it in a comparably smaller frame.
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}

// preview HikeBadge
struct HikeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikeBadge(name: "Preview Testing")
    }
}
