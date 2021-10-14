//
//  FundRisk.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 14/10/21.
//

import Foundation
import UIKit

enum FundRisk {
	case scale1
	case scale2
	case scale3
	case scale4
	case scale5
	
	func getColor() -> UIColor {
		switch self {
		case .scale1: return UIColor.cyan
		case .scale2: return UIColor.green
		case .scale3: return UIColor.yellow
		case .scale4: return UIColor.orange
		case .scale5: return UIColor.red
		}
	}
	
	static func mapRisk(fundRisk: String) -> FundRisk {
		switch fundRisk {
		case "1", "2": return scale1
		case "3", "4": return scale2
		case "5", "6": return scale3
		case "7", "8": return scale4
		case "9", "10": return scale5
		default: return scale5
		}
	}
}
