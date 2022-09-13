import UIKit

// MARK: - Resources

enum R {
	
	// MARK: - Colors
	
	enum Colors {
		static let active = UIColor(hexString: "#437BFE")
		static let inactive = UIColor(hexString: "#929DA5")
		
		static let background = UIColor(hexString: "#F8F9F9")
		static let separator = UIColor(hexString: "#E8ECEF")
		static let secondary = UIColor(hexString: "#F0F3FF")
		
		static let titleGray = UIColor(hexString: "#545C77")
	}
	
	// MARK: - Strings
	
	enum Strings {
		enum TabBar {
			static func title(for tab: Tabs) -> String {
				switch tab {
				case .overview: return "Overview"
				case .session: return "Session"
				case .progress: return "Progress"
				case .settings: return "Settings"
				}
			}
		}
		
		enum NavBar {
			static let overview = "Today"
			static let session = "High Intensity Cardio"
			static let progress = "Workout Progress"
			static let settings = "Settings"
		}
		
		enum Overview {
			static let allWorkoutsButton = "All Workouts"
		}
		
		enum Session {
			static let navBarStart = "Start"
			static let navBarPause = "Pause"
			static let navBarFinish = "Finish"
			
			static let elapsedTime = "Elapsed Time"
			static let remainingTime = "Remaining Time"
			
			static let completedTitle = "COMPLETED"
			static let remainingTitle = "REMAINIG"
		}
		
		enum Progress {
			static let navBarLeft = "Export"
			static let navBarRight = "Details"
		}
	}
	
	// MARK: - Images
	
	enum Images {
		enum TabBar {
			static func icon(for tab: Tabs) -> UIImage? {
				switch tab {
				case .overview: return UIImage(named: "overviewTab")
				case .session: return UIImage(named: "sessionTab")
				case .progress: return UIImage(named: "progressTab")
				case .settings: return UIImage(named: "settingsTab")
				}
			}
		}
		
		enum Common {
			static let downArrow = UIImage(named: "downArrow")
			static let addButton = UIImage(named: "addButton")
		}
	}
	
	// MARK: - Fonts
	
	enum Fonts {
		static func helveticaRegular(with size: CGFloat) -> UIFont {
			UIFont(name: "Helvetica", size: size) ?? UIFont()
		}
	}
}
