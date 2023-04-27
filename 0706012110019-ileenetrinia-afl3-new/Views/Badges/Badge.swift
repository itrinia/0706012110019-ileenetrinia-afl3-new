//
//  Badge.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct Badge: View {
    // pnggil logo mountain
    var badgeSymbols: some View {
        
        // bikin logo mountain yg rotate dg cara di for each biar ga declare satu2
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    // dicombine antara hexagon n mountain logo
    var body: some View {
        ZStack{
            
            // ini hexagonnya
            BadgeBackground()
            
            // ini munculin mountain logo
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit()
    }
}

// Preview combined logo
struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
