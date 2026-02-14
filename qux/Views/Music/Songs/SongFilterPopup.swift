//
//  SongFilterPopup.swift
//  qux
//
//  Created by linda han on 2026-02-12.

//

import SwiftUI

enum SongSortOption: String, CaseIterable {
    case title = "Title"
    case recentlyAdded = "Recently Added"
    case artist = "Artist"
    
    var icon: String {
        switch self {
        case .title:
            return ""
        case .recentlyAdded:
            return ""
        case .artist:
            return ""
        }
    }
}

struct SongFilterPopup: View {
    @Binding var selectedSort: SongSortOption
    @Binding var showFilters: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            PopupOptionRowSimple(
                option: .title,
                isSelected: selectedSort == .title
            ) {
                withAnimation {
                    selectedSort = .title
                    showFilters = false
                }
            }
            
            Divider()
                .background(Color.primary.opacity(0.2))
                .padding(.leading, 20)
            
            PopupOptionRowSimple(
                option: .recentlyAdded,
                isSelected: selectedSort == .recentlyAdded
            ) {
                withAnimation {
                    selectedSort = .recentlyAdded
                    showFilters = false
                }
            }
            
            Divider()
                .background(Color.primary.opacity(0.2))
                .padding(.leading, 20)
            
            PopupOptionRowSimple(
                option: .artist,
                isSelected: selectedSort == .artist
            ) {
                withAnimation {
                    selectedSort = .artist
                    showFilters = false
                }
            }
        }
        .background(Color.secondary)
        .cornerRadius(14)
        .frame(width: 250)
        .shadow(color: .black.opacity(0.3), radius: 20, y: 10)
    }
}

struct PopupOptionRowWithIcon: View {
    let option: SongSortOption
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Checkmark
                Image(systemName: "checkmark")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 24)
                    .opacity(isSelected ? 1 : 0)
                
                // Label
                Text(option.rawValue)
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                
                Spacer()
                
                // Icon
                Image(systemName: option.icon)
                    .font(.system(size: 20))
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

struct PopupOptionRowSimple: View {
    let option: SongSortOption
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                // Checkmark
                Image(systemName: "checkmark")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                    .frame(width: 24)
                    .opacity(isSelected ? 1 : 0)
                
                // Label
                Text(option.rawValue)
                    .font(.system(size: 17))
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            HStack {
                Spacer()
                SongFilterPopup(
                    selectedSort: .constant(.artist),
                    showFilters: .constant(true)
                )
                .padding(.trailing, 20)
            }
            Spacer()
        }
        .padding(.top, 100)
    }
}
