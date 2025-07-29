import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @EnvironmentObject var auth: AuthViewModel
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert = false

    var body: some View {
        VStack(spacing: 20) {
            if auth.user != nil {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                TextField("Phone", text: $phone)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal)

                Button(action: {
                    auth.saveProfile(name: name, phone: phone) { error in
                        if let error = error {
                            alertMessage = error.localizedDescription
                        } else {
                            alertMessage = "Profile saved"
                        }
                        showAlert = true
                    }
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brand)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            } else {
                Text("Please log in first.")
            }
            Spacer()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage))
        }
    }
}

#Preview {
    NavigationView {
        ProfileView()
            .environmentObject(AuthViewModel())
    }
}
