//
//  ContentView.swift
//  qux
//
//  Created by linda han on 2026-02-05.
//
import SwiftUI
import UIKit

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            // Content area
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    MusicView()
                case 2:
                    MomentsView()
                default:
                    HomeView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            

            // Custom tab bar
            CustomTabBar(selectedTab: $selectedTab)
            .ignoresSafeArea(edges: .bottom)
        }
    }
}



struct MomentsView: View {
    var body: some View {
        Text("Moments View")
    }
}

#Preview {
    ContentView()
}
