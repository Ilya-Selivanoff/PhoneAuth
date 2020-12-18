//
//  Login.swift
//  PhoneAuth
//
//  Created by Илья Селиванов  on 18.12.2020.
//

import SwiftUI

struct Login: View {
   @StateObject var loginData = LoginViewModel()
    var body: some View {
        
        VStack {
            
            VStack {
                
                Text("Continue With Phone")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding()
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                
                Text("You'll receive a 4 digit code\n to verify next.")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                // Mobile Number Field...
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 6) {
                     
                        Text("Enter Your Number")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(loginData.phNo)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}) {
                        
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .background(Color("yellow"))
                            .cornerRadius(15)
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            Spacer()
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
    }
}
