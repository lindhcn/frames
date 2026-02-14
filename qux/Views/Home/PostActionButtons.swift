//
//  PostActionButtons.swift
//  qux
//
//  Created by linda han on 2026-02-07.
//

import SwiftUI

struct PostActionButtons: View {
    let post: Post
    let commentCount: Int
    @Binding var isLiked: Bool
    @State private var showComments = false

    
    var body: some View {
        HStack(spacing: 16) {
            // Expand/Collapse button (chevron down)
            Button {
                isLiked = !isLiked
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .font(.system(size: 14, weight: .ultraLight))
                    .foregroundColor(.primary)
                    .frame(width: 36, height: 36)
                    .background(Circle().fill(.thinMaterial).overlay(Circle().stroke(Color.white, lineWidth: 0.5)))
                    .shadow(radius: 2)
            }
            
            // Comments button
            Button {
                showComments = true
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "message")
                        .font(.system(size: 14, weight: .ultraLight))
                    if commentCount > 0 {
                        Text("\(commentCount)")
                            .font(.system(size: 12, weight: .light))
                    }
                }
                .foregroundColor(.primary)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    Capsule().fill(.thinMaterial).overlay(Capsule().stroke(Color.white, lineWidth: 0.5))
                        .shadow(radius: 2)
                )
                
            }
        }
        .sheet(isPresented: $showComments) {
            CommentsView(post: post)
        }
    }
}

#Preview {
    PostActionButtons(post: Post.samplePosts[0], commentCount: 12, isLiked: .constant(false))
        .padding()
        .background(Color.gray)
}
