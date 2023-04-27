//
//  HexagonParameters.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
    //pke nested struct krn di dalam structnya hexagon itu ada beberapa elemen penting kek segment dan itu berguna banget buat klo tipe data e kompleks jd di dlm kelompok ada anggota yg perlu dideskripsiin data e
    struct Segment {
        // ini define segment structure buat hold 3 points yg ngerepresent 1 side of hexagon
        let line: CGPoint
        let curve: CGPoint
        let control: CGPoint
    }
    static let adjustment: CGFloat = 0.085
    
    //pke array buat hold segments nya
    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05),
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
