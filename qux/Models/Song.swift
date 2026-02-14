//
//  Song.swift
//  qux
//
//  Created by linda han on 2026-02-12.
//

import SwiftUI

struct Song: Identifiable, Codable {
    let id: UUID
    let title: String
    let artist: String
    let albumArt: String  // Image name or URL
    let tags: [String]
    var isSaved: Bool = false
    
    static let sampleSongs: [Song] = [
        Song(
            id: UUID(),
            title: "Disillusioned",
            artist: "Daniel Caesar",
            albumArt: "disillusioned_art",
            tags: ["R&B", "HEARTBREAK"]
        ),
        Song(
            id: UUID(),
            title: "What is Love?",
            artist: "Twice",
            albumArt: "what_is_love_art",
            tags: ["FUN", "K-POP"]
        ),
        Song(
            id: UUID(),
            title: "Lover Girl",
            artist: "Laufey",
            albumArt: "lover_girl_art",
            tags: ["JAZZ"]
        ),
        Song(
            id: UUID(),
            title: "Heavy",
            artist: "The Marias",
            albumArt: "heavy_art",
            tags: ["ALT-POP", "SAD"]
        ),
        Song(
            id: UUID(),
            title: "golden hour",
            artist: "JVKE",
            albumArt: "golden_hour_art",
            tags: ["POP", "CHILL"]
        )
    ]
}

struct LyricLine: Identifiable {
    let id = UUID()
    let timestamp: String  // e.g., "3:33 - 3:37"
    let text: String
    let startTime: Double  // in seconds
    let endTime: Double
}

struct SongLyrics: Identifiable {
    let id = UUID()
    let song: Song
    let lines: [LyricLine]
    
    static let sampleLyrics: [SongLyrics] = [
        SongLyrics(
            song: Song.sampleSongs[0],
            lines: [
                LyricLine(
                    timestamp: "3:33 - 3:37",
                    text: "I love being reclusive and I love being with you",
                    startTime: 213,
                    endTime: 217
                )
            ]
        ),
        SongLyrics(
            song: Song.sampleSongs[4],
            lines: [
                LyricLine(
                    timestamp: "0:34 - 0:45",
                    text: "I was all alone with the love of my life",
                    startTime: 34,
                    endTime: 45
                ),
                LyricLine(
                    timestamp: "0:45 - 0:52",
                    text: "She's got glitter for skin",
                    startTime: 45,
                    endTime: 52
                ),
                LyricLine(
                    timestamp: "0:52 - 0:58",
                    text: "My radiant beam in the night",
                    startTime: 52,
                    endTime: 58
                ),
                LyricLine(
                    timestamp: "0:58 - 1:05",
                    text: "I don't need no light to see you shine",
                    startTime: 58,
                    endTime: 65
                )
            ]
        )
    ]
}

