//
//  AuthenticationError.swift
//  BiometricAuthenticationSample
//
//  Created by Leonir Alves Deolindo on 01/07/19.
//  Copyright © 2019 Leonir Alves Deolindo. All rights reserved.
//

import Foundation

enum AuthenticationError: Error {
    case appCancel
    case authenticationFailed
    case biometryLockout
    case biometryNotAvailable
    case biometryNotEnrolled
    case other
}
