//
//  LoginModel.swift
//  Login
//
//  Created by Mohammed Ibrahim on 05/10/23.
//



import SwiftUI

import Combine

class LoginViewModel: ObservableObject {

    @Published var navigationAccess : Bool = false
    @Published var success: Bool = false
    @Published var message : String = ""
    @Published var isError : Bool = false
    @Published var isResponse : Bool = false
     
    
    private var baseURL : String = "https://new.demozab.com//api/public/api/"
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(email: String, password: String){
        
        navigationAccess = true
        
        let params = ["email" : email,"password" : password , "type" : "app"]
        

        guard let url = URL(string: baseURL + "login")
        else {
            
            return
        }
        
//        AF.request( url, method: .post, parameters: params,  headers: nil )
//            .publishDecodable(type: LoginModel.self)
//            .compactMap{response in
//                response.value
//            }
//            .receive(on: DispatchQueue.main)
//            .sink(receiveCompletion: {completion in
//                
//                switch completion{
//                    
//                case .finished:
//                    break
//                case .failure(let error):
//                    print("Error : \(error)")
//                    self.navigationAccess = false
//                    self.isError = true
//                }
//                
//            }, receiveValue: {responseData in
//             
//                    self.isResponse = true
//                
//                    if responseData != nil {
//                        
//                        if responseData.success{
//                            
//                            UserDefaults.standard.set(responseData.data?.accessToken, forKey: "token")
//                            
//                            self.navigationAccess = true
//                            self.isError = false
//                            
//                        }
//                        else{
//                            print("Failed")
//                            
//                            self.navigationAccess = false
//                            
//                            if let res = responseData.message{
//                                
//                                self.message = res
//                            }
//                            else{
//                                
//                            }
//                            
//                            self.isError = true
//                            
//                        }
//                        
//                    }
//                    else{
//                        
//                        print("Invalid response data")
//                        self.navigationAccess = false
//                        self.isError = true
//                    }
//                
//            })
//            .store(in: &self.cancellables)

    }
}
