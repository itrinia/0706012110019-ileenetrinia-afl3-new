//
//  LandmarkDetail.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    
    var body: some View{
        // Scroll View buat detail page nya disinii
        ScrollView {
            // show map view nya dulu
            MapView(coordinate: landmark.locationCoordinate)
            //ignoressafearea biarr naik n maksimal bgt mentok smpe atas (gada putih2 di atas yg deket poni nya ipon)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            
            CircleImage(image: landmark.image)
            //disetting lagi biar numpuk di atasnya map view
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // disini code biar bintang nya itu bisa fav/unfav (dipncet kuning atau ga mau dikuningin)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        //dikasi spacer biar dorong elemen2 nya ke atas biar rapi (ke tgh, tapi masih ada space poni ipon nya, jd kasi ignoressafearea)
        //                Spacer()
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// Display Preview of Landmark Detail
struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
