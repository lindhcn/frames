//
//  Comment.swift
//  qux
//
//  Created by linda han on 2026-02-10.
//

import SwiftUI

struct Comment: Identifiable {
    let id = UUID()
    let username: String
    let profilePic: String
    let text: String
    let timestamp: Date
    let likes: Int
    var isLiked: Bool = false
    
    var timeAgo: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: timestamp, relativeTo: Date())
    }
    
    // Sample data
    static let sampleComments: [Comment] = [
        Comment(
            username: "natle",
                        profilePic: "🎵",
            text: "waow",
            timestamp: Date().addingTimeInterval(-3600),
            likes: 12
        ),
        Comment(
            username: "lind",
                        profilePic: "🎧",
            text: "hash tag sideny crobby",
            timestamp: Date().addingTimeInterval(-7200),
            likes: 8
        )
    ]
}
