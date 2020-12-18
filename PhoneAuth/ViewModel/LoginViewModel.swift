//
//  LoginViewModel.swift
//  PhoneAuth
//
//  Created by Илья Селиванов  on 16.12.2020.
//

import SwiftUI

class LoginViewModel: ObservableObject {
   
    @Published var phNo = ""
    
    @Published var code = ""
    
    // getting country Phone Code...
    
    func getCountryCode() -> String {
        
        let regionCode = Locale.current.regionCode ?? ""
        return countries[regionCode] ?? ""
    }
}
