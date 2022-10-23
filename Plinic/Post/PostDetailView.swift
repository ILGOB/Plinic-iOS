//
//  PostDetailView.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetailView: View {
    
    @StateObject var postAPI: PostAPI = PostAPI()
    @State var postDetil : PostDetail = PostDetail.creatEmpty()
    @State var totalURL: String
    @State var id : Int
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                ScrollView{
                    PostDetailInfoView(profilePic: "random1", nickname: postDetil.author, content: postDetil.content, title: postDetil.title, createdAt: postDetil.createdAt, updatedAt: postDetil.updatedAt, tagSet: postDetil.tagSet, genreName: postDetil.plInfo.genreName, id: postDetil.id)
                    Spacer()
                } // ScrollView
                .frame(maxHeight: 200)
                
                PlaylistWebView(playlistURL: "\(postDetil.plInfo.totalURL)")
                    .frame(minHeight: 400)
            } // VStack
            .onAppear(){
                postAPI.getPostDetail(id: id){ result in
                    switch result {
                    case .success(let success):
                        self.postDetil = success
                        print("PostDetailView의 onAppear",postDetil)
                    case .failure(let failure):
                        _ = failure
                    }
                }
            }
        } // ZStack
    }
}


struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetailView(totalURL: "http://www.youtube.com/watch_videos?video_ids=K2MfpA_4EEs,2vSFVr5Unig,Vc5JNvIq22Q", id: 30)
        }
    }
}
