//
//  TitleAndValueView.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class TitleAndValueView: UIView {
	public let title: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.font = UIFont.body2()
		return label
	}()
	
	public let value: UILabel = {
		let label = UILabel()
		label.font = UIFont.title2()
		label.textAlignment = .center
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		
		addSubview(title)
		addSubview(value)
		
		title.anchor(
			top: (topAnchor, 0),
			right: (rightAnchor, 0),
			left: (leftAnchor, 0)
		)
		
		value.anchor(
			top: (title.bottomAnchor, 4),
			right: (rightAnchor, 0),
			left: (leftAnchor, 0),
			bottom: (bottomAnchor, 0)
		)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
