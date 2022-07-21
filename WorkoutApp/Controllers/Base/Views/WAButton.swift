import UIKit

// MARK: - WAButton

final class WAButton: UIButton {
	
	// MARK: - Properties
	
	private var type: WAButtonType = .primary
	
	private let label: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		
		return label
	}()
	
	private let iconView: UIImageView = {
		let view = UIImageView()
		view.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
		
		return view
	}()
	
	// MARK: - Init
	
	init(with type: WAButtonType) {
		super.init(frame: .zero)
		self.type = type
		
		setupViews()
		constraintViews()
		configureAppearance()
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
		
		setupViews()
		constraintViews()
		configureAppearance()
	}
	
	func setTitle(_ title: String?) {
		label.text = title
	}
}

// MARK: - Private extension

private extension WAButton {
	
	func setupViews() {
		setupView(label)
		setupView(iconView)
	}
	
	func constraintViews() {
		var horisontalOffset: CGFloat {
			switch type {
			case .primary: return 0.0
			case .secondary: return 10.0
			}
		}
		
		NSLayoutConstraint.activate([
			iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
			iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
			iconView.heightAnchor.constraint(equalToConstant: 5.0),
			iconView.widthAnchor.constraint(equalToConstant: 10.0),
			
			label.centerYAnchor.constraint(equalTo: centerYAnchor),
			label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10.0),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
		])
	}
	
	func configureAppearance() {
		switch type {
		case .primary:
			label.textColor = R.Colors.inactive
			label.font = R.Fonts.helveticaRegular(with: 13.0)
			iconView.tintColor = R.Colors.inactive
		case .secondary:
			backgroundColor = R.Colors.secondary
			layer.cornerRadius = 14.0
			label.textColor = R.Colors.active
			label.font = R.Fonts.helveticaRegular(with: 15.0)
			iconView.tintColor = R.Colors.active
		}
		
		makeSystem(self)
	}
}
