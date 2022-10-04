//
//  postDetail.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetail: View {
    
    var playlistURL : String
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader{ geo in
                
            }
            VStack{
                
                ScrollView{
                    PostDetailInfo(profileImg: "random1", userName : "userName", postContext : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. cursus dolor et tortor malesuada, nec vehicula dolor hendrerit. Vivamus interdum nisl ut dolor placerat, viverra porttitor metus commodo. Cras molestie dui nec lacinia luctus. Suspendisse potenti. Quisque sit amet dui vitae ipsum vestibulums. ", postName: "게시글 제목", heartCnt : "200000")
                    Spacer()
                } // ScrollView
                .frame(maxHeight: 200)
                
                PlaylistWebView(playlistURL: "\(playlistURL)")
                    .frame(minHeight: 400)
                
            } // VStack
        } // ZStack
    }
}


struct PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostDetail(playlistURL: "http://www.youtube.com/watch_videos?video_ids=K2MfpA_4EEs,2vSFVr5Unig,Vc5JNvIq22Q")
            PostDetail(playlistURL: "http://www.youtube.com/watch_videos?video_ids=K2MfpA_4EEs,2vSFVr5Unig,Vc5JNvIq22Q")
                .previewDevice("iPhone 8")
        }
    }
}
