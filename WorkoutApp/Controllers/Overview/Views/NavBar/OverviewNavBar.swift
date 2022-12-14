import UIKit

// MARK: - OverviewNavBar

final class OverviewNavBar: WABaseView {
	
	// MARK: - Properties
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = R.Strings.NavBar.overview
		label.textColor = R.Colors.titleGray
		label.font = R.Fonts.helveticaRegular(with: 22.0)
		
		return label
	}()
	
	private let allWorkoutsButton: WAButton = {
		let button = WAButton(with: .secondary)
		button.setTitle(R.Strings.Overview.allWorkoutsButton)
		
		return button
	}()
	
	private let addButton: UIButton = {
		let button = UIButton()
		button.setImage(R.Images.Common.addButton, for: .normal)
		
		return button
	}()
	
	private let weekView = WeekView()
	
	// MARK: - Life cycles
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		addBottomBorder(with: R.Colors.separator, height: 1.0)
	}
	
	// MARK: - Properties
	
	func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
		allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
	}
	
	func addAdditingAction(_ action: Selector, with target: Any?) {
		addButton.addTarget(target, action: action, for: .touchUpInside)
	}
}

// MARK: - Extension

extension OverviewNavBar {
	
	override func setupViews() {
		super.setupViews()
		
		setupView(titleLabel)
		setupView(allWorkoutsButton)
		setupView(addButton)
		setupView(weekView)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8.0),
			addButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15.0),
			addButton.heightAnchor.constraint(equalToConstant: 28.0),
			addButton.widthAnchor.constraint(equalToConstant: 28.0),
			
			allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
			allWorkoutsButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15.0),
			
			titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: allWorkoutsButton.leadingAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
			
			weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15.0),
			weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15.0),
			weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15.0),
			weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15.0),
			weekView.heightAnchor.constraint(equalToConstant: 47.0)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		backgroundColor = .white
	}
}
