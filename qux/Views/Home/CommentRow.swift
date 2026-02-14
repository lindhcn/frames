//
//  CommentRow.swift
//  qux
//
//  Created by linda han on 2026-02-10.
//

import SwiftUI

struct CommentRow: View {
    let comment: Comment
    @State private var isLiked: Bool
    
    init(comment: Comment) {
        self.comment = comment
        _isLiked = State(initialValue: comment.isLiked)
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            HStack(alignment: .top, spacing: 12) {
                // User emoji avatar
                Text(comment.profilePic)
                    .font(.system(size: 28))
                    .frame(width: 40, height: 40)
                    .background(Circle().fill(Color(uiColor: .systemGray6)))
                
                // Comment content
                VStack(alignment: .leading, spacing: 4) {
                    // Username and time
                    HStack(spacing: 8) {
                        Text(comment.username)
                            .font(.system(size: 14, weight: .semibold))
                        
                        Text(comment.timeAgo)
                            .font(.system(size: 12))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                    }
                    
                    // Comment text
                    Text(comment.text)
                        .font(.system(size: 14))
                        .fixedSize(horizontal: false, vertical: true)
                    }
            }
            Button {
                withAnimation(.spring(response: 0.3)) {
                    isLiked.toggle()
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .font(.system(size: 12))
                    if comment.likes > 0 {
                        Text("\(comment.likes + (isLiked ? 1 : 0))")
                            .font(.system(size: 12, weight: .medium))
                    }
                }
                .foregroundColor(isLiked ? .pink : .secondary)
            }
        }
    }
}

#Preview {
    CommentRow(comment: Comment.sampleComments[0])
        .padding()
}
