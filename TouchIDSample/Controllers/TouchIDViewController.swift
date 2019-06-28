//
//  TouchIDViewController.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class TouchIDViewController: UIViewController {
    
    lazy private var touchIdView = {
       return TouchIdView()
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

    init(viewModel: TouchIdViewModel) {
        super.init(nibName: nil, bundle: nil)
        touchIdView.configure(viewModel: viewModel)
        title = viewModel.title
    }
}

