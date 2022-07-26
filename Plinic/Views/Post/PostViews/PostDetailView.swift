//
//  PostDetailView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetailView: View {
    
    @StateObject var postAPI: PostAPI = PostAPI()
    @StateObject var playlistAPI: PlaylistAPI = .init()
    
    @State var postDetail : PostDetail = PostDetail.creatEmpty()
    @State var postId: Int
    var profileImageUrl: String?
    
    var youtubeUrl: String = YoutubeLinkStorage.randomUrl
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    PostDetailInfoView(
                        postDetail: $postDetail,
                        profilePic: profileImageUrl
                    )
                    Spacer()
                } // ScrollView
                .frame(maxHeight: 200)
                
                WebView(requestURL: youtubeUrl)
                    .frame(minHeight: 400)
            } // VStack
            .onAppear(){
                postAPI.getPostDetail(id: postId) { result in
                    switch result {
                    case .success(let postDetail):
                        self.postDetail = postDetail
                        print("PostDetailView의 onAppear", postDetail)
                    case .failure(let failure):
                        _ = failure
                        print("Failure")
                    }
                }
            }
        } // ZStack
    }
}


struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetailView(
                postDetail: .createMock(),
                postId: 1,
                profileImageUrl: "random1"
            )
        }
    }
}
