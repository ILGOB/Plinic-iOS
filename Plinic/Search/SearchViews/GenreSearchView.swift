//
//  GenreSearchView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/24.
//

import SwiftUI

struct GenreSearchView: View {
    
    @StateObject var postAPI: PostAPI = PostAPI()
    @State var postData : PostList = PostList.create()
    @State var postList: [Post] = [Post.creatEmpty()]
    let genreName: String
    
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(postList, id: \.uuid) { post in
                    PostView(
                        profilePic: post.author.profilePic ?? "profileDefault",
                        nickname: post.author.nickname,
                        thumbnailImgURL: post.plInfo.thumbnailImgURL ?? "defaultImg",
                        content: post.content,
                        title: post.title,
                        postId: post.id
                    )
                    .onAppear() {
                        if let last = self.postList.last,
                           last.id == post.id,
                           post.id >= 0,
                           postList.count < postData.count
                        {
                            postAPI.getPostList(nextURL: postData.next) { result in
                                switch result {
                                case .success(let postList):
                                    self.postData = postList
                                    self.postList.append(contentsOf: postList.results)
                                case .failure(let failure):
                                    _ = failure
                                }
                            }
                        }
                    } // PostView
                } // ForEach
            }
        }
        .navigationTitle(genreName)
        .navigationBarTitleDisplayMode(.inline)
        .onLoad() {
            postAPI.getPostList(nextURL: self.postData.next) { result in
                switch result {
                case .success(let success):
                    self.postList = success.results
                    self.postData = success
                case .failure(let failure):
                    _ = failure
                }
                
            }
        }
    }
}

struct GenreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSearchView(
            postData: .createMock(),
            postList: [
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock(),
                .createMock()
            ],
            genreName: "acoustic"
        )
    }
}
