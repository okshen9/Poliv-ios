import SwiftUI

struct CreateView: View {

    var body: some View {
        ZStack{
        Image("backimage")
            .resizable()
            .ignoresSafeArea()
        VStack{
            Text("tut create")
                .padding()
        }
    }
    }
}

#Preview {
    CreateView()
}
