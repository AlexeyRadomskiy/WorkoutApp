import UIKit

// MARK: - UIView

extension UIView {
	
	// MARK: - Methods
	
	func addBottomBorder(with color: UIColor, height: CGFloat) {
		let separator = UIView()
		separator.backgroundColor = color
		separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		separator.frame = CGRect(
			x: 0.0,
			y: frame.height - height,
			width: frame.width,
			height: height
		)
		addSubview(separator)
	}
	
	func makeSystem(_ button: UIButton) {
		button.addTarget(self, action: #selector(handleIn), for: [
			.touchDown,
			.touchDragInside
		])
		
		button.addTarget(self, action: #selector(handleOut), for: [
			.touchDragOutside,
			.touchUpInside,
			.touchUpOutside,
			.touchDragExit,
			.touchCancel
		])
	}
	
	func setupView(_ view: UIView) {
		addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
	}
	
	// MARK: - Objc Methods
	
	@objc func handleIn() {
		UIView.animate(withDuration: 0.15) { self.alpha = 0.55 }
	}
	
	@objc func handleOut() {
		UIView.animate(withDuration: 0.15) { self.alpha = 1.0 }
	}
}
