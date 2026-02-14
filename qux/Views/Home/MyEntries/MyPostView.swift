//
//  MyPostView.swift
//  qux
//
//  Created by linda han on 2026-02-07.
//

import SwiftUI

struct MyPostView: View {
    let post: Post
    @State private var isLiked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header overlaid on top of image
            
            //.background(Color.primary.colorInvert()
            //.opacity(0.5))
            //.cornerRadius(20)
            //.background(Color(uiColor: .systemGray6))
            ZStack(alignment: .bottomLeading) {
                Image(post.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 400)
                    .clipped()
                
                // Action buttons at bottom right
                PostActionButtons(
                    post: Post.samplePosts[0],
                    commentCount: post.commentCount,
                    isLiked: $isLiked
                )
                .padding(.leading, 20)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            PostHeader(post: post)
            
        }
        
    }
}

#Preview {
    MyPostView(post: Post.samplePosts[0])
}
