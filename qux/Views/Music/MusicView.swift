//
//  MusicView.swift
//  qux
//
//  Created by linda han on 2026-02-12.
//

import SwiftUI

struct MusicView: View {
    @State private var selectedMusicTab = 0
    @State private var showingAddPost = false
    @State private var searchText = ""
    @State private var showFilters = false
    @State private var selectedSort: SongSortOption = .recentlyAdded
    @State private var filterButtonFrame: CGRect = .zero
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                // Custom tab bar
                MusicTabBar(selectedTab: $selectedMusicTab)
                    .padding(.vertical, 20)
                
                // Search and filter bar
                HStack(spacing: 12) {
                    // Search field
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.primary.opacity(0.5))
                            .font(.system(size: 16))
                        
                        TextField("Search", text: $searchText)
                            .foregroundColor(.primary)
                            .tint(.primary)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.primary.opacity(0.3), lineWidth: 1)
                    )
                    
                    // Filter button
                    Button {
                        withAnimation {
                            showFilters.toggle()
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .font(.system(size: 16))
                            .foregroundColor(.primary)
                            .frame(width: 44, height: 44)
                            .background(
                                Circle()
                                    .stroke(Color.primary.opacity(0.3), lineWidth: 1)
                            )
                    }
                    
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
                
                // Content with filter popup overlay
                ZStack(alignment: .topTrailing) {
                    Group {
                        switch selectedMusicTab {
                        case 0:
                            SongsView(searchText: searchText)
                        case 1:
                            LyricsView()
                        default:
                            SongsView(searchText: searchText)
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    // Filter popup overlay
                    if showFilters {
                        // Invisible tap area to dismiss
                        Color.clear
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation {
                                    showFilters = false
                                }
                            }
                            .zIndex(0)
                        
                        // Popup menu
                        VStack(spacing: 0) {
                            SongFilterPopup(
                                selectedSort: $selectedSort,
                                showFilters: $showFilters
                            )
                            .padding(.top, 8)
                            .padding(.trailing, 20)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .zIndex(1)
                        .transition(.opacity.combined(with: .scale(scale: 0.95, anchor: .topTrailing)))
                    }
                }
            }
            .ignoresSafeArea(edges: .top)
            
            // Floating Add Button aligned to right
            VStack {
                HStack {
                    Spacer()
                    AddPostButton {
                        showingAddPost = true
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 80)
                }
            }
        }
        .sheet(isPresented: $showingAddPost) {
            Text("addpost")        }
    }
}
    
#Preview {
    MusicView()
}




