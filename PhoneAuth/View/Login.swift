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
                        
                        Text("+7 \(loginData.getCountryCode()) \(loginData.phNo)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer(minLength: 0)
                    
                    NavigationLink (destination: Verification(loginData: loginData)) {
                        
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .background(Color("yellow"))
                            .cornerRadius(15)
                    }
                    .disabled(loginData.phNo == "" ? true : false)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -5)
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            // Custom Number Pad...
            
            GeometryReader{reader in
                
                VStack {
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 20), count: 3), spacing: 15) {
                        
                        ForEach(rows, id: \.self) {value in
                            
                            Button(action: {buttonAction(value: value)}) {
                                
                                ZStack {
                                    
                                    if value == "delete.left" {
                                        
                                        Image(systemName: value)
                                            .font(.title2)
                                            .foregroundColor(.black)
                                        }
                                        else {

                                            Text(value)
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                    }
                                }
                                
                                .frame(width: getWidth(frame: reader.frame(in: .global)),
                                       height: getHeight(frame: reader.frame(in: .global)))
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            // disabling button for empty action...
                            .disabled(value == "" ? true : false)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
    }
    
    // getting height and width for sizing...
    
    func getWidth(frame: CGRect) -> CGFloat {
        
        let width = frame.width
        let actualWidth = width - 40
        return actualWidth / 3
        
    }
    
    func getHeight(frame: CGRect) -> CGFloat {
        
        let height = frame.height
        let actualHeight = height - 30
        return actualHeight / 4
    }
    
    func buttonAction(value: String) {
        
        if value == "delete.left" && loginData.phNo != "" {
            
            loginData.phNo.removeLast()
        }
        
        if value != "delete.left" {
            
            loginData.phNo.append(value)
        }
    }
}


// Number Data......

var rows = ["1","2","3","4","5","6","7","8","9","","0","delete.left"]
