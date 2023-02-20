//
//  LogInScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct LogInScreen: View {
    @State var email : String = ""
    @State var password : String = ""
    
    @Binding var pushToSignup : Bool
    
    init (pushToSignup : Binding<Bool>){
        self._pushToSignup = pushToSignup
        
    }

    var body: some View {
        ZStack{
            VStack{
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
                
                //Social sign up
                Group{
                    HStack{
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.facebookLogo)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing,3)
                        
                        Text("Login with Facbook")
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
                        
                        Text("Login with Google")
                            .foregroundColor(AppColors.pinkMainColor)
                            .font(AppFonts.ceraPro_14)
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .padding(.top,10)
                    
                    HStack{
                        Spacer()
                        Image(uiImage: UIImage(named: AppImages.phoneIconPink)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing,3)
                        
                        Text("Login with Phone")
                            .foregroundColor(AppColors.pinkMainColor)
                            .font(AppFonts.ceraPro_14)
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 7)
                    .padding(.top,10)
                    
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
            .padding(.leading,20)
            .padding(.trailing,20)
        }
        .navigationBarHidden(true)
    }
}

