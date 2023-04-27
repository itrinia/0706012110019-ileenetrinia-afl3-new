//
//  LandmarkList.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    @State private var filter = FilterCategory.all
    @State private var selectedLandmark: Landmark?
    
    // describe filter states
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        var id: FilterCategory { self }
    }
    
    
    // Filter Landmark Favorites
    var filteredLandmarks: [Landmark] {
        //modelData.landmarks krn mau manggil landmarks yg di model dat
        // klo ga pke modelData, bintangnya ga keganti klo misal mau unstarred
        modelData.landmarks.filter{landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }


    var body: some View {
        //kyknya ngerepeat sesuai id yg disetting? harusnya yes
        // jd klo isinya itu ada parameter landmark [0][1] brti repeat 0,1 aja tp berkali2
        // ^berlaku klo paramater id nya exist, semua dimunculin
        //        List(landmarks, id: \.id) { landmark in
        //            LandmarkRow(landmark: landmarks[0])
        //            LandmarkRow(landmark: landmarks[1])
        NavigationView {
            List(selection: $selectedLandmark) {
                // Show all the landmarks
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle(title)
            //bwh ini buat klo desktop
            .frame(minWidth: 300)
            .toolbar {
                // toolbar item for filter
                ToolbarItem {
                    Menu {
                        // create picker to pick category filter
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        // If toggle is on, only show favorites
                        Toggle(isOn: $showFavoritesOnly) {
                            Text("Favorites only")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
            
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

// Display Preview Landmark List Preview
struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
        //            LandmarkList()
        //                .previewDevice(PreviewDevice(rawValue: deviceName))
        //                .previewDisplayName(deviceName)
        LandmarkList()
            .environmentObject(ModelData())
    }
}

