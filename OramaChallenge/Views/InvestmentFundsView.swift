//
//  InvestmentFundsView.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import UIKit

class InvestmentFundsView: UIView {
	private lazy var collectionView: UICollectionView = {
		let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
		collection.backgroundColor = .white
		return collection
	}()
	
	public var collectionViewDelegate: UICollectionViewDelegate? {
		willSet(newValue) {
			collectionView.delegate = newValue
		}
	}
	
	public var collectionViewDataSource: UICollectionViewDataSource? {
		willSet(newValue) {
			collectionView.dataSource = newValue
		}
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setupUI() {
		addSubview(collectionView)
		backgroundColor = .cyan
		collectionView.register(
			SingleFundCollectionViewCell.self,
			forCellWithReuseIdentifier: SingleFundCollectionViewCell.identifier
		)
		setupConstraints()
	}
	
	private func setupConstraints() {
		collectionView.anchor(
			top: (topAnchor, 0),
			right: (rightAnchor, 0),
			left: (leftAnchor, 0),
			bottom: (bottomAnchor, 0)
		)
	}
	
	public func reloadCollectionData() {
		DispatchQueue.main.async { [weak self] in
			guard let self = self else { return }
			self.collectionView.reloadData()
		}
	}
}
