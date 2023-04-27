//
//  _706012110019_ileenetrinia_afl3_newApp.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        //dibuat biar kliatan smuaa dan kek yg telah di atur di file sebelah
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            //dikasi kek label label di dlmnya category dan landmark list itu fungsinya buat bikin nvbar tp lgsg gitu
        }
    }
}

//display previewnya disini ini
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
