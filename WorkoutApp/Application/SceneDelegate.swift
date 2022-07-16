import UIKit

// MARK: - SceneDelegate

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	// MARK: - Properties
	
	var window: UIWindow?
	
	// MARK: - Methods
	
	func scene(
		_ scene: UIScene,
		willConnectTo session: UISceneSession,
		options connectionOptions: UIScene.ConnectionOptions
	) {
		let tabBarController = BaseTabBarController()
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		window?.windowScene = windowScene
		window?.rootViewController = tabBarController
		window?.makeKeyAndVisible()
	}
}
