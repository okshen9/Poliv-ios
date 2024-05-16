import SwiftUI
import SQLite3

struct SovetsView: View {

    @State private var plantIDs: [String] = []
    @State private var plantNames: [String] = []
    @State private var plantAges: [String] = []
    @State private var plantVids: [String] = []
    @State private var plantComms: [String] = []
    @State private var plantHeights: [String] = []
    @State private var plantBreedings: [String] = []
    @State private var plantBlooms: [String] = []
    @State private var plantPopulars: [String] = []

    var body: some View {
        NavigationView{
            ZStack{
                Image("backimage")
                    .resizable()
                    .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Раздел советы")
                            .padding(.all, 20)
                            .frame(maxWidth: .infinity,
                                   alignment: .center)
                            .font(Font.custom("kudry", size: 20))
                            .background(.topGreen)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .foregroundColor(.white)
                        Text("Содержит рекомендательную информацию по уходу за растениями")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("kudry", size: 20))
                        ForEach(0..<plantNames.count, id: \.self) { index in
                            NavigationLink(destination: Text(plantPopulars[index])){
                                VStack {
                                    Text(plantNames[index])
                                        .foregroundColor(.black).frame(maxWidth: .infinity, alignment: .leading).padding(.horizontal, 16).padding(.vertical, 10).font(.system(size: 18))
                                }}
                        }
                        .background(.white80)
                    }
                    .onAppear {
                        var db: OpaquePointer?
                        if sqlite3_open("/Users/artemnesko/WorkProject/Pet Project and PlayGround/Poliv3/sqllite/mybase.db", &db) == SQLITE_OK {
                            var queryStatement: OpaquePointer?
                            let queryString = "SELECT * FROM plants ORDER BY Name"
                            if sqlite3_prepare_v2(db, queryString, -1, &queryStatement, nil) == SQLITE_OK {
                                repeat {
                                        if let name = sqlite3_column_text(queryStatement,1) {
                                            plantNames.append(String(cString: name))
                                    }
                                    if let type = sqlite3_column_text(queryStatement, 8) {
                                                       plantPopulars.append(String(cString: type))
                                                   }
                                } while sqlite3_step(queryStatement) == SQLITE_ROW
                                sqlite3_finalize(queryStatement)
                            }
                            sqlite3_close(db)
                        }
                    }
                }}}
    }}

struct ContentView: View {
    var body: some View {
        SovetsView()
    }
}
