//
//  LogInScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct LogInScreen: View {
    
    @StateObject var loginApi : LoginApi = LoginApi()
    
    @State var remmberMe : Bool = true

    @State var isUserLoggedIn = false


    @State var email : String = ""
    @State var password : String = ""
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    @State var toCreatedProfile : Bool = false


    

    
    @Binding var pushToSignup : Bool
    
    init (pushToSignup : Binding<Bool>){
        self._pushToSignup = pushToSignup
        
    }

    var body: some View {
        ZStack{
            
            NavigationLink(destination: MainTabContainer(isUserLoggedIn: self.$isUserLoggedIn), isActive: self.$isUserLoggedIn){
                EmptyView()
            }
            
            NavigationLink(destination: CreateProfileScreen(), isActive: self.$toCreatedProfile){
                EmptyView()
            }
            
           
            
            VStack{
                
                ScrollView(.vertical, showsIndicators: false){
                    Image(uiImage: UIImage(named: AppImages.appLogo)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 150 , height: 150)
                        .padding(.top,20)
                    
                    
                    HStack{
                        Text("Log in to your \nexisting account.")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_20)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    Group{
                      
                        
                        //email field
                        VStack{
                            HStack{
                                Text("Email")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            TextField("Enter your email", text: self.$email)
                                .padding(15)
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(AppColors.textColor))
                                .onChange(of: self.email) { newValue in
                                    self.email = newValue.limit(limit : 50)
                                }
                        }
                        .padding(.top,20)
                        
                        //password field
                        VStack{
                            HStack{
                                Text("Password")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            TextField("at least 8 characters", text: self.$password)
                                .padding(15)
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(AppColors.textColor))
                                .onChange(of: self.password) { newValue in
                                    self.password = newValue.limit(limit : 50)
                                }
                        }
                        .padding(.top,20)
                    }
                    
                    if(self.loginApi.isLoading){
                        ProgressView()
                            .padding(.top,20)
                            .onDisappear{
                               
                               
                               if(self.loginApi.isApiCallDone && self.loginApi.isApiCallSuccessful){
                                   
                                   
                                   if(self.loginApi.loginSuccessful){
                                       
                                       if(self.remmberMe){
                                           AppData().saveRememberMeData(email: self.email, password: self.password)
                                       }
                                       
                                       
                                       if(self.loginApi.apiResponse!.docs!.profileSetup == true){
                                           
                                           AppData().setRemeberMe(rememberMe: self.remmberMe)
                                           AppData().saveUserDetails(user: self.loginApi.apiResponse!.docs!)
                                           AppData().userLoggedIn()
                                           self.isUserLoggedIn = true
                                           
                                           
                                       }
                                       
                                       else{
                                           
                                           withAnimation{
                                               self.toCreatedProfile = true
                                               
                                           }
                                           
                                       }
                                       
                                       
                                   }
                                   else{
                                       
                                       
                                       self.toastMessage = "Email or password incorrent"
                                       self.showToast = true
                                   }
                               }
                               else if(self.loginApi.isApiCallDone && (!self.loginApi.isApiCallSuccessful)){
                                   self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                   self.showToast = true
                               }
                               
                           }
                    }
                    
                    else{
                        Button(action: {
                            
                            if(self.email.isEmpty){
                                self.toastMessage = "Please enter email."
                                self.showToast = true
                            }
                            else if(self.password.isEmpty){
                                self.toastMessage = "Please enter password."
                                self.showToast = true
                            }
                            else{
                                
                                self.loginApi.loginUser(email: self.email, password: self.password)
                                
                            }
                            
                        }, label: {
                            PinkButton(lable: "Login")
                                .padding(.top,20)
                        })
                    }
                  
                    
                  
                    
                    Spacer()
                    
                    HStack{
                        Text("New around here?")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_14)
                        
                        Button(action: {
                            self.pushToSignup = true
                            
                        }, label: {
                            Text("Sign up")
                                .foregroundColor(AppColors.pinkMainColor)
                                .font(AppFonts.ceraPro_14)
                            
                        })
                        
                        
                        
                    }
                    .padding(.top,20)
                    .padding(.bottom,30)
                }
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
        }
        .navigationBarHidden(true)
    }
}

