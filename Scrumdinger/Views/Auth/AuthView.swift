import SwiftUI
import Firebase
import FirebaseAuth

struct AuthView: View {
    var onAuthentication: (Bool) -> Void
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignUp: Bool = false
    @State private var errorMessage: String?
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Welcome to Scrumdinger")
                .font(.largeTitle)
                .padding()
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if isSignUp {
                TextField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            
            Button(isSignUp ? "Sign Up" : "Sign In") {
                if isSignUp {
                    signUp()
                } else {
                    signIn()
                }
            }
            .padding()
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
            
            Button(isSignUp ? "Sign In" : "Sign Up") {
                isSignUp.toggle()}.padding()
            Text(isSignUp ? "Already have an account?" :  "Don't have an account?" ).font(.subheadline).fontWeight(.light)
            
        }.padding()
    }
    
    // Implement your Firebase authentication methods
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = "Sign-in error: \(error.localizedDescription)"
            } else {
                onAuthentication(true)
            }
        }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                errorMessage = "Sign-up error: \(error.localizedDescription)"
            } else {
                onAuthentication(true)
            }
        }
    }
}

#Preview {
    AuthView(onAuthentication: { authenticated in
        return
    })
}
