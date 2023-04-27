//
//  CategoryRow.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//
import SwiftUI


struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            //scrollview nya mulai sini yes2
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 0) {
                    //pke for each biar lgsg tak tek tak tek muncul smua ga perlu define satu2
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

// Show preview of CategoryRow
struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmarks[0].category.rawValue,
            items: Array(landmarks.prefix(4))
        )
    }
}
