import UIKit

// MARK: - SecondaryButton

final class SecondaryButton: UIButton {
	
	// MARK: - Properties
	
	private let label = UILabel()
	private let iconView = UIImageView()
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addViews()
		layoutViews()
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Methods
	
	func setTitle(_ title: String) {
		label.text = title
	}
}

// MARK: - Private extension

private extension SecondaryButton {
	
	func addViews() {
		setupView(label)
		setupView(iconView)
	}
	
	func layoutViews() {
		NSLayoutConstraint.activate([
			iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
			iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
			iconView.heightAnchor.constraint(equalToConstant: 5.0),
			iconView.widthAnchor.constraint(equalToConstant: 10.0),
			
			label.centerYAnchor.constraint(equalTo: centerYAnchor),
			label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0)
		])
	}
	
	func configure() {
		backgroundColor = R.Colors.secondary
		layer.cornerRadius = 14.0
		makeSystem(self)
		
		label.textColor = R.Colors.active
		label.textAlignment = .center
		label.font = R.Fonts.helveticaRegular(with: 15.0)
		
		iconView.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
		iconView.tintColor = R.Colors.active
	}
}
