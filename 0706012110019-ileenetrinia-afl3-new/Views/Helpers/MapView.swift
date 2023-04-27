//
//  MapView.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // medium size zoom as default
    @AppStorage("MapView.zoom")
    private var zoom: Zoom = .medium
    
    // characterize zoom level
    enum Zoom: String, CaseIterable, Identifiable {
        case near = "Near"
        case medium = "Medium"
        case far = "Far"
        
        var id: Zoom {
            return self
        }
    }
    
    // gnti longitude & latitude delta trgntung ama zoom level nya yg di atas ini
    var delta: CLLocationDegrees {
        switch zoom {
        case .near: return 0.02
        case .medium: return 0.2
        case .far: return 2
        }
    }
    
    var body: some View {
        Map(coordinateRegion: .constant(region))
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        )
    }
}

// preview Map Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.116_868))
    }
}
