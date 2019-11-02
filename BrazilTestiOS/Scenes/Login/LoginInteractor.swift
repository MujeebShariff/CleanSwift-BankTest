//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic
{
  func login(request: Login.LoginModel.Request)
}

protocol LoginDataStore
{
    var userDetails: UserAccount? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    
  var presenter: LoginPresentationLogic?
  var worker: LoginWorker?
    var userDetails: UserAccount?
  //var name: String = ""
  
  // MARK: Do something
  
    func login(request: Login.LoginModel.Request) {
        let user = request.user
        let password = request.password
        worker = LoginWorker()
        worker?.login(username: user!, password: password!) { (success, response, error) in
            
            if(success){
                UserPersistance().saveUserId("\(response!.userAccount.userId)")
            }
            let response = Login.LoginModel.Response(success: success, loginResponse: response!)
            self.userDetails = response.loginResponse.userAccount
            self.presenter?.presentLoginResult(response: response)
        }
    }
}