//
//  BiometricAuthenticationViewController.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class BiometricAuthenticationViewController: UIViewController {
    
    lazy private var touchIdView = {
       return BiometricAuthenticationView()
    }()
    
    // Mark: - Lifecycle
    override func loadView() {
        super.loadView()
        view = touchIdView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Mark: - Constructors
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(viewModel: BiometricAuthenticationViewModel) {
        super.init(nibName: nil, bundle: nil)
        touchIdView.configure(viewModel: viewModel)
        title = viewModel.title
    }
}
