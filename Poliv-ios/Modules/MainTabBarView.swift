//
//  MainTabBarView.swift
//  Poliv-ios
//
//  Created by artem on 10.05.2024.
//

import SwiftUI


struct MainTabBarView: View {

    init() {
     UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir-Heavy", size: 15)! ], for: .normal)
    }

    var body: some View {

        return TabView {
            Group {
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
            .toolbarBackground(.white, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
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
            static let calendar = "Календарь"
            static let feed = "Новости"
            static let create = "Создать"
            static let sovets = "Советы"
            static let profile = "Профиль"
        }
    }
}
