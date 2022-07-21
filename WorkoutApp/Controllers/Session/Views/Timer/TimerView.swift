import UIKit

// MARK: - TimerView

final class TimerView: WABaseInfoView {
	
	// MARK: - Properties
	
	private let progressView = ProgressView()
	
	private var timer = Timer()
	private var timerProgress: CGFloat = 0.0
	private var timerDuration = 0.0
	
	public var state: TimerState = .isStopped
	
	// MARK: - Methods
	
	func configure(with duration: Double, progress: Double) {
		timerDuration = duration
		
		let tempCurrentValue = progress > duration ? duration : progress
		
		let goalValueDevider = duration == 0 ? 1 : duration
		let percent = tempCurrentValue / goalValueDevider
		
		progressView.drawProgress(with: CGFloat(percent))
	}
	
	func startTimer() {
		timer.invalidate()
		
		timer = Timer.scheduledTimer(
			withTimeInterval: 0.01,
			repeats: true,
			block: { [weak self] timer in
				guard let self = self else { return }
				self.timerProgress += 0.01
				
				if self.timerProgress > self.timerDuration {
					self.timerProgress = self.timerDuration
					timer.invalidate()
				}
				
				self.configure(with: self.timerDuration, progress: self.timerProgress)
			})
	}
	
	func pauseTimer() {
		timer.invalidate()
	}
	
	func stopTimer() {
		guard self.timerProgress > 0 else { return }
		timer.invalidate()
		
		timer = Timer.scheduledTimer(
			withTimeInterval: 0.01,
			repeats: true,
			block: { [weak self] timer in
				guard let self = self else { return }
				self.timerProgress -= 0.1
				
				if self.timerProgress <= 0 {
					self.timerProgress = 0
					timer.invalidate()
				}
				
				self.configure(with: self.timerDuration, progress: self.timerProgress)
			})
	}
}

// MARK: - Override

extension TimerView {
	
	override func setupViews() {
		super.setupViews()
		
		setupView(progressView)
	}
	
	override func constraintViews() {
		super.constraintViews()
		
		NSLayoutConstraint.activate([
			progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40.0),
			progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40.0),
			progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.0),
			progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
		])
	}
	
	override func configureAppearance() {
		super.configureAppearance()
		
	}
	
}
