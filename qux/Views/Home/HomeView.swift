//
//  HomeView.swift
//  qux
//
//  Created by linda han on 2026-02-06.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedHomeTab = 0
    @State private var showingAddPost = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                // Content area
                // Custom tab bar
                HomeTabBar(selectedTab: $selectedHomeTab)
                    .padding(.vertical, 20)
                
                Group {
                    switch selectedHomeTab {
                    case 0:
                        MyEntriesView()
                    case 1:
                        FriendsView()
                    default:
                        MyEntriesView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
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
                    .padding(.bottom, 80)  // Just a bit of padding from bottom
            }
        }
        
        
        
    }

    }
}

struct AddPostButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "plus")
                .font(.system(size: 24))
                .foregroundColor(.primary).colorInvert()
                .frame(width: 60, height: 60)
                .background(
                    Circle()
                        .fill(Color.pink)
                        //.stroke(Color.primary.opacity(0.3), lineWidth: 1)
                        .shadow(color: .pink.opacity(0.3), radius: 8, y: 4)
                )
            
        }
    }
}



#Preview {
    HomeView()
}
