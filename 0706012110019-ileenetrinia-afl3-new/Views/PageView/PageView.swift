//
//  PageView.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // ini buat manggil PageViewController to display pages nyaa
            PageViewController(pages: pages, currentPage: $currentPage)
            // manggil PageControl buat nunjukin current page number and ngebolehin user buat navigate antar pages
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

// preview PageView
struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
                   .aspectRatio(3 / 2, contentMode: .fit)
    }
}

