//
//  CommentsView.swift
//  qux
//
//  Created by linda han on 2026-02-09.
//

import SwiftUI

struct CommentsView: View {
    @Environment(\.dismiss) var dismiss
    let post: Post
    @State private var comments: [Comment] = Comment.sampleComments
    @State private var newCommentText = ""
    @FocusState private var isTextFieldFocused: Bool
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                RoundedRectangle(cornerRadius: 3)
                                .fill(Color.secondary.opacity(0.3))
                                .frame(width: 40, height: 5)
                                .padding(.top, 8)
                                .padding(.bottom, 12)
                /*HStack {
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.secondary)
                            .frame(width: 30, height: 30)
                            .background(Circle().fill(Color(uiColor: .systemGray5)))
                    }
                }
                .padding()
                .background(Color(uiColor: .systemBackground))*/
                                
                // Comments List
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(comments) { comment in
                            CommentRow(comment: comment)
                        }
                    }
                    .padding()
                }
                
                Divider()
                
                // Comment Input
                HStack(spacing: 12) {
                    // User emoji
                    Text("😊")
                        .font(.system(size: 32))
                        .frame(width: 40, height: 40)
                        .background(Circle().fill(Color(uiColor: .systemGray6)))
                    
                    // Text field
                    TextField("Add a comment...", text: $newCommentText, axis: .vertical)
                        .lineLimit(1...4)
                        .focused($isTextFieldFocused)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(uiColor: .systemGray6))
                        )
                    
                    // Send button
                    Button {
                        postComment()
                    } label: {
                        Image(systemName: "arrow.up.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(newCommentText.isEmpty ? .gray : .pink)
                    }
                    .disabled(newCommentText.isEmpty)
                }
                .padding()
                .background(Color(uiColor: .systemBackground))
            }
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.hidden)
        .presentationCornerRadius(25)
    }
    
    private func postComment() {
        let newComment = Comment(
            username: "You",
                        profilePic: "😊",
            text: newCommentText,
            timestamp: Date(),
            likes: 0
        )
        comments.insert(newComment, at: 0)
        newCommentText = ""
        isTextFieldFocused = false
    }
}

#Preview {
    HomeView()
        .sheet(isPresented: .constant(true)) {
            CommentsView(post: Post.samplePosts[0])
        }
}


