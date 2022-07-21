import SwiftUI
import shared

struct NewsScreen: View {
    
    @ObservedObject private var viewModel = NewsViewModel()

	var body: some View {
        List(viewModel.news, id: \.self.url) { item in
            VStack(alignment: .leading) {
                Text(item.title ?? "No title")
                Text(item.author ?? "No author")
                    .foregroundColor(Color.gray)
            }
            .padding()
        }
        .listStyle(.plain)
	}
}

struct NewsScreen_Previews: PreviewProvider {
	
    static var previews: some View {
        NewsScreen()
	}
}
