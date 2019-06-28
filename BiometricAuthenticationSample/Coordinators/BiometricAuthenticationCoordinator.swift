//
//  BiometricAuthenticationCoordinator.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class BiometricAuthenticationCoordinator: Coordinator {
    
    private var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        guard let presenter = self.presenter else {
            return
        }
        
        let viewModel = BiometricAuthenticationViewModel()
        let touchIdViewController = BiometricAuthenticationViewController(viewModel: viewModel)
        presenter.show(touchIdViewController, sender: nil)
    }
}
