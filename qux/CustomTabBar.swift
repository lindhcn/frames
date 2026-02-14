//
//  CustomTabBar.swift
//  qux
//
//  Created by linda han on 2026-02-06.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarItem(icon: "house.fill", title: "Home", isSelected: selectedTab == 0)
                .onTapGesture { selectedTab = 0 }
            TabBarItem(icon: "music.note", title: "Songs", isSelected: selectedTab == 1)
                .onTapGesture { selectedTab = 1 }
            TabBarItem(icon: "folder.fill", title: "Moments", isSelected: selectedTab == 2)
                .onTapGesture { selectedTab = 2 }
        }
        .frame(height: 70)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.gray, lineWidth: 0.4)
                .shadow(radius: 4)
        )
        .padding(.horizontal, 20)
        //.shadow(radius: 5)
    }
}

struct TabBarItem: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .frame(width: 30, height: 30)
            Text(title)
                .font(.system(size: 12))
        }
        .foregroundColor(isSelected ? .pink : .primary)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
    }
}

#Preview {
    CustomTabBar(selectedTab: .constant(0))
}
