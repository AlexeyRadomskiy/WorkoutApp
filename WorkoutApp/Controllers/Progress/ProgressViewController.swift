import UIKit

// MARK: - ProgressViewController

class ProgressViewController: WABaseViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}
}

// MARK: - Extension

extension ProgressViewController {
	
	override func setupViews() {
		super.setupViews()
		
	}
	
	override func constraintViews() {
		super.constraintViews()
		
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		title = R.Strings.NavBar.progress
		navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
		
		addNavBarItem(at: .left, with: R.Strings.Progress.navBarLeft)
		addNavBarItem(at: .right, with: R.Strings.Progress.navBarRight)
	}
}
