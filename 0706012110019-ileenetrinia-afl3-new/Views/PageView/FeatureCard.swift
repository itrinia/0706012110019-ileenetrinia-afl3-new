//
//  FeatureCard.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        // image buat card nya
        landmark.featureImage?
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                //text overlay biar dia bisa numpuk di atasnya gambar
                TextOverlay(landmark:landmark)
            }
    }
}

//trs text overlay nya diatur disini
struct TextOverlay: View {
    var landmark: Landmark
    
    // LinearGradient for the background of a view
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

// preview FeatureCard nya disini
struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().features[0])
    }
}

