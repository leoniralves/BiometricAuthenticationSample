//
//  TouchIdView.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import UIKit

class TouchIdView: UIView {
    
    private var viewModel: TouchIdViewModel!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func configure(viewModel: TouchIdViewModel) {
        self.viewModel = viewModel
    }
    
    private func setupView() {
        let btnTouchID = UIButton(type: .system)
        btnTouchID.setTitle("TouchID", for: .normal)
        btnTouchID.addTarget(self, action: #selector(actionTouchID), for: .touchUpInside)
        
        addSubview(btnTouchID)
        btnTouchID.translatesAutoresizingMaskIntoConstraints = false
        btnTouchID.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        btnTouchID.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    @objc private func actionTouchID() {
        viewModel.configureTouchID()
    }
}
