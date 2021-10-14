//
//  File.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import Foundation

extension String {
	mutating func toCurrency() -> String {
		return "R$ \(self.replacingOccurrences(of: ".", with: ","))"
	}
	
	mutating func toDate() -> String {
		return self.split(separator: "-").reversed().joined(separator: "/")
	}
}
