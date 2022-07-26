//
//  RandomAPI.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/22.
//

import Foundation

final class RandomAPI: ObservableObject {
    
    private let randomBackgroundPath: String = "/plinic/random-background/"
    private let randomThumbnailPath: String = "/plinic/random-thumbnail/"
    private let networkService = NetworkService.init()
    
    /// 백그라운드에서 실행할 비디오를 랜덤으로 가져오는 함수
    func getBackgroundVideo(_ completion: @escaping ((Result<String, Error>) -> Void)) {
        networkService.request(path: randomBackgroundPath, method: .get, headers: nil) { result in
            switch result {
            case .success(let data):
                do {
                    let backgroundVideo = try JSONDecoder.init().decode(BackgroundVideo.self, from: data)
                    completion(.success(backgroundVideo.backgroundVideoURL))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /// 랜덤으로 썸네일 url 을 가져오는 함수
    func getThumbnail(_ completion: @escaping ((Result<String, Error>) -> Void)) {
        networkService.request(path: randomThumbnailPath, method: .get, headers: nil) { result in
            switch result {
            case .success(let data):
                do {
                    let thumbnail = try JSONDecoder.init().decode(RandomThumbnail.self, from: data)
                    completion(.success(thumbnail.imageUrl))
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
