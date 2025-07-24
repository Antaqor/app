import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Spacer()
                VStack(spacing: 8) {
                    Image(systemName: "house.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)

                    Text("Welcome to Yuki")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
                
                Text("Your next favorite app experience starts here.")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.horizontal)

                Spacer()
                VStack(spacing: 12) {
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.brand)
                            .foregroundColor(.white)
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
                            .background(Color.brand)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 40)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            )
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
