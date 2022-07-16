import UIKit

// MARK: - BaseView

class BaseView: UIView {
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupViews()
		constraintViews()
		configureAppearance()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Objc extension

@objc extension BaseView {
	
	func setupViews() {}
	func constraintViews() {}
	func configureAppearance() {
		backgroundColor = .white
	}
}
