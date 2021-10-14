//
//  InvestmentFundsViewController.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import UIKit

class InvestmentFundsViewController: OramaDefaultViewController {
	private let viewModel = InvestmentFundsViewModel()
	private lazy var fundsView: InvestmentFundsView = {
		return self.view as! InvestmentFundsView
	}()
	
	private var funds: Funds?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.getFunds()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.navigationItem.title = "Fundos disponíveis"
	}
	
	override func loadView() {
		self.view = InvestmentFundsView(frame: UIScreen.main.bounds)
		fundsView.collectionViewDataSource = self
		fundsView.collectionViewDelegate = self
	}
	
	private func goToFundDetails(_ fund: Fund) {
		self.navigationController?.pushViewController(FundDatailsViewController(fundToShow: fund), animated: true)
	}
}

extension InvestmentFundsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.funds?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SingleFundCollectionViewCell.identifier, for: indexPath) as? SingleFundCollectionViewCell else {
			return UICollectionViewCell()
		}
		
		if let fund = funds?[indexPath.row] { cell.config(fund: fund) }
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		if let fund = funds?[indexPath.row] {
			goToFundDetails(fund)
		}
	}
}

extension InvestmentFundsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
		let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right
		let size = Double(collectionView.bounds.width - totalSpace)
		
		return CGSize(width: size, height: size * 0.3)
	}
}

// MARK: Extensão para recarregar os dados quando houver um scroll up
extension InvestmentFundsViewController: UIScrollViewDelegate {
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let verticalContenteOffset = scrollView.contentOffset.y
		let minScrollPositionToReload: CGFloat = -100.0
		if verticalContenteOffset < minScrollPositionToReload { getFunds() }
	}
}

// MARK: Requisição dos fundos
extension InvestmentFundsViewController {
	private func getFunds() {
		self.showLoading()
		viewModel.getFunds { [weak self] result in
			guard let self = self else { return }
			self.hideLoading()
			switch result {
			case .success(let value):
				self.funds = Array(value[0..<6])
				
			case .failure(let error):
				self.handlerError(error) {
					self.getFunds()
				}
			}
			
			self.fundsView.reloadCollectionData()
		}
	}
}
