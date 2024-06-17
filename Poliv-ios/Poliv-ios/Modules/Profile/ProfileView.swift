import SwiftUI
import SwiftData

struct ProfileView: View {
    // Работа с базой данных
    @Query var myPlants: [MyPlantModel]
    @Query var myTasks: [MyPlantModel]
    @Query var profileModel: [ProfileModel]
    @Environment(\.modelContext) var modelContext
    
    // Сама вьюшка
    @State private var image = UIImage(systemName: .person)!
    @State private var showSheet = false
    @State private var showPopover: Bool = false

    var body: some View {
        NavigationView {
            ZStack{
                Image("backimage")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    HStack {
                        Image(uiImage: UIImage(data: self.profileModel.first?.imageAvatarData ?? Data()) ?? UIImage(systemName: .person)!)
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
                        //credits
                        Button("(c)"){
                            showPopover.toggle()
                        }
                        .popover(isPresented: $showPopover){
                            Text("Добро пожаловать в мое мобильное приложение! Все тексты, изображения, дизайн и другие материалы приложения защищены авторскими правами. Любое незаконное использование контента приложения без согласия правообладателя будет преследоваться в соответствии с законодательством. Приложение предоставляет возможность только для личного пользования и не может быть использовано в коммерческих целях без разрешения.").padding(.horizontal, 16).multilineTextAlignment(.center)
                            Text("Справочная информация для базы данных взята из открытых источников в сети Интернет, а также из книги \"Библия садовых растений / И. Березкина, Н. Григорьева. – Обновлен. и доп. изд. – Москва : Издательство «Э», 2016. – 256 с. – (Подарочные издания. Энциклопедии цветовода, дачника).\" ").padding(.horizontal, 16)
                            Text("Изображения, используемые в данном приложении, взяты из открытых источников в сети Интернет. Следующие изображения защищены авторским правом и требуют упоминания авторства и источника: ").padding(.horizontal, 16)
                            Text("Изображение Схизантус: автор - Syngenta Россия, источник  - https://www.syngenta.ru/crops/flowers-and-ornamentals/20120229-schizanthus-industrial-technology-of-growing").padding(.horizontal, 16)
                            Text("Изображение Подофилл Эмода: автор - Дачная энциклопедия Дача-Дача, источник - https://dachadacha.com/rasteniya/tsvetochnyj-mir/dekorativnolistvennye/podofill-emoda").padding(.horizontal, 16)
                        }
                    }
                    
                    Text("Здесь размещен список Ваших растений")
                        .multilineTextAlignment(.center)
                        .font(Font.kudry(20))

                    NavigationLink(destination: AddPlantView(nil).modelContainer(sharedModelContainer)
                    ) {
                        Text("Добавить новое растение").padding(10)
                            .background(.topGreen)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .font(Font.kudry(20))
                    }
                    List(myPlants) { myPlant in
                        ProfilePlantCellView(myPlant: myPlant)
                            .modelContainer(sharedModelContainer)
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
                .onChange(of: image) {
                    print("Изменилась аватарка")
                    safeAvatar()
                }
            }
        }
    }
    
    
    @MainActor
    private func safeAvatar() {
        if let model = profileModel.first,
           model.imageAvatarData != nil {
            profileModel.first!.setImage(imageAvatar: image)
        } else {
            let profilModel = ProfileModel(imageAvatar: image)
            modelContext.insert(profilModel)
        }
            
            
            do {
                try modelContext.save()  // Сохраняем изменения в базе данных
                print("Data saved successfully")
            } catch {
                print("Error saving context: \(error)")
            }
        }
    
}

#Preview {
    ProfileView()
}
