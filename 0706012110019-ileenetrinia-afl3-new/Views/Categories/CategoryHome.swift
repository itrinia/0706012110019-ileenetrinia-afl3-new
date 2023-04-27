//
//  CategoryHome.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false
    
    var body: some View {
        NavigationView {
            List {
                //ini biar yg atas sndiri itu(gmbar pling gede) bisa geser"
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0)})
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                //                modelData.features[0].image
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(height: 200)
                //                    .clipped()
                //                //anjay keren
                //                //biar kliatan ada yg "title" pic nya gitu
                //                    .listRowInsets(EdgeInsets())
                //                //modifier pada List yang digunakan untuk menentukan jarak antara konten setiap baris dalam daftar (list). EdgeInsets() dipke buat mengatur tepi (margin) pada setiap sisi dari baris, seperti jarak dari atas, bawah, kiri, dan kanan. -> biar lebih ngezoom ajah biar ndak makan tempat banyak marginnya
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    //krn for each, yg di for each kan itu adalah ngepass category information dlm bentuk row
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            
            //pick a list style that better suits the content.
            .listStyle(.inset)
            .navigationTitle("Featured")
            
            //aji2 memunculkan logo profile di pojok kanan atas
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            
            // aji2 memunculkan ProfileHost klo showingProfile== true
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

// preview CategoryHome
struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

