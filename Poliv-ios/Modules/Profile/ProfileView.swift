import SwiftUI
import SwiftData

struct ProfileView: View {
    // Работа с базой данных
    @Query private var myPalnts: [MyPlantModel]
    @Environment(\.modelContext) var modelContext
    
    // Сама вьюшка
    @State private var image = UIImage(systemName: .tree)!
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            ZStack{
                Image("backimage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                        Image(uiImage: self.image)
                            .resizable()
                            .frame(width: 100,
                                   height: 100)
                            .background(.topGreen)
                            .cornerRadius(20)
                            .padding(.vertical, 20)
                            .onTapGesture {
                              showSheet = true
                            }
                    
                    NavigationLink(destination: AddPlantView(nil).modelContainer(for: MyPlantModel.self)
                    ) {
                        Text("Тут будет лента со вкладками действия/заметки").padding(10)
                    }
                    Spacer()
                    List(myPalnts) { myPlant in
                        ProfilePlantCellView(myPlant: myPlant)
                            .modelContainer(for: MyPlantModel.self)
                            .swipeActions {
                                Button("Удалить", action: {
                                    modelContext.delete(myPlant)
                                }).background(.red)
                            }
                    }
                    .scrollContentBackground(.hidden)
                    .listStyle(.plain)
                }
                .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
