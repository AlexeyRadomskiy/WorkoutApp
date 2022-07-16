import UIKit

// MARK: - BaseInfoView

class BaseInfoView: BaseView {
	
	// MARK: - Properties
	
	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = R.Fonts.helveticaRegular(with: 12.0)
		label.textColor = R.Colors.inactive
		
		return label
	}()
	
	private let contentView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.borderColor = R.Colors.separator.cgColor
		view.layer.borderWidth = 1.0
		view.layer.cornerRadius = 5.0
		
		return view
	}()
	
	// MARK: - Init
	
	init(with title: String? = nil, alignment: NSTextAlignment = .left) {
		titleLabel.text = title?.uppercased()
		titleLabel.textAlignment = alignment
		
		super.init(frame: .zero)
	}
	
	required init?(coder: NSCoder) {
		super.init(frame: .zero)
	}
}

// MARK: - Extension

extension BaseInfoView {
	
	override func setupViews() {
		super.setupViews()
	
		setupView(titleLabel)
		setupView(contentView)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil
		? topAnchor
		: titleLabel.bottomAnchor
		
		let contentTopOffset: CGFloat = titleLabel.text == nil
		? 0.0
		: 10.0
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.topAnchor.constraint(equalTo: topAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			
			contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentTopOffset),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		backgroundColor = .clear
	}
}
