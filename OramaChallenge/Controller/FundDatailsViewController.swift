//
//  FundDatailsViewController.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import UIKit

class FundDatailsViewController: OramaDefaultViewController {
	private var fund: Fund!
	
	init(fundToShow fund: Fund) {
		super.init(nibName: nil, bundle: nil)
		self.fund = fund
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
    }
}
