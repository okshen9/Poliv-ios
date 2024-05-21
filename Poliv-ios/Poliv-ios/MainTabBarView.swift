import SwiftUI
import SwiftData

var sharedModelContainer: ModelContainer = {
    let schema = Schema([
        TaskModel.self,
        ProfileModel.self,
        MyPlantModel.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

    do {
        return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()

struct MainTabBarView: View {

    init() {
     UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.init(name: "Avenir-Heavy", size: 15)! ], for: .normal)
    }
    
    var body: some View {

        return TabView {
            Group {
                MainCalendarView()
                    .modelContainer(sharedModelContainer)
                    .tabItem {
                        Label(Constants.TabText.calendar, systemImage:  .TabBarImageName.calendar)
                    }

                FeedView()
                    .modelContainer(sharedModelContainer)
                    .tabItem {
                        Label(Constants.TabText.feed, systemImage:  .TabBarImageName.feed)
                    }
                

                CreateView()
                    .modelContainer(sharedModelContainer)
                    .tabItem {
                        Label(Constants.TabText.create, systemImage:  .TabBarImageName.create)
                    }

                SovetsView()
                    .tabItem {
                        Label(Constants.TabText.sovets, systemImage:  .TabBarImageName.sovets)
                    }

                ProfileView()
                    .modelContainer(sharedModelContainer)
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
