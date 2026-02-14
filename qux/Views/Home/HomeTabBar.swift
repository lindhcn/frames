//
//  HomeTabBar.swift
//  qux
//
//  Created by linda han on 2026-02-06.
//

import SwiftUI
struct HomeTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            HomeTabBarItem(title: "My Entries", isSelected: selectedTab == 0)
                .onTapGesture { selectedTab = 0 }
            
            HomeTabBarItem(title: "Friends", isSelected: selectedTab == 1)
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

struct HomeTabBarItem: View {
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
    HomeTabBar(selectedTab: .constant(0))
}
