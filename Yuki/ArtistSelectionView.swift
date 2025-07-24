import SwiftUI

struct Artist: Identifiable {
    let id: Int
    let name: String
}

struct ArtistSelectionView: View {
    private let artists = [
        Artist(id: 1, name: "Zulaa"),
        Artist(id: 2, name: "Ari"),
        Artist(id: 3, name: "Azaa"),
        Artist(id: 4, name: "Saran")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Select Artist")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 32)

            ForEach(artists) { artist in
                NavigationLink(destination: ScheduleView(artist: artist.name)) {
                    Text(artist.name)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .navigationTitle("Artists")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ArtistSelectionView()
    }
}
