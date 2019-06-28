//
//  TouchIdViewModel.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation
import LocalAuthentication

class TouchIdViewModel {
    
    private(set) var title: String!
    
    init() {
        title = "TouchID"
    }

    func configureTouchID() {
        let context = LAContext()
        let reasonString = "Test de Autenticação biométrica por TouchID"
        
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            debugPrint("A não pode ser realizada por biometria. Sendo assim será feita por passcode, caso o mesmo esteja configurado")
        }
        
        context.evaluatePolicy(.deviceOwnerAuthentication,
                               localizedReason: reasonString)
        { (success, error) in
            if success {
                debugPrint("Sucesso")
            } else {
                if let error = error {
                    debugPrint(error)
                }
            }
        }
    }
}
