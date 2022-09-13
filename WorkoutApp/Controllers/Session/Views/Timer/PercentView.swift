import UIKit

extension TimerView {
	
	final class PercentView: WABaseView {
		
		// MARK: - Properties
		
		private let stackView: UIStackView = {
			let view = UIStackView()
			view.axis = .vertical
			view.distribution = .fillProportionally
			view.spacing = 5.0
			
			return view
		}()
		
		private let percentLabel: UILabel = {
			let label = UILabel()
			label.font = R.Fonts.helveticaRegular(with: 23.0)
			label.textColor = R.Colors.titleGray
			label.textAlignment = .center
			
			return label
		}()
		
		private let subTitleLabel: UILabel = {
			let label = UILabel()
			label.font = R.Fonts.helveticaRegular(with: 10.0)
			label.textColor = R.Colors.inactive
			label.textAlignment = .center
			
			return label
		}()
		
		// MARK: - Methods
		
		func configure(with title: String, andValue value: Int) {
			subTitleLabel.text = title
			percentLabel.text = "\(value)%"
		}
		
	}
	
}

// MARK: - Override Methods

extension TimerView.PercentView {
	
	override func setupViews() {
		super.setupViews()
		
		setupView(stackView)
		stackView.addArrangedSubview(percentLabel)
		stackView.addArrangedSubview(subTitleLabel)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
}
