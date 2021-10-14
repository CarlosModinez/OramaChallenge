//
//  Requests.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import Foundation

fileprivate struct OramaRequests {
	static let getFunds = "https://s3.amazonaws.com/orama-media/json/fund_detail_full.json"
}

class ApiRequest: NSObject, URLSessionDelegate, URLSessionDataDelegate {
	
	func getFunds(completionHandler: @escaping (Result<Funds, RequestError>) -> Void) {
		let config = URLSessionConfiguration.default
		config.waitsForConnectivity = true
		config.timeoutIntervalForRequest = 300
		let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
		
		guard let url = URL(string: OramaRequests.getFunds) else { return completionHandler(.failure(.invalidUrl)) }
		
		session.dataTask(with: url) { data, _, error in
			if let error = error as NSError?, error.code == -999 { return completionHandler(.failure(.noInternetConnection)) }
			guard let data = data else { return completionHandler(.failure(.responseError)) }
			
			do {
				let response = try JSONDecoder().decode(Funds.self, from: data)
				completionHandler(.success(response))
			} catch {
				completionHandler(.failure(.decodingError))
			}
		}.resume()
	}
	
	func getImageData(from url: String, completion: @escaping (Result<Data?, RequestError>) -> Void) {
		let config = URLSessionConfiguration.default
		config.waitsForConnectivity = true
		config.timeoutIntervalForRequest = 300
		let session = URLSession(configuration: config, delegate: self, delegateQueue: nil)
		
		guard let url = URL(string: url) else { return completion(.failure(.invalidUrl)) }
		
		session.dataTask(with: url) { data, _, error in
			if let error = error as NSError?, error.code == -999 { return completion(.failure(.noInternetConnection)) }
			completion(.success(data))
		}.resume()
	}
	
	
	func urlSession(_ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask) {
		task.cancel()
	}
}
