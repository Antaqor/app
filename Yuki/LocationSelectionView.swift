import SwiftUI

struct Location: Identifiable {
    let id: Int
    let name: String
}

struct LocationSelectionView: View {
    @State private var selectedLocation: Int?

    private let locations = [
        Location(id: 1, name: "Их дэлгүүрийн баруун талд"),
        Location(id: 2, name: "Чингис зочид буудал"),
        Location(id: 3, name: "Санто Апартмент"),
        Location(id: 4, name: "VIP Center")
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text("Салбараа сонгоно уу")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 32)

            ForEach(locations) { location in
                Button(action: { selectedLocation = location.id }) {
                    HStack {
                        Text(location.name)
                            .foregroundColor(selectedLocation == location.id ? .white : .primary)
                        Spacer()
                        if selectedLocation == location.id {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(selectedLocation == location.id ? Color.brand : Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
            }

            Spacer()
        }
        .navigationTitle("Locations")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        LocationSelectionView()
    }
}
