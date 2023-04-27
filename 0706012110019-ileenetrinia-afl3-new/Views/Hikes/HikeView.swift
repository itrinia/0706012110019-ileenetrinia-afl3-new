//
//  HikeView.swift
//  0706012110019-ileenetrinia-afl3-new
//
//  Created by MacBook Pro on 27/04/23.
//

import SwiftUI

// extention for move and fade animation
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        //        AnyTransition.move(edge: .trailing)
        // trailing ini animasi yg ngehasilin efek gerak dari kanan ke kiri pada view
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false
    
    var body: some View {
        VStack {
            HStack {
                // displays the hike graph
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)
                
                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }
                
                Spacer()
                
                Button {
                    //  ini klo misal mau buat ada kek transisi dg durasi ttt jd pke yg ease in out duration nya diatur
                    //withAnimation(.easeInOut(duration: 4)) {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5: 1)
                        .padding()
                }
            }
            
            if showDetail {
                HikeDetail(hike: hike)
                // Slide transition
                    .transition(.slide)
            }
        }
    }
}

// preview HikeView
struct HikeView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HikeView(hike: ModelData().hikes[0])
                .padding()
            Spacer()
        }
    }
}
