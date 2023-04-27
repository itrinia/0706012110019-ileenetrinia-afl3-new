//
//  GraphCapsule.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct GraphCapsule: View, Equatable {
    var index: Int
    var color: Color
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>
    
    // aji2 menghitung tinggi rasio capsulenya
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    
    // aji2 menghitung tinggi offset rasio capsulenya
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }
    
    var body: some View {
        // bikin persegi yang ala2 rounded
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

// preview GraphCapsule
struct GraphCapsule_Previews: PreviewProvider {
    static var previews: some View {
        GraphCapsule(
            index: 0,
            color: .blue,
            height: 150,
            range: 10..<50,
            overallRange: 0..<100)
    }
}
