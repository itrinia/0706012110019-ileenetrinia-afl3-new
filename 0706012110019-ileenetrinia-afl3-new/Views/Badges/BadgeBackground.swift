//
//  BadgeBackground.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

struct BadgeBackground: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // tambahin starting point buat path
                var width: CGFloat = min(geometry.size.width, geometry.size.height)
                let height = width
                let xScale : CGFloat = 0.832
                let xOffset = (width * (1.0 - xScale)) / 2.0
                width *= xScale
                // buat new path dmn path nya akan dipinda
                path.move(
                    to: CGPoint(
                        // itung x sbg 95%rectangle + offset
                        x: width * 0.95 + xOffset,
                        // itung y sbg 20%height + HexagonParameters.adjustment
                        y: height * (0.20 + HexagonParameters.adjustment)
                    )
                )
                
                // looping each segment yg ada di dlmnya HexagonParameters.segment array
                HexagonParameters.segments.forEach { segment in
                    // add a straight line to the current point in path
                    path.addLine(
                        to: CGPoint(
                            // itung x coordinate dg mengkalikan width nya dg segment's line.x trs dtambah dg xOffset
                            x: width * segment.line.x + xOffset,
                            // itung y coordinate dg mengkalikan height dg segment's line.y property
                            y: height * segment.line.y
                        )
                    )
                    
                    // tambahin quadratic curve ke current point in path
                    path.addQuadCurve(
                        to: CGPoint(
                            // itung x coordinate dg cara width*segment's curve.x property+xOffset
                            x: width * segment.curve.x + xOffset,
                            // calculate y coordinate dg cara height * segment's curve.y property
                            y: height * segment.curve.y
                        ),
                        control: CGPoint(
                            // itung x coordinate: width * segment's control.x property + xOffset
                            x: width * segment.control.x + xOffset,
                            // itung y coordinate: height * segment's control.y property
                            y: height * segment.control.y
                        )
                    )
                }
            }
            // hexAgon background
            .fill(.linearGradient(
                Gradient(colors: [Self.gradientStart, Self.gradientEnd]),
                startPoint: UnitPoint(x: 0.5, y : 0),
                endPoint: UnitPoint(x: 0.5, y: 0.6)
            ))
        }
        .aspectRatio(1, contentMode: .fit)
    }
    
    static let gradientStart = Color(red: 239.0 / 255, green: 120.0 / 255, blue: 221.0 / 255)
    
    static let gradientEnd = Color(red: 239.0 / 255, green: 172.0 / 255, blue: 120.0 / 255)
}

// Preview Hexagon
struct BadgeBackground_Previews: PreviewProvider {
    static var previews: some View {
        BadgeBackground()
    }
}
