import UIKit

// MARK: - OverviewViewController

class OverviewViewController: WABaseViewController {
	
	// MARK: - Properties
	
	private let navBar = OverviewNavBar()
}

// MARK: - Extension

extension OverviewViewController {
	
	override func setupViews() {
		super.setupViews()
		
		view.setupView(navBar)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			navBar.topAnchor.constraint(equalTo: view.topAnchor),
			navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		navigationController?.navigationBar.isHidden = true
	}
}
