//
//  SongEntryView.swift
//  qux
//
//  Created by linda han on 2026-02-12.
//

import SwiftUI

struct SavedSongRow: View {
    let song: Song
    @State private var isSaved = true
    
    var body: some View {
        HStack(spacing: 12) {
            // Album art
            RoundedRectangle(cornerRadius: 8)
                .fill(
                    LinearGradient(
                        colors: [
                            song.title.contains("Disillusioned") ? Color.blue : Color.purple,
                            song.title.contains("Disillusioned") ? Color.blue.opacity(0.6) : Color.pink.opacity(0.6)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: 80, height: 80)
                .overlay(
                    Image(systemName: "music.note")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.system(size: 24))
                )
            
            // Song info
            VStack(alignment: .leading, spacing: 6) {
                Text(song.title)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.primary)
                
                Text(song.artist)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.primary.opacity(0.7))
                
                // Genre tags
                HStack(spacing: 6) {
                    ForEach(song.tags, id: \.self) { genre in
                        Text(genre)
                            .font(.system(size: 11, weight: .light))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 3)
                            .background(
                                Capsule()
                                    .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                            )
                    }
                }
            }
            
            Spacer()
            
            // Add/Remove button
            /*Button {
                withAnimation(.spring(response: 0.3)) {
                    isSaved.toggle()
                }
            } label: {
                Image(systemName: isSaved ? "checkmark" : "plus")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .stroke(Color.primary.opacity(0.5), lineWidth: 1)
                    )
            }*/
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        ForEach(Song.sampleSongs) { song in
            SavedSongRow(song: song)
        }
    }
    .padding()
}
