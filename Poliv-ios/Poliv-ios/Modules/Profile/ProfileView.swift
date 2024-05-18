import SwiftUI
import SwiftData

struct ProfileView: View {
    // Работа с базой данных
    @Query private var myPalnts: [MyPlantModel]
    @Environment(\.modelContext) var modelContext
    
    // Сама вьюшка
    @State private var image = UIImage(systemName: .person)!
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            ZStack{
                Image("backimage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(uiImage: self.image)
                                .resizable()
                                .frame(width: 100,
                                       height: 100)
                                .cornerRadius(20)
                                .padding(.vertical, 20)
                                .onTapGesture {
                                  showSheet = true
                            }
                        Text("Добро пожаловать в Ваш профиль!")
                            .padding(.horizontal, 16)
                            .multilineTextAlignment(.center)
                            .font(Font.kudry(20))

                    }
                    
                    Text("Здесь размещен список Ваших растений")
                        .multilineTextAlignment(.center)
                        .font(Font.kudry(20))

                    NavigationLink(destination: AddPlantView(nil).modelContainer(for: MyPlantModel.self)
                    ) {
                        Text("Добавить новое растение").padding(10)
                            .background(.topGreen)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .font(Font.kudry(20))
                    }
                    List(myPalnts) { myPlant in
                        ProfilePlantCellView(myPlant: myPlant)
                            .modelContainer(for: MyPlantModel.self)
                            .background(.white.opacity(0.8))
                            .cornerRadius(20)
                            .swipeActions {
                                Button("Удалить", action: {
                                    modelContext.delete(myPlant)
                                })
                            }
                    }
                    .padding(.vertical, -20)
                    .scrollContentBackground(.hidden)
                    .listStyle(.insetGrouped)
                }
                Spacer()
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
