//
//  GenreSearchView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/10/24.
//

import SwiftUI

struct PostSearchView: View {
    
    @StateObject var postAPI: PostAPI = PostAPI()
    @State var postData : PostList = PostList.create()
    @State var postList: [Post] = [Post.createEmpty()]
    let navigationTitle: String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            ScrollView{
                LazyVStack{
                    ForEach(postList, id: \.uuid) { post in
                        PostView(postInfo: post)
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
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .onLoad() {
                postAPI.getPostList() { result in
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
}

struct GenreSearchView_Previews: PreviewProvider {
    static var previews: some View {
        PostSearchView(
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
            navigationTitle: "acoustic"
        )
    }
}
