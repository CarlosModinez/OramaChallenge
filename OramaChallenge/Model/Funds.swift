//
//  Funds.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import Foundation

struct Funds: Codable {
	let simpleName, fullName, initialDate: String
	let strategyVideo: StrategyVideo
	let fundManager: FundManager
	let operability: Operability
	let specification: Specification

	enum CodingKeys: String, CodingKey {
		case simpleName = "simple_name"
		case fullName = "full_name"
		case initialDate = "initial_date"
		case strategyVideo = "strategy_video"
		case fundManager = "fund_manager"
		case operability, specification
	}
}

struct FundManager: Codable {
	let fundManagerDescription: String

	enum CodingKeys: String, CodingKey {
		case fundManagerDescription = "description"
	}
}

struct Operability: Codable {
	let minimumInitialApplicationAmount: String

	enum CodingKeys: String, CodingKey {
		case minimumInitialApplicationAmount = "minimum_initial_application_amount"
	}
}

struct Specification: Codable {
	let fundRiskProfile: FundRiskProfile

	enum CodingKeys: String, CodingKey {
		case fundRiskProfile = "fund_risk_profile"
	}
}

struct FundRiskProfile: Codable {
	let name: String
}

struct StrategyVideo: Codable {
	let thumbnail: String
}
