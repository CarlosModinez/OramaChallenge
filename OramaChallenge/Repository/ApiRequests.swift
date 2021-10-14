//
//  Requests.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import Foundation

class ApiRequest {
	private let networkMonitor = NetworkMonitor.shared
	private let urlToRequest = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
	
	func getFunds(completionHandler: @escaping (Result<Funds, RequestError>) -> Void) {
		guard networkMonitor.isReachable else { return completionHandler(.failure(.noInternetConnection)) }
		guard let url = URL(string: urlToRequest) else { return completionHandler(.failure(.invalidUrl)) }
		
		let task = URLSession.shared.dataTask(with: url) { data, _, error in
			guard let data = data else { return completionHandler(.failure(.responseError)) }
			do {
				let response = try JSONDecoder().decode(Funds.self, from: data)
				completionHandler(.success(response))
			} catch {
				completionHandler(.failure(.decodingError))
			}
		}

		task.resume()
	}
}
