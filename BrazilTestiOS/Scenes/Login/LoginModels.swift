//
//  LoginModels.swift
//  BrazilTestiOS
//
//  Created by Mujeeb Ulla Shariff on 01/11/19.
//  Copyright (c) 2019 Mujeeb Ulla Shariff. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Login
{
  // MARK: Use cases
  
  enum LoginModel
  {
    struct Request
    {
        var user: String?
        var password: String?
    }
    struct Response
    {
        var success: Bool
        var loginResponse: LoginResponse
    }
    struct ViewModel
    {
        let success: Bool
        let loginResponse: LoginResponse
    }
  }
}