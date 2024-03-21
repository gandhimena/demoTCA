//
//  MarsRoverListView.swift
//  demoTCA
//
//  Created by gandhi mena on 19/3/24.
//

import ComposableArchitecture
import Kingfisher
import SwiftUI

struct MarsRoverViewView: View {
    
    @Bindable var store: StoreOf<MarsRoverListFeature>
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(store.photos) { photo in
                    KFImage(URL(string: photo.imgSrc)!)
                        .cacheMemoryOnly()
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            store.send(.getPhotos)
        }
    }
}

#Preview {
    MarsRoverViewView(store: Store(
        initialState: MarsRoverListFeature.State(photos: [.itemMock]), 
        reducer: { MarsRoverListFeature() }))
}

extension Photo {
    static var itemMock: Photo {
        Photo(
            id: 1,
            sol: 1,
            camera: PhotoCamera(
                id: 1,
                name: "name",
                roverID: 1,
                fullName: "full name"
            ),
            imgSrc: "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
            earthDate: "2015-05-30",
            rover: Rover(
                id: 5,
                name: "Curiosity",
                landingDate: "2012-08-06",
                launchDate: "2011-11-26",
                status: "active",
                maxSol: 4102,
                maxDate: "2024-02-19",
                totalPhotos: 695670,
                cameras: [CameraElement(name: "FHAZ", fullName: "Front Hazard Avoidance Camera")]))
    }
}
