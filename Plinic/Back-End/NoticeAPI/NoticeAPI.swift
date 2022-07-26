//
//  NoticeAPI.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/23.
//

import Foundation

final class NoticeAPI: ObservableObject {
    
    private let recenctNoticeURL: String = "/plinic/notices/?recent=true"
    private let networkService = NetworkService.init()
    
    // MARK: - 가장 최근 공지사항(GET)
    func getRecentNotice(_ completion: @escaping ((Result<RecentNotice, Error>) -> Void)) {
        networkService.request(path: recenctNoticeURL) { result in
            switch result {
            case .success(let data):
                do {
                    let recentNotice = try JSONDecoder.init().decode(RecentNotice.self, from: data)
                    completion(.success(recentNotice))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
