//
//  ContentView.swift
//  Login
//
//  Created by Mohammed Ibrahim on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var loginObj = LoginViewModel()
    @State private var email : String = "guruvarasu@mailinator.com"
    @State private var password : String = "Test@123"
    @State private var isSecure : Bool = true
    @State private var isLoading: Bool = false
    @FocusState private var isTapEmail: Bool
    @FocusState private var isTapPassword: Bool

    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                LinearGradient(colors: [Color.white , Color("LoginGradient")], startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .center , spacing: 35){
                    VStack(alignment: .leading , spacing: 35){
                     
                        
                        Image("Logo")
                        VStack(alignment: .leading, spacing: 15){
                            Text("Log in")
                                .font(.custom("Inter-SemiBold",size: 24))
                                .foregroundColor(Color("DarkGray"))
                            
                            Text("Welcome! Please enter your email.")
                                .font(.custom("Inter-Regular",size: 16))
                                .foregroundColor(Color("LightGray"))
                            
                        }
                        VStack(alignment: .leading , spacing: 15){
                            VStack(alignment: .leading ,  spacing: 12){
                                
                                Text("Email")
                                    .font(.custom("Inter-Medium",size: 14))
                                    .foregroundColor(Color("ThickLightGray"))
                                
                                ZStack(alignment: .center){
                                    if isTapEmail{
                                        VStack{
                                            Color.clear
                                        }
                                        .frame(height: 48)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24)
                                                .stroke(loginObj.isError ? Color.clear : isTapEmail ? Color("BorderLightBlue") : Color.clear , lineWidth: 4 )
                                                .foregroundColor(Color("BorderLightBlue"))
                                        )
                                        .padding([.leading , .trailing], -4)
                                    }
                                    else{
                                        RoundedRectangle(cornerRadius: 24)
                                            .frame(height: 48)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.clear)
                                            .padding([.leading , .trailing], -4)
                                    }
                                    VStack{
                                        TextField("Enter your email", text: $email)
                                            .frame(height: 44)
                                            .frame(maxWidth: .infinity)
                                            .padding([.leading ,.trailing] , 14)
                                            .autocorrectionDisabled(true)
                                            .textInputAutocapitalization(.never)
                                            .accentColor(Color("DarkGray"))
                                            .font(.custom("Inter-Regular",size: 16))
                                            .foregroundColor(Color("DarkGray"))
                                            .keyboardType(.emailAddress)
                                            .onChange(of: email){ n in
                                                email = email.lowercased()
                                            }
                                            .focused($isTapEmail)
                                        
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 22)
                                            .stroke(loginObj.isError ? Color("BorderRed") : isTapEmail ? Color("BorderBlue") : Color("BorderGray") , lineWidth: 2 )
                                    )
                                    .cornerRadius(22)
                                    .padding([.leading , .trailing], -2)
                                }
            
                            }
                            
                            VStack(alignment: .leading ,  spacing: 12){
                                
                                Text("Password")
                                    .font(.custom("Inter-Medium",size: 14))
                                    .foregroundColor(Color("ThickLightGray"))
                                
                                ZStack(alignment: .center){
                                    if isTapPassword{
                                        VStack{
                                            Color.clear
                                        }
                                        .frame(height: 48)
                                        .frame(maxWidth: .infinity)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24)
                                                .stroke(loginObj.isError ? Color.clear : isTapPassword ? Color("BorderLightBlue") : Color.clear , lineWidth: 4 )
                                                .foregroundColor(Color("BorderLightBlue"))
                                        )
                                        .padding([.leading , .trailing], -4)
                                    }
                                    else{
                                        RoundedRectangle(cornerRadius: 24)
                                            .frame(height: 48)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.clear)
                                            .padding([.leading , .trailing], -4)
                                    }
                                    VStack{
                                        HStack{
                                            
                                            if isSecure{
                                                
                                                SecureField("Enter Password", text: $password)
                                                
                                            }
                                            else{
                                                
                                                TextField("Enter Password", text: $password)
                                                
                                            }
                                            
                                            Spacer()
                                            
                                            Image( isSecure ? "pasword-show" : "pasword-hide")
                                                .onTapGesture {
                                                    self.isSecure.toggle()
                                                }
                                            
                                        }
                                        .frame(height: 44)
                                        .frame(maxWidth: .infinity)
                                        .padding([.leading ,.trailing] , 14)
                                        .autocorrectionDisabled(true)
                                        .accentColor(Color("DarkGray"))
                                        .font(.custom("Inter-Regular",size: 16))
                                        .foregroundColor(Color("DarkGray"))
                                        .focused( $isTapPassword)
                                        
                                    }
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 22)
                                            .stroke( loginObj.isError ? Color("BorderRed") : isTapPassword ? Color("BorderBlue") : Color("BorderGray") , lineWidth: 2 )
                                            
                                    )
                                    .cornerRadius(22)
                                    .padding([.leading , .trailing], -2)
                                   
                                }
                                
                        
                                    
                                Text(self.loginObj.isError ? "\(loginObj.message)" : "")
                                    .font(.custom("Inter-Regular",size: 14))
                                    .foregroundColor(Color("Red"))
                                   
                                
                                Button(action: {
                                    
                                    isLoading = true
                                    
                                    loginObj.login(email: email, password: password)
                                   
                                }, label: {
                                    
                                    Text("Log in")
                                    
                                        .foregroundColor(Color.white)
                                        .font(.custom("Inter-SemiBold", size: 16))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 48)
                                        .background(
                                            RoundedRectangle(cornerRadius: 24)
                                                .stroke(Color("ButtonColor") , lineWidth: 1))
                                        .background(Color("ButtonColor"))
                                        .cornerRadius(24)
                                        .padding(.top , 10)
                                })
                                .disabled(isLoading)
                               
                            }
                        }
                        
                        
                    }
                    HStack(spacing: 4){
                            
                            Text("Don't have an account?")
                                .font(.custom("Inter-Regular",size:  14))
                                .foregroundColor(Color("LightGray"))
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Sign up")
                                    .font(.custom("Inter-SemiBold",size:  14))
                            })
                    
                    }
                    Spacer()
                    
                }
                .navigationDestination(isPresented: $loginObj.navigationAccess){
                    
                    Home()
                    
                }
                .padding([.leading , .trailing] , 20)
                .padding([.top] , 50)
                .overlay(
                    
                    VStack{
                        
                        if self.isLoading{
                            
                            ZStack{
                                
                                Color.gray
                                    .ignoresSafeArea()
                                    .opacity(0.2)
                                
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                                
                                    .scaleEffect(1)
                            }
                        }
                    }
                    
                )
                
            }
            .ignoresSafeArea(.container , edges: .bottom)
            .onReceive(loginObj.$isResponse) { response in
                           
                           if response {
                               isLoading = false
                           }
                       }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
