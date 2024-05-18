import SwiftUI
import SwiftData

struct MainTabBarView: View {

    var body: some View {

        return TabView {
            Group {
                MainCalendarView()
//                    .modelContainer(for: MyPlantModel.self)
                    .modelContainer(for: TaskModel.self)
                    .tabItem {
                        Label(Constants.TabText.calendar, systemImage:  .TabBarImageName.calendar)
                    }

                FeedView()
//                    .modelContainer(for: MyPlantModel.self)
                    .modelContainer(for: TaskModel.self)
                    .tabItem {
                        Label(Constants.TabText.feed, systemImage:  .TabBarImageName.feed)
                    }
                

                CreateView()
                    .modelContainer(for: MyPlantModel.self)
                    .modelContainer(for: TaskModel.self)
                    .tabItem {
                        Label(Constants.TabText.create, systemImage:  .TabBarImageName.create)
                    }

                SovetsView()
                    .tabItem {
                        Label(Constants.TabText.sovets, systemImage:  .TabBarImageName.sovets)
                    }

                ProfileView()
                    .modelContainer(for: MyPlantModel.self)
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
            static let feed = "Лента"
            static let create = "Создать"
            static let sovets = "Советы"
            static let profile = "Профиль"
        }
    }
    
    enum SelectedTab: Int {
        case calendar
        case feed
        case create
        case sovets
        case profile
    }
}
