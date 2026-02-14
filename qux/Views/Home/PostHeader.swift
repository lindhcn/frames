//
//  FriendPostHeader.swift
//  qux
//
//  Created by linda han on 2026-02-08.
//
import SwiftUI

struct PostHeader: View {
    let post: Post
    
    var body: some View {
        ZStack{
            HStack(spacing: 12) {
                // album cover
                Image(post.albumCover)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                // Emoji avatar
                            // Username and song info
                VStack(alignment: .leading, spacing: 2) {
                                    HStack(spacing: 4) {
                        Text(post.songTitle)
                                            .font(.system(size: 15, weight: .light))
                        
                        Text("•")
                            .font(.system(size: 15, weight: .light))
                        Text(post.artist)
                            .font(.system(size: 15, weight: .ultraLight))
                    }
                    .foregroundColor(.primary)
                }
                
                Spacer()
                
                // Timestamp
                Text(post.formattedTime)
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.trailing)
            }
            
            .padding(.horizontal, 25)
            .padding(.vertical, 12)
            .background(.ultraThinMaterial, in: UnevenRoundedRectangle(
                topLeadingRadius: 0,
                bottomLeadingRadius: 10,
                bottomTrailingRadius: 10,
                topTrailingRadius: 0
            )
)
        }
    }
}

#Preview {
    PostHeader(post: Post.samplePosts[0])
        .padding()
        .background(Color(uiColor: .black))
}
