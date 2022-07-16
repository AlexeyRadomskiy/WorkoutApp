import Foundation

// MARK: - Date

extension Date {
	
	// MARK: - Properties
	
	var startOfWeek: Date {
		let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
		guard let firstDay = calendar.date(from: components) else { return self }
		return calendar.date(byAdding: .day, value: 1, to: firstDay) ?? self
	}
	
	private var calendar: Calendar {
		Calendar.current
	}
	
	// MARK: - Methods
	
	func agoForward(to days: Int) -> Date {
		calendar.date(byAdding: .day, value: days, to: self) ?? self
	}
	
	func stripTime() -> Date {
		let components = calendar.dateComponents([.year, .month, .day], from: self)
		return calendar.date(from: components) ?? self
	}
}
