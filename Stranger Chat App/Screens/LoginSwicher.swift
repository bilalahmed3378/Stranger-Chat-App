//
//  LoginSwicher.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct LoginSwitcher: View {
    @State var isUserLoggedIn : Bool = false
    
    @State var isLoginView : Bool = false


    var body: some View {
        ZStack{
            if(self.isUserLoggedIn){
                
            }
            else{
                if(self.isLoginView){
                    SignupScreen(pushToSignup: self.$isLoginView)
                }
                else{
                    LogInScreen(pushToSignup: self.$isLoginView)
                }
            }
        }
    }
}
