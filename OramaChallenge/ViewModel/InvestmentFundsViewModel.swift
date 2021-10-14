//
//  InvestmentFundsViewModel.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import Foundation
class InvestmentFundsViewModel {
	private let repository = ApiRequest()
	
	func getFunds(completion: @escaping (Result<Funds, RequestError>) -> Void) {
		repository.getFunds { response in
			completion(response)
		}
	}
	
	func getThumbailImage(fund: Fund, completion: @escaping (Result<Data?, RequestError>) -> Void) {
		if let thumbnailUrl = fund.strategyVideo?.thumbnail {
			repository.getImageData(from: thumbnailUrl) { response in
				completion(response)
			}
		}
	}
}
