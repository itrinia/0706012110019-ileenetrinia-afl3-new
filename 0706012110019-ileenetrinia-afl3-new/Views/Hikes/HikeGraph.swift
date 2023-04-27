//
//  HikeGraph.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

// Animate when changing page
extension Animation {
    static func ripple(index: Int) -> Animation {
        //iiii kok lucu ditambahin ini jd tuing" gt
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
        // dikasi delay di kapsul2nya ini biar tuing2 nya makin lama
    }
}

struct HikeGraph: View {
    var hike: Hike
    var path: KeyPath<Hike.Observation, Range<Double>>
    
    // warna grafik nya
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }
    
    var body: some View {
        
        // extract observations from the hike data
        let data = hike.observations
        
        // determine the overall range for the data
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        
        // find the maximum magnitude
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        
        // determine the height ratio for the graph bars
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))
        
        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                // iterate thorugh the data and create a graph capsule for each observations
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                    // Call the animation
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

// return the range that spans all input range
func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

// returns the magnitude of a range
func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}


// preview hike graph
struct HikeGraph_Previews: PreviewProvider {
    static var hike = ModelData().hikes[0]
    
    static var previews: some View {
        Group {
            
            // preview of elevation graph
            HikeGraph(hike: hike, path: \.elevation)
                .frame(height: 200)
            
            // preview of heart rate graph
            HikeGraph(hike: hike, path: \.heartRate)
                .frame(height: 200)
            
            // preview of pace graph
            HikeGraph(hike: hike, path: \.pace)
                .frame(height: 200)
        }
    }
}
