//
//  SongsHeader.swift
//  qux
//
//  Created by linda han on 2026-02-12.
//

import SwiftUI
struct MusicTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            MusicTabBarItem(title: "Songs", isSelected: selectedTab == 0)
                .onTapGesture { selectedTab = 0 }
            
            MusicTabBarItem(title: "Lyrics", isSelected: selectedTab == 1)
                .onTapGesture { selectedTab = 1 }
        }
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 25)  // Match the pill shape
                .stroke(Color.primary.opacity(0.3), lineWidth: 1)  // Border around entire container
        )
        .padding(.horizontal, 20)
        .padding(.top, 60)
    }
}

struct MusicTabBarItem: View {
    let title: String
    let isSelected: Bool
    
    var body: some View {
        Text(title)
            .font(.system(size: 16, weight: isSelected ? .semibold : .regular))
            .foregroundColor(isSelected ? .pink : .secondary)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(isSelected ? Color(uiColor: .systemGray5) : Color.clear)
                    .padding(4)  // Inset from the border
            )
    }
}

#Preview {
    MusicTabBar(selectedTab: .constant(0))
}
