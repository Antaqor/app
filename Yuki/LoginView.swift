import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert = false
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button(action: {
                auth.login(email: email, password: password) { error in
                    if let error = error {
                        alertMessage = error.localizedDescription
                    } else {
                        alertMessage = "Logged in successfully"
                    }
                    showAlert = true
                }
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brand)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertMessage))
        }
    }
}

#Preview {
    NavigationView {
        LoginView()
            .environmentObject(AuthViewModel())
    }
}
