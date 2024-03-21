//
//  MarsRoverService.swift
//  demoTCA
//
//  Created by gandhi mena on 18/3/24.
//

import Foundation
import Dependencies

struct MarsRoverService {
    var getMarsRoverPhotos: (_ cameraType: CameraType) async -> Result<MarsRoverPhotosResponse, NetworkErrors>
}

extension MarsRoverService: DependencyKey {
    static let liveValue = Self(getMarsRoverPhotos: { cameraType in
        return await ApiClient().request(.marsRoverPhotos(cameraType: cameraType))
    })
    static let testValue = Self(getMarsRoverPhotos: { cameraType in
        return await ApiClient().request(.marsRoverPhotos(cameraType: cameraType))
    })
}

extension DependencyValues {
    var marsRoverService: MarsRoverService {
        get { self[MarsRoverService.self] }
        set { self[MarsRoverService.self] = newValue }
    }
}
