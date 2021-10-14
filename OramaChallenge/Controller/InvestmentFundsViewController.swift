//
//  InvestmentFundsViewController.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import UIKit

class InvestmentFundsViewController: OramaDefaultViewController {
	private let viewModel = InvestimentFundsViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel.getFunds { response in
			switch response {
			case .success(let funds)
			}
		}
	}
}
