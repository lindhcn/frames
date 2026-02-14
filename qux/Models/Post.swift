//
//  Post.swift
//  qux
//
//  Created by linda han on 2026-02-07.
//

import SwiftUI

struct Post: Identifiable {
    let albumCover: String
    let commentCount: Int
    let id = UUID()
    let profilePic: String
    let username: String
    let songTitle: String
    let artist: String
    let timeStamp: Date
    let image: String
    
    var formattedTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d\nh:mm a"
        return formatter.string(from: timeStamp)
    }
    
    static let samplePosts: [Post] = [
        Post(albumCover: "Image", commentCount: 3, profilePic: "Lebron-Dwade", username: "linda", songTitle: "E85", artist: "Don Toliver", timeStamp: Date().addingTimeInterval(-7200), image: "sidney-crosby-2008-50"), Post(albumCover: "Image", commentCount: 0, profilePic: "pp1",username: "natalie",  songTitle: "E85", artist: "Don Toliver", timeStamp: Date(), image: "Lebron-Dwade")
    ]
}
