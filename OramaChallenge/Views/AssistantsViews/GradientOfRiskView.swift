//
//  GradientOfRiskView.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class GradientOfRiskView: UIView {
	private let viewTitleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.title1()
		label.text = AppStrings.shared.riskScaleTitle
		return label
	}()
	
	private let riskScaleView: UIView = {
		let marginSize: CGFloat = 20
		
		let view = UIView(
			frame: CGRect(x: 0, y: 0,
				width: UIScreen.main.bounds.width - marginSize * 2,
				height: 10
			))
		
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = view.bounds
		gradientLayer.colors = [
			FundRisk.getColor(.scale1)().cgColor,
			FundRisk.getColor(.scale2)().cgColor,
			FundRisk.getColor(.scale3)().cgColor,
			FundRisk.getColor(.scale4)().cgColor,
			FundRisk.getColor(.scale5)().cgColor
		]
		
		gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
		gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
		gradientLayer.cornerRadius = 2
		
		view.layer.insertSublayer(gradientLayer, at: 0)

		return view
	}()
	
	private let smallerIndicatorLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.title2()
		label.text = AppStrings.shared.riskScaleSmaller
		return label
	}()
	
	private let biggerIndicatorLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.title2()
		label.text = AppStrings.shared.riskScaleBigger
		label.textAlignment = .right
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupUI() {
		self.backgroundColor = .backgroundGray()
		
		addSubview(viewTitleLabel)
		addSubview(riskScaleView)
		addSubview(smallerIndicatorLabel)
		addSubview(biggerIndicatorLabel)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		viewTitleLabel.anchor(
			top: (topAnchor, 10),
			right: (rightAnchor, 20),
			left: (leftAnchor, 20)
		)
		
		riskScaleView.anchor(
			top: (viewTitleLabel.bottomAnchor, 12),
			right: (viewTitleLabel.rightAnchor, 0),
			left: (viewTitleLabel.leftAnchor, 0),
			height: 10
		)

		smallerIndicatorLabel.anchor(
			top: (riskScaleView.bottomAnchor, 9),
			left: (riskScaleView.leftAnchor, 0)
		)
		
		biggerIndicatorLabel.anchor(
			top: (riskScaleView.bottomAnchor, 9),
			right: (riskScaleView.rightAnchor, 0)
		)
	}
}
