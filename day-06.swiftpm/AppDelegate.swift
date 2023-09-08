import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions
        launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        print(#function)
        return true
    }

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        let sessionRole = connectingSceneSession.role
        let configuration = UISceneConfiguration(
            name: nil,
            sessionRole: sessionRole
        )
        if sessionRole == .windowApplication {
            configuration.delegateClass = SceneDelegate.self
        }
        return configuration
    }
}
