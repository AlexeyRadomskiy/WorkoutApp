import UIKit

// MARK: - BaseViewController

class BaseViewController: UIViewController {
	
	// MARK: - Life cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
		constraintViews()
		configureAppearance()
	}
}

// MARK: - Objc extension

@objc extension BaseViewController {
	
	func setupViews() {}
	
	func constraintViews() {}
	
	func configureAppearance() {
		view.backgroundColor = R.Colors.background
	}
	
	func navBarLeftButtonHandler() {
		print("NavBar left button tapped")
	}
	
	func navBarRightButtonHandler() {
		print("NavBar right button tapped")
	}
}

// MARK: - Extension

extension BaseViewController {
	
	func addNavBarItem(at position: NavBarPosition, with title: String) {
		let button = UIButton(type: .system)
		button.setTitle(title, for: .normal)
		button.setTitleColor(R.Colors.active, for: .normal)
		button.setTitleColor(R.Colors.inactive, for: .disabled)
		button.titleLabel?.font = R.Fonts.helveticaRegular(with: 17.0)
		
		switch position {
		case .left:
			button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
			navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
		case .right:
			button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
			navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
		}
	}
}
