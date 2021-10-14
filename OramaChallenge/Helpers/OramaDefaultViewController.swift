//
//  OramaDefaultViewController.swift
//  OramaChallenge
//
//  Created by Carlos Roberto Modinez Junior on 13/10/21.
//

import UIKit

class OramaDefaultViewController: UIViewController {
	private let mainView: UIView = {
		let view = UIView(frame: UIScreen.main.bounds)
		view.backgroundColor = .white
		
		return view
	}()
	private lazy var loadingView: UIView = {
		let loadIndicator = UIActivityIndicatorView()
		let loadView = UIView()
		
		loadView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
		loadView.layer.cornerRadius = 10
		loadView.addSubview(loadIndicator)
		loadIndicator.anchor(
			centerX: (loadView.centerXAnchor, 0),
			centerY: (loadView.centerYAnchor, 0)
		)
		
		loadIndicator.startAnimating()
		
		return loadView
	}()
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view = view
    }
	
	override func loadView() {
		self.view = mainView
	}
}


// MARK: Tratamento de exceções
extension OramaDefaultViewController {
	func handlerError(_ error: RequestError, onTap: (() -> Void)? = nil) {
		let description: String
		
		switch error {
		case .decodingError, .responseError, .invalidUrl: description = "Erro genérico"
		case .noInternetConnection: description = "Falta de internet"
		}
		
		let alertController = UIAlertController(
			title: NSLocalizedString("Aconteceu um erro", comment:""),
			message: NSLocalizedString(description, comment:""),
			preferredStyle: .alert)
		
		let defaultAction = UIAlertAction(title: "Ok", style: .default) { dialog in
			onTap?()
		}
		
		alertController.addAction(defaultAction)
		DispatchQueue.main.async { self.present(alertController, animated: true, completion: nil) }
	}
}

extension OramaDefaultViewController {
	public func showLoading() {
		DispatchQueue.main.async {
			self.view.addSubview(self.loadingView)
			self.loadingView.anchor(
				centerX: (self.view.centerXAnchor, 0),
				centerY: (self.view.centerYAnchor, 0),
				height: 150,
				width: 200
			)
		}
	}
	
	public func hideLoading() {
		DispatchQueue.main.async {
			self.loadingView.removeFromSuperview()
		}
	}
}
