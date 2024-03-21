//
//  MarsRoverListFeature.swift
//  demoTCA
//
//  Created by gandhi mena on 19/3/24.
//

import ComposableArchitecture

@Reducer
struct MarsRoverListFeature {
    
    @Dependency(\.marsRoverService) var marsRoverService
    
    @ObservableState
    struct State: Equatable {
        var photos: [Photo] = []
        var error: String = ""
    }
    
    enum Action: Equatable {
        case getPhotos
        case getPhotosResponse(Result<MarsRoverPhotosResponse, NetworkErrors>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .getPhotos:
                return .run { send in
                    await send(.getPhotosResponse(marsRoverService.getMarsRoverPhotos(.fhaz)))
                }
            case let .getPhotosResponse(.success(response)):
                state.photos = response.photos
                state.photos.forEach {
                    print($0.camera.fullName)
                }
                return .none
            case let .getPhotosResponse(.failure(error)):
                state .error = error.localizedDescription
                return .none
            }
        }
    }
}
