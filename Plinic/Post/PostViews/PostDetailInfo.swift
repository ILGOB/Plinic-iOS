//
//  postDetailInfo.swift
//  Plinic
//
//  Created by MacBook Air on 2022/08/19.
//

import SwiftUI

struct PostDetailInfo: View {
    
    var profilePic: String // 유저의 프로필 사진
    var nickname : String // 유저의 닉네임
    var content: String // 게시글 내용
    let title: String //  게시글 제목
    let createdAt: String // 생성된 날짜
    let updatedAt: String // 수정된 날짜
    let tagSet: [String] // 태그 정보
    let genreName: String // 장르 정보
    
    @State var scrapperCount: Int = 0 // 스크랩 개수
    @State var likerCount: Int = 0 // 좋아요 개수
    @State var isLike: Bool = false // 좋아요 클릭 했는 지 안했는 지
    @State var isScrapped: Bool = false // 스크랩 클릭 했는 지 안했는 지
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image(profilePic)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Circle()
                            .stroke(Color.MainColor, lineWidth: 5))
                        .frame(maxWidth: 44, maxHeight: 44)
                        .background(Color.green)
                        .clipShape(Circle())
                        .padding(.leading, 5)
                    // 유저 프로필 사진
                    
                    Text("\(nickname)")
                        .font(.system(size: 17))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: 200, maxHeight: 42, alignment: .leading)
                        .padding(.leading, 5)
                    // 유저 닉네임
                    Button(action: {
                        self.isLike.toggle()
                        if isLike == true{
                            likerCount += 1
                        } else {
                            likerCount -= 1
                        }
                        // 클릭 했을 때 좋아요 기능 구현
                    }, label: {
                        Image(systemName: isLike ? "heart.fill" : "heart")
                            .font(.system(size: 31))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    // 좋아요 버튼
                    
                    Button(action: {
                        // 클릭 했을 때 공유기능 구현
                    }, label: {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 31))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    // 공유 버튼
                    
                    Button(action: {
                        self.isScrapped.toggle()
                        if isScrapped == true{
                            scrapperCount += 1
                        } else {
                            scrapperCount -= 1
                        }
                        // 내 보관함에 저장기능 구현
                    }, label: {
                        Image(systemName: isScrapped ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 31))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: 44, maxHeight: 44)
                    })
                    // 스크랩 버튼
                } // 상단의 게시글 작성자 정보
                .padding(.bottom, 5)
                
                HStack{
                    GenreTagView(genreName: genreName)
                    Spacer()
                    VStack{
                        Text("좋아요 \(likerCount) 개")
                        // 좋아요 개수 표시
                        Text("스크랩 \(scrapperCount) 개")
                        // 스크랩 개수 표시
                    } // VStack 좋아요, 스크랩 수
                    .frame(maxWidth: 150, alignment: .trailing)
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .semibold))
                }
                .padding(.top, 2)
                
                Text("\(title)")
                    .foregroundColor(Color.white)
                    .font(.system(size: 20, weight: .heavy))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 500, maxHeight: 44, alignment: .leading)
                // 게시글 제목
                HStack{
                    Text("\(content)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 15, weight: .bold))
//                        .multilineTextAlignment(.leading)
                        .frame(alignment: .topLeading)
                    // 게시글 내용
                    Spacer()
                }
                HStack{
                    ForEach(tagSet, id: \.self) { tag in
                        Text("#\(tag)")
                    }
                    .foregroundColor(Color.blue)
                    Spacer()
                }
                .padding(.top, 2)
                
                HStack{
                    
                    VStack(alignment: .trailing){
                        Text("생성일자: \(createdAt)")
                            .frame(maxWidth: 150, alignment: .leading)
                        Text("수정일자: \(updatedAt)")
                            .frame(maxWidth: 150, alignment: .leading)
                    } // VStack 생성일자, 수정일자
                    .foregroundColor(Color.white)
                    .font(.system(size: 15, weight: .semibold))
                    Spacer()
                }
                .padding(.top, 1)
            } // VStack
            
        } // ZStack
    }
}

struct PostDetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailInfo(profilePic: "random1", nickname: "Nickname", content: "This is content", title: "Title", createdAt: "2022.10.20", updatedAt: "2022.10.20", tagSet: ["1", "2", "3"], genreName: "Jazz")
    }
}