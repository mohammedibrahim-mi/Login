//
//  Home.swift
//  Login
//
//  Created by Mohammed Ibrahim on 05/10/23.
//

import SwiftUI

struct Home: View {
    @State private var selection = 1
    
    var body: some View {
        VStack{
            
            TabView(selection: $selection){
                
                
                Text("Home")
                
                
                    .tabItem {
                        selection == 1 ? Image("home-active") : Image("home-inactive")
                        Text("Home")
                    }
                    .tag(1)
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .background(Color.white)
                    .padding(.top  , 0.2)
                
                
                VStack{
                    
                    Text("Fiat & Spot")
                }
                
                    .tabItem {
                        
                        selection == 2 ? Image("fiat-spot-active") : Image("fiat-spot-inactive")
                        Text("Fiat & Spot")
                        
                    }
                    .tag(2)
                    .frame(maxWidth: .infinity , maxHeight: .infinity)
                    .background(Color.white)
                    .padding(.top  , 0.2)
                
                
                
                VStack{
                    
                    Text("Operations")
                }
                .tabItem {
                    
                    selection == 3 ? Image("operations-active") : Image("operations-inactive")
                    Text("Operations")
                    
                }
                .tag(3)
                .frame(maxWidth: .infinity , maxHeight: .infinity)
                .background(Color.white)
                .padding(.top  , 0.2)
                
                
                VStack{
                    
                    Text("Transactions")
                    
                }
                .tabItem {
                    
                    selection == 4 ? Image("transaction-active") : Image("transaction-inactive")
                    Text("Transactions")
                    
                }
                .frame(maxWidth: .infinity , maxHeight: .infinity)
                .background(Color.white)
                .padding(.top  , 0.2)
                .tag(4)
                
            }
            
        }
    }
}

#Preview {
    Home()
}
