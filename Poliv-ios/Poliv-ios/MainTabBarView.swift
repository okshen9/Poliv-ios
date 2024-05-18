import SwiftUI
import SwiftData

struct MainTabBarView: View {

    
    @State private var selectedTab: SelectedTab = .calendar
    
    
    init() {
     UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir-Heavy", size: 15)! ], for: .normal)
    }

    var body: some View {

        return TabView(selection: $selectedTab) {
            Group {
                MainCalendarView()
                    .modelContainer(for: TaskModel.self)
                    .tabItem {
                        Label(Constants.TabText.calendar, systemImage:  .TabBarImageName.calendar)
                    }
                    .tag(0)

                FeedView()
                    .modelContainer(for: TestTaskModel.self)
                    .tabItem {
                        Label(Constants.TabText.feed, systemImage:  .TabBarImageName.feed)
                    }
                    .tag(1)

                CreateView()
//                    .modelContainer(for: TaskModel.Type)
                    .modelContainer(for: TestTaskModel.self)
//                    .modelContainer(for: MyPlantModel.self])
                    .tabItem {
                        Label(Constants.TabText.create, systemImage:  .TabBarImageName.create)
                    }
                    .tag(2)

                SovetsView()
                    .tabItem {
                        Label(Constants.TabText.sovets, systemImage:  .TabBarImageName.sovets)
                    }
                    .tag(3)

                ProfileView()
                    .modelContainer(for: MyPlantModel.self)
                    .tabItem {
                        Label(Constants.TabText.profile, systemImage:  .TabBarImageName.profile)
                    }
                    .tag(4)
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
    
    enum SelectedTab: Int {
        case calendar
        case feed
        case create
        case sovets
        case profile
    }
}
