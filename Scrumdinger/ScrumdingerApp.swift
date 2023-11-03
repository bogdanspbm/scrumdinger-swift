import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct ScrumdingerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    @State private var isAuthenticated: Bool = false
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isAuthenticated {
                    // If the user is authenticated, navigate to ScrumsView
                    ScrumsView(scrums: $scrums)
                } else {
                    // If the user is not authenticated, show AuthView
                    AuthView(onAuthentication: { authenticated in
                        isAuthenticated = authenticated
                    })
                }
            }
        }
    }
}
