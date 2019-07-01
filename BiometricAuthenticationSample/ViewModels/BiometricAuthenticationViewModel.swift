//
//  BiometricAuthenticationViewModel.swift
//  TouchIDSample
//
//  Created by Leonir Alves Deolindo on 28/06/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation
import LocalAuthentication

enum BiometricType: String {
    case faceID = "FaceID"
    case touchID = "TouchID"
    case passcode = "Passcode"
}

class BiometricAuthenticationViewModel {
    
    private(set) var title: String!
    lazy private var context = {
        return LAContext()
    }()
    
    init() {
        title = biometricType().rawValue
    }
    
    private func biometricType() -> BiometricType {
        var error: NSError?
        if !context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            debugPrint("A não pode ser realizada por biometria. Sendo assim será feita por passcode, caso o mesmo esteja configurado")
        }
        
        switch context.biometryType {
        case .faceID:
            return .faceID
        case .touchID:
            return .touchID
        default:
            return .passcode
        }
    }

    func configureTouchID(completion: @escaping ((_ error: AuthenticationError?) -> Void)) {
        let reasonString = "Teste de Autenticação biométrica"
        
        context.evaluatePolicy(.deviceOwnerAuthentication,
                               localizedReason: reasonString)
        { (success, error) in
            if success {
                completion(nil)
            } else {
                guard let error = error else {
                    return completion(.other)
                }
                
                switch error {
                case LAError.appCancel:
                    completion(.appCancel)
                case LAError.authenticationFailed:
                    completion(.authenticationFailed)
                case LAError.biometryLockout:
                    completion(.biometryLockout)
                case LAError.biometryNotAvailable:
                    completion(.biometryNotAvailable)
                case LAError.biometryNotEnrolled:
                    completion(.biometryNotEnrolled)
                default:
                    completion(.other)
                }
            }
        }
    }
}
