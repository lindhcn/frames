//
//  FriendsPostView.swift
//  qux
//
//  Created by linda han on 2026-02-08.
//

import SwiftUI

extension Date {
    func timeAgoDisplay() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full  // "2 hours ago"
        // or .abbreviated for "2 hr ago"
        // or .short for "2h ago"
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}

struct FriendsPostView: View {
    let post: Post
    @State private var isLiked = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 8) {
                Image(post.profilePic)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                Text(post.username)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.primary)
                Spacer()
                Text(post.timeStamp.timeAgoDisplay())
                    .font(.system(size: 12, weight: .light))
            } .padding(.horizontal, 24)
                .padding(.horizontal, 12)
        }
        
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
    FriendsPostView(post: Post.samplePosts[0])
}
