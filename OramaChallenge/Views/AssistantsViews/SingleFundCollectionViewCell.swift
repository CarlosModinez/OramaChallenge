//
//  SingleFundCell.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class SingleFundCollectionViewCell: UICollectionViewCell {
	static var identifier = "SingleFundCollectionViewCell"
	
	private let backView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 10
		view.layer.borderWidth = 0.5
		view.layer.borderColor = UIColor.lightGray.cgColor
		view.backgroundColor = .white
		
		return view
	}()
	
	private let nameLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = UIFont.boldSystemFont(ofSize: 16)
		return label
	}()
	
	private let minimumApplication: UILabel = {
		let label = UILabel()
		label.font = UIFont.body2()
		return label
	}()
	
	private let riskProfileView: UIView = {
		let view = UIView()
		view.layer.cornerRadius = 5
		view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
		
		return view
	}()
	
	func config(fund: Fund) {
		if let risk = fund.specification?.fundRiskProfile?.name?.suffix(1) {
			riskProfileView.backgroundColor = FundRisk.mapRisk(fundRisk: String(risk)).getColor()
		}
		
		self.nameLabel.text = fund.simpleName
		if var minimumApplication = fund.operability?.minimumInitialApplicationAmount {
			self.minimumApplication.text = "Aplicação minima: \(minimumApplication.toCurrency())"
		}
		
		self.contentView.addSubview(backView)
		backView.addSubview(riskProfileView)
		backView.addSubview(nameLabel)
		backView.addSubview(minimumApplication)

		backView.anchor(
			top: (contentView.topAnchor, 4),
			right: (contentView.rightAnchor, 16),
			left: (contentView.leftAnchor, 16),
			bottom: (contentView.bottomAnchor, 4)
		)
		
		riskProfileView.anchor(
			top: (backView.topAnchor, 10),
			left: (backView.leftAnchor, 0),
			bottom: (backView.bottomAnchor, 10),
			width: 4
		)
		
		nameLabel.anchor(
			right: (backView.rightAnchor, 20),
			left: (backView.leftAnchor, 20),
			centerY: (backView.centerYAnchor, -10)
		)
		
		minimumApplication.anchor(
			top: (nameLabel.bottomAnchor, 5),
			right: (backView.rightAnchor, 20),
			left: (backView.leftAnchor, 20)
		)
	}
}
