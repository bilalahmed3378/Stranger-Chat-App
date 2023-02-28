//
//  SignupScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct SignupScreen: View {
    @StateObject var resgisterApi : RegisterApi = RegisterApi()

    @State var email : String = ""
    
    @Binding var pushToSignup : Bool
    
    @State var name  = ""
    @State var password  = ""
    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""
    
    init (pushToSignup : Binding<Bool>){
        self._pushToSignup = pushToSignup
        
    }
    var body: some View {
        ZStack{
           
                
                VStack{
                    
                    ScrollView(.vertical, showsIndicators: false){
                    
                    Group{
                        Image(uiImage: UIImage(named: AppImages.appLogo)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 150 , height: 150)
                            .padding(.top,20)
                        
                        Text("Sign Up")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_20)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                        
                        
                        Group{
                            //name field
                            VStack{
                                HStack{
                                    Text("Name")
                                        .foregroundColor(.black)
                                        .font(AppFonts.ceraPro_16)
                                        .fontWeight(.bold)
                                    Spacer()
                                }
                                
                                TextField("Enter your name", text: self.$name)
                                    .padding(15)
                                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(AppColors.textColor))
                                    .onChange(of: self.name) { newValue in
                                        self.name = newValue.limit(limit : 50)
                                    }
                            }
                            .padding(.top,30)
                            
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
                    
                    
//                        //Social sign up
//                        Group{
//                            HStack{
//                                Spacer()
//                                Image(uiImage: UIImage(named: AppImages.facebookLogo)!)
//                                    .resizable()
//                                    .aspectRatio( contentMode: .fit)
//                                    .frame(width: 20, height: 20)
//                                    .padding(.trailing,3)
//
//                                Text("Sign up with Facbook")
//                                    .foregroundColor(.black)
//                                    .font(AppFonts.ceraPro_14)
//                                Spacer()
//                            }
//                            .padding()
//                            .background(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 7)
//                            .padding(.top,20)
//
//                            HStack{
//                                Spacer()
//                                Image(uiImage: UIImage(named: AppImages.googleLogo)!)
//                                    .resizable()
//                                    .aspectRatio( contentMode: .fit)
//                                    .frame(width: 20, height: 20)
//                                    .padding(.trailing,3)
//
//                                Text("Sign up with Google")
//                                    .foregroundColor(AppColors.pinkMainColor)
//                                    .font(AppFonts.ceraPro_14)
//                                Spacer()
//                            }
//                            .padding()
//                            .background(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 7)
//                            .padding(.top,10)
//
//                            NavigationLink(destination: PhoneRegisrationScreen(), label: {
//                                HStack{
//                                    Spacer()
//                                    Image(uiImage: UIImage(named: AppImages.phoneIconPink)!)
//                                        .resizable()
//                                        .aspectRatio( contentMode: .fit)
//                                        .frame(width: 20, height: 20)
//                                        .padding(.trailing,3)
//
//                                    Text("Sign up with Phone")
//                                        .foregroundColor(AppColors.pinkMainColor)
//                                        .font(AppFonts.ceraPro_14)
//                                    Spacer()
//                                }
//                                .padding()
//                                .background(.white)
//                                .cornerRadius(10)
//                                .shadow(radius: 7)
//                                .padding(.top,10)
//                            })
//
//
//                        }
//
                        
                        if(self.resgisterApi.isLoading){
                            ProgressView()
                                .onDisappear{
                                    if(self.resgisterApi.isApiCallDone && self.resgisterApi.isApiCallSuccessful){
                                        
                                        if(self.resgisterApi.registerSuccessful){
                                            self.pushToSignup = false

                                        }
                                        else if (self.resgisterApi.emailAlreadyInUse){
                                            self.toastMessage = "This email already taken. Please try different email."
                                            self.showToast = true
                                        }
                                        
                                    }
                                    else if(self.resgisterApi.isApiCallDone && (!self.resgisterApi.isApiCallSuccessful)){
                                        self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                        self.showToast = true
                                    }
                                }
                        }
                        
                        else{
                            Button(action: {
                                
                                if (self.email.isEmpty){
                                    self.toastMessage = "Please enter email"
                                    self.showToast = true
                                }
                                else if (self.isValidEmail(email: self.email)){
                                    self.toastMessage = "Email seems invalid. Please enter valid email address"
                                    self.showToast = true
                                }
                                else if (self.password.isEmpty){
                                    self.toastMessage = "Please enter password"
                                    self.showToast = true
                                }
                                else if !(self.isValidPassword()){
                                    self.toastMessage = "Password must be at least 8 characters long and must contains one special charater and number."
                                    self.showToast = true
                                }
                                
                                
                                else{
                                    self.resgisterApi.registerUser(name: self.name, email: self.email, password: self.password)
                                }
                                
                            }, label: {
                                PinkButton(lable: "Signup")
                                    .padding(.top,10)
                            })
                        }
                       
                        
                        Spacer()
                        
                        
                        
                        
                        HStack{
                            Text("Already have an account?")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_14)
                            
                            Button(action: {
                                self.pushToSignup = false
                            }, label: {
                                Text("Login")
                                    .foregroundColor(AppColors.pinkMainColor)
                                    .font(AppFonts.ceraPro_14)
                                
                            })
                            
                            
                            
                        }
                        .padding(.top,10)
                        
                        
                        Group{
                            Divider()
                                .padding(.top,20)
                            
                            Spacer()
                                .frame(height: 30)
                            
                            VStack{
                                Text("You are completely safe.")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_14)
                                
                                Text("Read our Terms & Conditions")
                                    .foregroundColor(AppColors.pinkMainColor)
                                    .font(AppFonts.ceraPro_14)
                                
                            }
                            
                            Spacer()
                                .frame(height: 30)
                        }
                    }
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,5)
            
            
            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
           
        }
        .navigationBarHidden(true)
    }
    
    func isValidPassword() -> Bool {
        // least one digit
        // least one lowercase
        // least one symbol
        //  min 8 characters total
        let password = self.password.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
        
    }
    
    
    
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return !emailTest.evaluate(with: email)
    }
}

