//
//  UserInfo.swift
//  Plinic
//
//  Created by Jaewon on 2022/10/23.
//

import Foundation

struct UserInfo: Codable {
    
    let uuid = UUID()
    
    let nickName: String
    let profileImageUrl: String?
    
    let publicPlaylists: [briefPlaylistInfo]
    let privatePlaylists: [briefPlaylistInfo]
    let scrappedPlaylists: [briefPlaylistInfo]
    
    let writtenPosts: [WrittenPostInfo]
    
    let favoriteGenres: [String]
    
    enum CodingKeys: String, CodingKey {
        case nickName = "nickname"
        case profileImageUrl = "profile_img_url"
        
        case publicPlaylists = "public_playlists"
        case privatePlaylists = "private_playlists"
        case scrappedPlaylists = "scrapped_playlists"
        
        case writtenPosts = "written_posts"
        
        case favoriteGenres = "favorite_genres"
    }
    
    static func createEmpty() -> Self {
        return .init(
            nickName: "",
            profileImageUrl: "",
            publicPlaylists: [],
            privatePlaylists: [],
            scrappedPlaylists: [],
            writtenPosts: [],
            favoriteGenres: []
        )
    }
    
    static func createMock() -> Self {
        return .init(
            nickName: "Lami",
            profileImageUrl: "http://35.79.181.245:8000/media/profiles/2022/10/24/lami_profile.jpg",
            publicPlaylists: [
                .init(title: "공개 플레이 리스트1", thumbnailUrl: "defaultImg", id: 1),
                .init(title: "공개 플레이 리스트2", thumbnailUrl: "defaultImg", id: 2),
                .init(title: "공개 플레이 리스트3", thumbnailUrl: "defaultImg", id: 3)
            ],
            privatePlaylists: [
                .init(title: "비공개 플레이 리스트1", thumbnailUrl: "defaultImg", id: 1),
                .init(title: "비공개 플레이 리스트2", thumbnailUrl: "defaultImg", id: 2),
                .init(title: "비공개 플레이 리스트3", thumbnailUrl: "defaultImg", id: 3)
            ],
            scrappedPlaylists: [
                .init(title: "스크랩한 플레이 리스트1", thumbnailUrl: "defaultImg", id: 1),
                .init(title: "스크랩한 플레이 리스트2", thumbnailUrl: "defaultImg", id: 2),
                .init(title: "스크랩한 플레이 리스트3", thumbnailUrl: "defaultImg", id: 3),
            ],
            writtenPosts: [
                .init(id: 1, title: "내가 작성한 포스트1", content: "내가 작성한 포스트 내용1"),
                .init(id: 2, title: "내가 작성한 포스트2", content: "내가 작성한 포스트 내용2"),
                .init(id: 3, title: "내가 작성한 포스트3", content: "내가 작성한 포스트 내용3")
            ],
            favoriteGenres: [
                "장르111",
                "장르222",
                "장르333"
            ]
        )
    }
}

struct briefPlaylistInfo: Codable {
    
    let uuid = UUID()
    
    let title: String
    let thumbnailUrl: String?
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case thumbnailUrl = "thumbnail"
        case id
    }
}

struct WrittenPostInfo: Codable {
    
    let uuid = UUID()
    
    let id: Int
    let title: String
    let content: String
    let thumbnailUrl: String = "defaultImg"
    
    // MARK: CodingKeys?
}
