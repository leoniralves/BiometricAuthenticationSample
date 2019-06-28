//
//  TouchIDCoordinator.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class TouchIDCoordinator: Coordinator {
    
    private var presenter: UINavigationController?
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        guard let presenter = self.presenter else {
            return
        }
        
        let viewModel = TouchIdViewModel()
        let touchIdViewController = TouchIDViewController(viewModel: viewModel)
        presenter.show(touchIdViewController, sender: nil)
    }
}
