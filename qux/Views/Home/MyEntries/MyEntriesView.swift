//
//  MyEntriesView.swift
//  qux
//
//  Created by linda han on 2026-02-07.
//

import SwiftUI
struct MyEntriesView: View {
    @State private var posts = Post.samplePosts
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Today")
                    .font(.title)
                    .foregroundStyle(.secondary)
                    
                
                .padding(.horizontal, 20)
                //.padding(.top, 80)  // Account for HomeTabBar
                .padding(.bottom, 12)
                
                // Posts
                LazyVStack(spacing: 16) {
                    ForEach(posts) { post in
                        MyPostView(post: post)
                    }
                }
                //.padding(.horizontal, 16)
                .padding(.bottom, 120)
            }
        }
        //.safeAreaInset(edge: .top, spacing: 0) {
          // Color.clear.frame(height: 60)  // Height of HomeTabBar
       //}
    }
}

#Preview {
    MyEntriesView()
}
