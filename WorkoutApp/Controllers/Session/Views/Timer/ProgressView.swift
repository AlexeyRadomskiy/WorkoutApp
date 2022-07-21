import UIKit

// MARK: - ProgressView

extension TimerView {
	final class ProgressView: UIView {
		
		// MARK: - Methods
		
		func drawProgress(with percent: CGFloat) {
			layer.sublayers?.removeAll()
			
			let circleFrame = UIScreen.main.bounds.width - (15.0 + 40.0) * 2.0
			let radius = circleFrame / 2.0
			let center = CGPoint(x: radius, y: radius)
			let startAngle = -CGFloat.pi * 7.0 / 6.0
			let endAngle = CGFloat.pi * 1.0 / 6.0
			
			let circlePath = UIBezierPath(
				arcCenter: center,
				radius: radius,
				startAngle: startAngle,
				endAngle: endAngle,
				clockwise: true
			)
			
			let defaultCircleLayer = CAShapeLayer()
			defaultCircleLayer.path = circlePath.cgPath
			defaultCircleLayer.strokeColor = R.Colors.separator.cgColor
			defaultCircleLayer.lineWidth = 20.0
			defaultCircleLayer.strokeEnd = 1.0
			defaultCircleLayer.fillColor = UIColor.clear.cgColor
			defaultCircleLayer.lineCap = .round
			
			let circleLayer = CAShapeLayer()
			circleLayer.path = circlePath.cgPath
			circleLayer.strokeColor = R.Colors.active.cgColor
			circleLayer.lineWidth = 20.0
			circleLayer.strokeEnd = percent
			circleLayer.fillColor = UIColor.clear.cgColor
			circleLayer.lineCap = .round
			
			let dotAngle = CGFloat.pi * (7.0 / 6.0 - (8.0 / 6.0 * percent))
			let dotPoint = CGPoint(
				x: cos(-dotAngle) * radius + center.x,
				y: sin(-dotAngle) * radius + center.y
			)
			
			let dotPath = UIBezierPath()
			dotPath.move(to: dotPoint)
			dotPath.addLine(to: dotPoint)
			
			let bigDotLayer = CAShapeLayer()
			bigDotLayer.path = dotPath.cgPath
			bigDotLayer.fillColor = UIColor.clear.cgColor
			bigDotLayer.strokeColor = R.Colors.active.cgColor
			bigDotLayer.lineCap = .round
			bigDotLayer.lineWidth = 20.0
			
			let dotLayer = CAShapeLayer()
			dotLayer.path = dotPath.cgPath
			dotLayer.fillColor = UIColor.clear.cgColor
			dotLayer.strokeColor = UIColor.white.cgColor
			dotLayer.lineCap = .round
			dotLayer.lineWidth = 8.0
			
			let bardFrame = UIScreen.main.bounds.width - (15.0 + 40.0 + 25.0) * 2.0
			let barsRadius = bardFrame / 2.0
			
			let barsPath = UIBezierPath(
				arcCenter: center,
				radius: barsRadius,
				startAngle: startAngle,
				endAngle: endAngle,
				clockwise: true
			)
			
			let barsLayer = CAShapeLayer()
			barsLayer.path = barsPath.cgPath
			barsLayer.fillColor = UIColor.clear.cgColor
			barsLayer.strokeColor = UIColor.clear.cgColor
			barsLayer.lineWidth = 6.0
			
			let startBarRadius = barsRadius - barsLayer.lineWidth * 0.5
			let endBarRadius = startBarRadius + 6.0
			
			var angle: CGFloat = 7.0 / 6.0
			(1...9).forEach { _ in
				let barAngle = CGFloat.pi * angle
				let startBarPoint = CGPoint(
					x: cos(-barAngle) * startBarRadius + center.x,
					y: sin(-barAngle) * startBarRadius + center.y
				)
				
				let endBarPoint = CGPoint(
					x: cos(-barAngle) * endBarRadius + center.x,
					y: sin(-barAngle) * endBarRadius + center.y
				)
				
				let barPath = UIBezierPath()
				barPath.move(to: startBarPoint)
				barPath.addLine(to: endBarPoint)
				
				let barLayer = CAShapeLayer()
				barLayer.path = barPath.cgPath
				barLayer.fillColor = UIColor.clear.cgColor
				barLayer.strokeColor = angle >= (7.0 / 6.0 - (8.0 / 6.0 * percent))
				? R.Colors.active.cgColor : R.Colors.separator.cgColor
				barLayer.lineCap = .round
				barLayer.lineWidth = 4.0
				
				barsLayer.addSublayer(barLayer)
				
				angle -= 1.0 / 6.0
			}
			
			layer.addSublayer(defaultCircleLayer)
			layer.addSublayer(circleLayer)
			layer.addSublayer(bigDotLayer)
			layer.addSublayer(dotLayer)
			layer.addSublayer(barsLayer)
		}
		
	}
}
