//
//  MainTabBarView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI


struct MainTabBarView: View {
    var body: some View {
        TabView {
            MainCalendarView()
                .tabItem {
                    Label(Constants.TabText.calendar, systemImage:  .TabBarImageName.calendar)
                }
            
            FeedView()
                .tabItem {
                    Label(Constants.TabText.feed, systemImage:  .TabBarImageName.feed)
                }
            
            CreateView()
                .tabItem {
                    Label(Constants.TabText.create, systemImage:  .TabBarImageName.create)
                }
         
            
            SovetsView()
                .tabItem {
                    Label(Constants.TabText.sovets, systemImage:  .TabBarImageName.sovets)
                }
            
            ProfileView()
                .tabItem {
                    Label(Constants.TabText.profile, systemImage:  .TabBarImageName.profile)
                }
        }
        .tint(.topGreen)
    }
}

#Preview {
    MainTabBarView()
}


extension MainTabBarView {
    enum Constants {
        enum TabText {
            static let calendar = "Calendar"
            static let feed = "Feed"
            static let create = "Create"
            static let sovets = "Sovets"
            static let profile = "Profile"
        }
    }
}
