//
//  FundDatailsView.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class FundDatailsView: UIView {
	private var fund: Fund!
	
	private let contentView: UIScrollView = {
		let view = UIScrollView()
		return view
	}()
	
	private let fundNameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = UIFont.title1()
		label.textAlignment = .center
		return label
	}()
	
	private let initialDateView: TitleAndValueView = {
		let titleAndValue = TitleAndValueView()
		return titleAndValue
	}()
	
	private let minimumAplicationView: TitleAndValueView = {
		let titleAndValue = TitleAndValueView()
		return titleAndValue
	}()
	
	private let thumnailImageView: UIImageView = {
		let image = UIImageView()
		return image
	}()
	
	private let fundDescriptionView: FundDescriptionWithDecorationView = {
		let view = FundDescriptionWithDecorationView()
		return view
	}()
	
	convenience init(frame: CGRect, fund: Fund) {
		self.init(frame: frame)
		self.fund = fund
		self.setupUI()
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupUI() {
		self.backgroundColor = UIColor.backgroundGray()
		
		fundNameLabel.text = fund.fullName
		
		if let description = fund.fundManager?.fundManagerDescription,
		   let risk = fund.specification?.fundRiskProfile?.name?.suffix(1) {
			fundDescriptionView.setText(description)
			fundDescriptionView.setColor(FundRisk.mapRisk(fundRisk: String(risk)).getColor())
		}
		
		if let initialDate = fund.initialDate {
			initialDateView.title.text = "Data de criação do fundo"
			initialDateView.value.text = initialDate
		}
		
		if let minimumValue = fund.operability?.minimumInitialApplicationAmount {
			minimumAplicationView.title.text = "Valor mínimo de aplicação"
			minimumAplicationView.value.text = minimumValue
		}
		
		addSubview(contentView)
		contentView.addSubview(fundNameLabel)
		contentView.addSubview(initialDateView)
		contentView.addSubview(minimumAplicationView)
		contentView.addSubview(thumnailImageView)
		contentView.addSubview(fundDescriptionView)
		
		setupConstraints()
	}
	
	private func setupConstraints() {
		contentView.anchor(
			top: (safeAreaLayoutGuide.topAnchor, 0),
			right: (self.rightAnchor, 0),
			left: (self.leftAnchor, 0),
			bottom: (safeAreaLayoutGuide.bottomAnchor, 0)
		)
		
		fundNameLabel.anchor(
			top: (contentView.topAnchor, 40),
			right: (rightAnchor, 40),
			left: (leftAnchor, 40)
		)
		
		initialDateView.anchor(
			top: (fundNameLabel.bottomAnchor, 25),
			right: (rightAnchor, 20),
			left: (leftAnchor, 20)
		)
		
		minimumAplicationView.anchor(
			top: (initialDateView.bottomAnchor, 15),
			right: (rightAnchor, 20),
			left: (leftAnchor, 20)
		)
		
		thumnailImageView.anchor(
			top: (minimumAplicationView.bottomAnchor, 25),
			right: (rightAnchor, 20),
			left: (leftAnchor, 20)
		)
		
		fundDescriptionView.anchor(
			top: (thumnailImageView.bottomAnchor, 20),
			right: (rightAnchor, 30),
			left: (leftAnchor, 30),
			bottom: (contentView.bottomAnchor, 20)
		)
	}
}
