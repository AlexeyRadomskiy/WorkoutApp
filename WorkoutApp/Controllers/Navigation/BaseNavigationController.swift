import UIKit

// MARK: - BaseNavigationController

final class BaseNavigationController: UINavigationController {
	
	// MARK: - Life cycles
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configure()
	}
	
	// MARK: - Private Methods
	
	private func configure() {
		view.backgroundColor = .white
		navigationBar.isTranslucent = false
		navigationBar.standardAppearance.titleTextAttributes = [
			.foregroundColor: R.Colors.titleGray,
			.font: R.Fonts.helveticaRegular(with: 17.0)
		]
		
		navigationBar.addBottomBorder(with: R.Colors.separator, height: 1.0)
	}
}
