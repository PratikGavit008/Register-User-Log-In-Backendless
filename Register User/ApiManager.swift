//
//  ApiManager.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import Foundation
import Alamofire
import UIKit

class ApiManager {
    static let shared = ApiManager()
    private init () {}
    
    func registerUser(parms : RegisterModel, completionHandler: @escaping (Bool,String)->Void) {
        let url = registerUrl
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request(url, method: .post, parameters: parms, encoder: JSONParameterEncoder.default, headers: headers).response {
            responce in
            switch responce.result {
            case .success(let data):
                if let data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data)
                        print(json)
                        if responce.response?.statusCode == 200 {
                            completionHandler(true, "User registred Succesfully")
                        } else {
                            let error = try? JSONDecoder().decode(AuthError.self, from: data)
                            let msg = error?.message
                            completionHandler(false, msg ?? "")
                        }
                    } catch  {
                        completionHandler(false, error.localizedDescription)
                    }
                }
            case .failure(let err):
                completionHandler(false, err.localizedDescription)
            }
        }
    }
    
    
    func logInUser(parameter:LogInModel,completionHandler: @escaping (Bool,String)->Void){
        let url = logInUrl
        let headears: HTTPHeaders = [.contentType("application/json")]
        AF.request(url, method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: headears).response {
            responce in
            switch responce.result {
            case .success(let data):
                do {
                    if let data {
                        let json = try JSONSerialization.jsonObject(with: data)
                        let token = (json as AnyObject).value(forKey: "user-token") as? String
                        TokenService.shared.storeToken(token: token ?? "")
                        if responce.response?.statusCode == 200 {
                            completionHandler(true, "Log In success")
                        } else {
                            let m = try? JSONDecoder().decode(AuthError.self, from: data)
                            let msg = m?.message
                            completionHandler(false, msg!)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func logOut(vc:UIViewController){
        let url = logOutUrl
        let headers: HTTPHeaders = ["user-token" : TokenService.shared.getToken()]
        AF.request(url, method: .get, headers: headers).response {
            responce in
            switch responce.result{
            case .success( _ ):
                TokenService.shared.deleteToken()
                guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                        let window = scene.windows.first else {
                        return
                    }
                let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
                let navVC = UINavigationController(rootViewController: newVC)
                    window.rootViewController = navVC
                    window.makeKeyAndVisible()
                

            case . failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
