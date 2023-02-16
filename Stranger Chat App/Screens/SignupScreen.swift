//
//  SignupScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct SignupScreen: View {
    @State var email : String = ""
    
    @Binding var pushToSignup : Bool
    
    init (pushToSignup : Binding<Bool>){
        self._pushToSignup = pushToSignup
        
    }
    var body: some View {
        ZStack{
            VStack{
                
                Group{
                    Image(uiImage: UIImage(named: AppImages.appLogo)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 150 , height: 150)
                        .padding(.top,20)
                    
                    Text("Sign Up")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_24)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                //Social sign up
                Group{
                    HStack{
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.facebookLogo)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing,3)
                        
                        Text("Sign up with Facbook")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_14)
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .padding(.top,20)
                    
                    HStack{
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.googleLogo)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing,3)
                        
                        Text("Sign up with Google")
                            .foregroundColor(AppColors.pinkMainColor)
                            .font(AppFonts.ceraPro_14)
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .padding(.top,10)
                    
                    NavigationLink(destination: PhoneRegisrationScreen(), label: {
                        HStack{
                            Spacer()
                            Image(uiImage: UIImage(named: AppImages.phoneIconPink)!)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.trailing,3)
                            
                            Text("Sign up with Phone")
                                .foregroundColor(AppColors.pinkMainColor)
                                .font(AppFonts.ceraPro_14)
                            Spacer()
                        }
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 7)
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
            .padding(.leading,20)
            .padding(.trailing,20)
        }
        .navigationBarHidden(true)
    }
}

