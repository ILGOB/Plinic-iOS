//
//  userMyPlaylist.swift
//  Plinic
//
//  Created by 유경덕 on 2022/08/12.
//

import SwiftUI

struct userMyPlaylist: View {
    
    var playlistTitle : String
    let openPlaylist = Array(1...12)
    let unOpenPlaylist = Array(1...17)
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            GeometryReader{ geo in
                VStack {
                    VStack() {
                        Text("공개된 플레이리스트")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .frame(width: geo.size.width, height: geo.size.height * 0.04, alignment: .leading)
                        
                        ScrollView(.horizontal) {
                            HStack() {
                                ForEach(openPlaylist, id: \.self) {i in
                                    VStack() {
                                        Thumbnail(thumbnail: "defaultImg")
                                            .padding(.bottom, 5)
                                        Text("\(playlistTitle)")
                                            .foregroundColor(Color.white)
                                            .fontWeight(.bold)
                                            .font(.system(size: 15))
                                    }//VStack
                                    .frame(maxWidth: 180, maxHeight: 200)
                                }
                                .padding(.top, 5)
                            } // ScrollView
                            .padding([.top, .leading, .bottom], 5)
                        }//VStack
                        .padding(.leading, 10.0)
                        //                    .padding(.top, 10)
                        
                        VStack() {
                            Text("비공개된 플레이리스트")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .frame(width: geo.size.width, height: geo.size.height * 0.04, alignment: .leading)
                            
                            ScrollView(.horizontal) {
                                HStack() {
                                    ForEach(unOpenPlaylist, id: \.self) {i in
                                        VStack() {
                                            Thumbnail(thumbnail: "defaultImg")
                                                .padding(.bottom, 5)
                                            Text("\(playlistTitle)")
                                                .foregroundColor(Color.white)
                                                .fontWeight(.bold)
                                                .font(.system(size: 15))
                                        }//VStack
                                        .frame(maxWidth: 180, maxHeight: 200)
                                    } //ForEach
                                    .padding(.top, 5)
                                } // ScrollView
                                .padding([.top, .leading, .bottom], 5)
                            }//VStack
                            .padding(.leading, 10.0)
                            //                    .padding(.top, 20.0)
                        }
                    }
                    
                }// ZStack
            }
        }
    }
}
struct userMyPlaylist_Previews: PreviewProvider {
    static var previews: some View {
        userMyPlaylist(playlistTitle: "플레이리스트 제목")
    }
}