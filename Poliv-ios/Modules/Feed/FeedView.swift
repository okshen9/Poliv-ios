import SwiftUI

let backgroundGradient = Image("backimage")

struct FeedView: View {
    var body: some View {
        ZStack{
            Image("backimage")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Text("Тут будет лента со вкладками действия/заметки")
                    .padding()
            }
        }
    }
}


#Preview {
    FeedView()
}
