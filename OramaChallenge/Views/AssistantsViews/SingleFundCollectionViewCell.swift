//
//  SingleFundCell.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class SingleFundCollectionViewCell: UICollectionViewCell {
	static var identifier = "SingleFundCollectionViewCell"
	
	private let nameLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	func config(fund: Fund) {
		self.backgroundColor = .white
		self.nameLabel.text = fund.simpleName
		self.contentView.addSubview(nameLabel)
		
		nameLabel.anchor(
			top: (contentView.topAnchor, 10),
			left: (contentView.leftAnchor, 20)
		)
	}
}
