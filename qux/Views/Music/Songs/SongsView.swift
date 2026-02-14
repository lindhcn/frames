//
//  SongsView.swift
//  qux
//
//  Created by linda han on 2026-02-12.
//

import SwiftUI

struct SongsView: View {
    let searchText: String
    @State private var songs = Song.sampleSongs
    
    var filteredSongs: [Song] {
        if searchText.isEmpty {
            return songs
        }
        return songs.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.artist.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                
                // Song list
                LazyVStack(spacing: 16) {
                    ForEach(filteredSongs) { song in
                        SavedSongRow(song: song)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)  // Account for tab bar
            }
        }
    }
}

#Preview {
    SongsView(searchText: "")
}
