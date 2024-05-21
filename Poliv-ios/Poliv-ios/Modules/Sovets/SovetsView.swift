import SwiftUI
import SQLite3

struct SovetsView: View {
    
    @State private var isModalPresented = false
    @State private var selectedImage = "140"
    @State private var isDataLoaded = false

    @State private var plantIDs = [String]()
    @State private var plantNames = [String]()
    @State private var plantAges = [String]()
    @State private var plantVids = [String]()
    @State private var plantComms = [String]()
    @State private var plantHeights = [String]()
    @State private var plantBreedings = [String]()
    @State private var plantBlooms = [String]()
    @State private var plantPopulars = [String]()
    
    @State private var plantIDsIndex: String = ""
    
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
                            .font(Font.kudry(20))
                            .background(.topGreen)
                            .cornerRadius(20)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 16)
                            .foregroundColor(.white)
                        Text("Содержит рекомендательную информацию по уходу за растениями")
                            .multilineTextAlignment(.center)
                            .font(Font.kudry(20))
                        ForEach(0..<plantNames.count, id: \.self) { index in
                            NavigationLink(destination: ScrollView {
                                VStack {
                                    Image(plantIDsIndex)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 250)
                                        .clipped()
                                        .cornerRadius(20)
                                        .padding(10)
                                        .onTapGesture { [plantIDs] in
                                            self.selectedImage = plantIDs[index]
                                            self.isModalPresented = true
                                        }
                                    
                                    HStack{ //1 столбец Name
                                        Text("Название растения: ")
                                            .multilineTextAlignment(.center)
                                            .font(Font.kudry(20))
                                            .foregroundColor(.topGreen)
                                        Text(plantNames[index])
                                        .font(.system(size: 18))}
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 16)
                                    
                                    HStack{//2 столбец Age
                                        Text("Период жизни: ")
                                            .multilineTextAlignment(.center)
                                            .font(Font.kudry(20))
                                            .foregroundColor(.topGreen)
                                        Text(plantAges[index])
                                        .font(.system(size: 18))}
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 16)
                                    
                                    HStack{//3 столбец Vid
                                        Text("Тип растения: ")
                                            .multilineTextAlignment(.center)
                                            .font(Font.kudry(20))
                                            .foregroundColor(.topGreen)
                                        Text(plantVids[index])
                                        .font(.system(size: 18))}
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 16)
                                    
                                    HStack{//5 столбец Height
                                        Text("Высота растения (см): ")
                                            .multilineTextAlignment(.center)
                                            .font(Font.kudry(20))
                                            .foregroundColor(.topGreen)
                                        Text(plantHeights[index])
                                        .font(.system(size: 18))}
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 16)
                                    
                                    if !plantBlooms[index].isEmpty {
                                        HStack{//7 столбец Bloom
                                            Text("Цветение: ")
                                                .multilineTextAlignment(.center)
                                                .font(Font.kudry(20))
                                                .foregroundColor(.topGreen)
                                            Text(plantBlooms[index])
                                            .font(.system(size: 18))}
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 16)
                                    }
                                    
                                    //4 столбец Comm
                                    Text("Описание: ")
                                        .font(Font.kudry(20))
                                        .foregroundColor(.topGreen)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.horizontal, 16)
                                    Text(plantComms[index])
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 16)
                                    
                                    //6 столбец Breeding
                                    Text("Размножение: ")
                                        .font(Font.kudry(20))
                                        .foregroundColor(.topGreen)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.horizontal, 16)
                                    Text(plantBreedings[index])
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 16)
                                    
                                    Text("Популярные сорта: ")//8 Popular
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .foregroundColor(.topGreen)
                                        .padding(.horizontal, 16)
                                        .font(Font.kudry(20))
                                    
                                    Text(plantPopulars[index])
                                        .font(.system(size: 18))
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 16)
                                }.background(.white.opacity(0.8))
                            }.background(
                                Image("backimage") // Название вашей фоновой картинки
                                    .resizable()
                                    .scaledToFill()
                                    .edgesIgnoringSafeArea(.all)
                            )) {
                                Text(plantNames[index]) //справка по имени
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 10)
                                    .font(.system(size: 18))
                            }
                        }.background(.white80)
                    }
                    .sheet(isPresented: $isModalPresented) {
                        Image(selectedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .edgesIgnoringSafeArea(.all)
                    }
                    .onAppear {
                        if !isDataLoaded {
                        getData()
                        isDataLoaded = true
                                        }
                                }
                    .onChange(of: plantIDsIndex, perform: {
                        plantIDsIndex = plantIDs[index]
                    })
                }
            }
        }
    }
    
    func getData() {
        var db: OpaquePointer?
        if sqlite3_open(Bundle.main.path(forResource: "mybase", ofType: "db"), &db) == SQLITE_OK {
            var queryStatement: OpaquePointer?
            let queryString = "select pl.PlantID, pl.Name, ag.AgeType, vd.VidType, cm.CommentText, hg.Text as Height, bd.Text as Breeding, bl.Text as Bloom, pp.Text as Popular from Plants pl JOIN Ages ag ON ag.AgeKey = pl.Age Join VidTypes vd ON vd.VidKey = pl.Vid Join Height hg ON hg.ID = pl.Height join Breeding bd ON bd.ID = pl.Breeding join Bloom bl ON bl.ID = pl.Bloom join Popular pp ON pp.ID = pl.Popular join Comments cm ON cm.CommentKey = pl.Comm order by pl.Name"
            if sqlite3_prepare_v2(db, queryString, -1, &queryStatement, nil) == SQLITE_OK {
                repeat {
                    if let pID = sqlite3_column_text(queryStatement, 0) {
                        plantIDs.append(String(cString: pID))
                    }
                    if let pname = sqlite3_column_text(queryStatement,1) {
                        plantNames.append(String(cString: pname))
                    }
                    if let page = sqlite3_column_text(queryStatement, 2) {
                        plantAges.append(String(cString: page))
                    }
                    if let pvid = sqlite3_column_text(queryStatement, 3) {
                        plantVids.append(String(cString: pvid))
                    }
                    if let pcomm = sqlite3_column_text(queryStatement, 4) {
                        plantComms.append(String(cString: pcomm))
                    }
                    if let pheight = sqlite3_column_text(queryStatement, 5) {
                        plantHeights.append(String(cString: pheight))
                    }
                    if let pbreed = sqlite3_column_text(queryStatement, 6) {
                        plantBreedings.append(String(cString: pbreed))
                    }
                    if let pblooms = sqlite3_column_text(queryStatement, 7) {
                        plantBlooms.append(String(cString: pblooms))
                    }
                    if let popular = sqlite3_column_text(queryStatement, 8) {
                        plantPopulars.append(String(cString: popular))
                    }
                } while sqlite3_step(queryStatement) == SQLITE_ROW
                sqlite3_finalize(queryStatement)
            }
            sqlite3_close(db)
        }
    }
}

#Preview {
    SovetsView()
}
