import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                Spacer()

                Image(systemName: "house.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)

                Text("Welcome to Yuki")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                Spacer()
                VStack(spacing: 16) {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.brand)
                            .cornerRadius(12)
                    }
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.brand)
                            .cornerRadius(12)
                    }
                    NavigationLink(destination: LocationSelectionView()) {
                        Text("Choose Location")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.brand)
                            .cornerRadius(12)
                    }
                    NavigationLink(destination: ArtistSelectionView()) {
                        Text("Book Appointment")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.brand)
                            .cornerRadius(12)
                    }
                    NavigationLink(destination: ProfileView()) {
                        Text("Profile")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .foregroundColor(Color.brand)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.brand.ignoresSafeArea())
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
