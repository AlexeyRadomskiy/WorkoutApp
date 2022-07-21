import UIKit

// MARK: - BaseTabBarController

final class BaseTabBarController: UITabBarController {
	
	// MARK: - Init
	
	override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
		super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
		
		configureAppearance()
		switchTo(tab: .session)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods
	
	func switchTo(tab: Tabs) {
		selectedIndex = tab.rawValue
	}
	
	// MARK: - Private Methods
	
	private func configureAppearance() {
		tabBar.tintColor = R.Colors.active
		tabBar.barTintColor = R.Colors.inactive
		tabBar.backgroundColor = .white
		tabBar.layer.borderColor = R.Colors.separator.cgColor
		tabBar.layer.borderWidth = 1.0
		tabBar.layer.masksToBounds = true
		
		let viewControllers: [BaseNavigationController] = Tabs.allCases.map { tab in
			let viewController = BaseNavigationController(
				rootViewController: getViewController(for: tab)
			)
			viewController.tabBarItem = UITabBarItem(
				title: R.Strings.TabBar.title(for: tab),
				image: R.Images.TabBar.icon(for: tab),
				tag: tab.rawValue
			)
			
			return viewController
		}
		
		setViewControllers(viewControllers, animated: false)
	}
	
	private func getViewController(for tab: Tabs) -> WABaseViewController {
		switch tab {
		case .overview: return OverviewViewController()
		case .session: return SessionViewController()
		case .progress: return ProgressViewController()
		case .settings: return SettingsViewController()
		}
	}
}
