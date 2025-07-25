import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert = false
    @EnvironmentObject var auth: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 40)
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)
                .padding(.horizontal)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)
            Button(action: {
                auth.register(name: name, email: email, password: password) { error in
                    if let error = error {
                        alertMessage = error.localizedDescription
                    } else {
                        alertMessage = "Registered successfully"
                    }
                    showAlert = true
                }
            }) {
                Text("Register")
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
        RegisterView()
            .environmentObject(AuthViewModel())
    }
}
