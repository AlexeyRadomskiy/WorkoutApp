import UIKit

// MARK: - SessionViewController

class SessionViewController: WABaseViewController {
	
	// MARK: - Properties
	
	private let timerView = TimerView()
	
	private let timerDuration = 15.0
	
	// MARK: - Methods
	
	override func navBarLeftButtonHandler() {
		if timerView.state == .isStopped {
			timerView.startTimer()
		} else {
			timerView.pauseTimer()
		}
		
		timerView.state = timerView.state == .isRunning ? .isStopped : .isRunning
		addNavBarItem(
			at: .left,
			with: timerView.state == .isRunning
			? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart
		)
	}
	
	override func navBarRightButtonHandler() {
		timerView.stopTimer()
		timerView.state = .isStopped
		
		addNavBarItem(at: .left, with: R.Strings.Session.navBarStart)
	}
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
			timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		title = R.Strings.NavBar.session
		navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: Tabs.session)
		
		addNavBarItem(at: .left, with: R.Strings.Session.navBarStart)
		addNavBarItem(at: .right, with: R.Strings.Session.navBarFinish)
		
		timerView.configure(with: timerDuration, progress: 0.0)
		
		timerView.callBack = { [weak self] in
			DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
				self?.navBarRightButtonHandler()
			}
		}
	}
}
