import Foundation

// MARK: - Tabs

enum Tabs: Int, CaseIterable {
	case overview
	case session
	case progress
	case settings
}

// MARK: - NavBarPosition

enum NavBarPosition {
	case left
	case right
}

// MARK: - WAButtonType

public enum WAButtonType {
	case primary
	case secondary
}

// MARK: - TimerState

enum TimerState {
	case isRunning
	case isPaused
	case isStopped
}
