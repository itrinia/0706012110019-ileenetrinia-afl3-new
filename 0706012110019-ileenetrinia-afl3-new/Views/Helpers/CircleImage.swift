//
//  CircleImage.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            // biarr lingkarann imagenya
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

// show circle image previewnya
struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("Turtlerock"))
    }
}
