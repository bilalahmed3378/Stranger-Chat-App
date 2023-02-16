//
//  OnboardingScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct OnboardingScreen: View {
    var body: some View {
        ZStack{
            AppColors.appBackGroundColor
                .ignoresSafeArea(.all)
            
            VStack{
                
                Spacer()
                
                Image(uiImage: UIImage(named: AppImages.onboardingSvg)!)
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .frame(width: UIScreen.screenWidth - 40 , height: 400)
                    .padding(.top,20)
                
                Spacer()
                
                PinkButton(lable: "Get Started")
                    .padding(.top,20)
                
                NavigationLink(destination: {
                    LoginSwitcher(isLoginView: true)
                }, label: {
                    WhiteButton(lable: "Login")
                        .padding(.top,20)
                })
                   
            
               
               
                
                Spacer()
                
                HStack{
                    Text("New around here?")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_14)
                    
                    NavigationLink(destination: {
                        LoginSwitcher(isLoginView: false)

                    }, label: {
                        
                        Text("Sign up")
                            .foregroundColor(AppColors.pinkMainColor)
                            .font(AppFonts.ceraPro_14)
                            })
                   
                
                   
                    
                }
                .padding(.top,20)
               
                Spacer()
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
            
        }
    }
}

