import SwiftUI

struct ProfileView: View {
    
    @State private var image = UIImage()
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
                            .background(.gray)
                            .cornerRadius(50)
                            .onTapGesture {
                              showSheet = true
                            }
                    
                    NavigationLink(destination: AddPlantView()) {
                        Text("Тут будет лента со вкладками действия/заметки").padding(10)
                    }
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
