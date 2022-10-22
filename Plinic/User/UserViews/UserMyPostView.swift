//
//  UserMyPostView.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct UserMyPostView: View {
    
    var postTitle : String
    let data = Array(1...17).map { "목록 \($0)"}
    
    //화면을 그리드형식으로 꽉채워줌
    var columns = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    //    GridItem(.adaptive(minimum: 100)
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                VStack() {
                    Text("작성한 게시글")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .frame(width: 390, height: 20, alignment: .leading)
                        .padding(.leading, 10.0)
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(data, id: \.self) {i in
                                //VStack으로 도형추가
                                NavigationLink(destination: PostDetail(totalURL: "http://www.youtube.com/watch_videos?video_ids=K2MfpA_4EEs,2vSFVr5Unig,Vc5JNvIq22Q")){
                                    VStack() {
                                        Thumbnail(thumbnail: "defaultImg")
                                        Text("\(postTitle)")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                    }//VStack
                                    .padding([.trailing], 10)
                                } // NavigationLink
                            } // ForEach
                        } //LazyVGrid
                    } //ScrollView
                } //VStack
            } //VStack
        } //ZStack
    }
}



struct UserMyPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserMyPostView(postTitle: "게시글 제목")
    }
}