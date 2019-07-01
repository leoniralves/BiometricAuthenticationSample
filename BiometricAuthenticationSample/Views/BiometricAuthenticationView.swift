//
//  BiometricAuthenticationView.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class BiometricAuthenticationView: UIView {
    
    private var viewModel: BiometricAuthenticationViewModel!
    private var btnTouchID: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func configure(viewModel: BiometricAuthenticationViewModel) {
        self.viewModel = viewModel
        btnTouchID.setTitle(viewModel.title, for: .normal)
    }
    
    private func setupView() {
        btnTouchID = UIButton(type: .system)
        btnTouchID.addTarget(self, action: #selector(actionTouchID), for: .touchUpInside)
        
        addSubview(btnTouchID)
        btnTouchID.translatesAutoresizingMaskIntoConstraints = false
        btnTouchID.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnTouchID.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc private func actionTouchID() {
        viewModel.configureTouchID { error in
            if let error = error {
                debugPrint(error)
            } else {
                debugPrint("Segue o fluxo ;-)")
            }
        }
    }
}
