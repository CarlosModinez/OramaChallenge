//
//  FundDatailsViewController.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import UIKit

class FundDatailsViewController: OramaDefaultViewController {
	private var fund: Fund!
	private lazy var detailView: FundDatailsView = {
		return self.view as! FundDatailsView
	}()
	
	init(fundToShow fund: Fund) {
		super.init(nibName: nil, bundle: nil)
		self.fund = fund
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupNavigationBar()
	}
	
	override func loadView() {
		self.view = FundDatailsView(frame: UIScreen.main.bounds, fund: fund)
	}
	
	private func setupNavigationBar() {
		self.navigationItem.title = "Detalhes sobre o fundo"
		self.navigationController?.navigationBar.tintColor = UIColor.gray;
		
		let backButton = UIBarButtonItem()
		backButton.title = ""
		
		self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
	}
}
