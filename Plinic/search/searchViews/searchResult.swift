//
//  searchResult.swift
//  Plinic
//
//  Created by 유경덕 on 2022/09/07.
//

import SwiftUI

struct searchResult: View {
    
    var playlistTitle : String
    
    var body: some View {
        ZStack  {
            Color.black
                .ignoresSafeArea()
            VStack(spacing:0) {
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("유저")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10.0)
                            
                            Spacer()
                            
                            Button(action: {
                                //클릭시 검색상세페이지로 넘어감
                            }, label: {
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                                
                            })
                            .padding(.trailing, 15.0)
                        }//HStack
                        
                        Rectangle()
                                 .fill(Color.white)
                                 .frame(width: 200, height: 1)
                                 .padding(.top, 10.0)
                                 .padding(.leading, 10.0)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(width: 390, height: 20, alignment: .leading)
                            .padding([.top, .leading], 10.0)
                        HStack(alignment: .bottom){
                            userTopResult()
                            userResult(profileImg: "random1", nickName: "ddddd")
                                .padding(.leading, 10.0)
                        }//HStack
                        .padding()
                        .padding(.top, 10.0)
                    }//VStack
                    .padding(.leading, 10.0)
                }//HStack
                
                HStack {
                    VStack(alignment:.leading, spacing: 0){
                        HStack(alignment: .bottom){
                            Text("게시글")
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .font(.system(size: 25))
                                .padding(.leading, 10.0)
                            
                            Spacer()
                            
                            Button(action: {
                                //클릭시 검색상세페이지로 넘어감
                            }, label: {
                                Text("검색결과 더보기 ->")
                                    .fontWeight(.bold)
                                    .font(.system(size: 18))
                                    .foregroundColor(Color(#colorLiteral(red: 0.5, green: 0.93, blue: 0.6, alpha: 1)))
                                
                            })
                            .padding(.trailing, 15.0)
                        }//HStack
                        Rectangle()
                                 .fill(Color.white)
                                 .frame(width: 200, height: 1)
                                 .padding(.top, 10.0)
                                 .padding(.leading, 10.0)
                        Text("상위 검색결과")
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .font(.system(size: 15))
                            .frame(width: 390, height: 20, alignment: .leading)
                            .padding([.top, .leading], 10.0)
                        ScrollView(.horizontal) {
                            HStack(spacing:15) {
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(playlistTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(playlistTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                                VStack(spacing:0) {
                                    Thumbnail(thumbnail: "defaultImg")
                                    Text("\(playlistTitle)")
                                        .foregroundColor(Color.white)
                                        .fontWeight(.bold)
                                        .font(.system(size: 15))
                                }//VStack
                            }//HSTack
                        }
                        .frame(width: 380, height: 200, alignment: .leading)
                        .padding(.leading, 10.0)
                        .padding(.top, 20.0)
                    }//VStack
                    .padding(.leading, 10.0)
                }//HStack
                .padding(.top, 15.0)
            }//VStack
        }//ZStack
    }
}

struct searchResult_Previews: PreviewProvider {
    static var previews: some View {
        searchResult(playlistTitle: "dpdpdpdpd")
    }
}
   

