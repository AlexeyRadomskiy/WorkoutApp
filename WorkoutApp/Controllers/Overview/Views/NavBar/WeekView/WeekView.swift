import UIKit

// MARK: - WeekView

final class WeekView: WABaseView {
	
	// MARK: - Properties
	
	private let stackView = UIStackView()
}

// MARK: - Extension

extension WeekView {
	
	override func setupViews() {
		super.setupViews()
		
		setupView(stackView)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
		stackView.spacing = 7.0
		stackView.distribution = .fillEqually
		
		var weekdays = Date.calendar.shortStandaloneWeekdaySymbols
		
		if Date.calendar.firstWeekday == 2 {
			let sunday = weekdays.remove(at: 0)
			weekdays.append(sunday)
		}
		
		weekdays.enumerated().forEach { index, name in
			let view = WeekDayView()
			view.configure(with: index, and: name)
			stackView.addArrangedSubview(view)
		}
	}
}
