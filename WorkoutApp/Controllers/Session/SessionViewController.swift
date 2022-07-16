import UIKit

// MARK: - SessionViewController

class SessionViewController: BaseViewController {
	
	// MARK: - Properties
	
	private let timerView: BaseInfoView = {
		let view = BaseInfoView()
		
		return view
	}()
}

// MARK: - Extension

extension SessionViewController {
	
	override func setupViews() {
		super.setupViews()

		view.setupView(timerView)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
			timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15.0),
			timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
			timerView.heightAnchor.constraint(equalToConstant: 300.0)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		title = R.Strings.NavBar.session
		navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.session)
		
		addNavBarItem(at: .left, with: R.Strings.Session.navBarLeft)
		addNavBarItem(at: .right, with: R.Strings.Session.navBarRight)
	}
}
