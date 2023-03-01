//
//  OnboardingScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct OnboardingScreen: View {
    @State var isLoggedIn : Bool = false


    var body: some View {
        ZStack{
            AppColors.appBackGroundColor
                .ignoresSafeArea(.all)
            
            if(self.isLoggedIn){
                NavigationLink(destination: MainTabContainer(isUserLoggedIn: self.$isLoggedIn), isActive: self.$isLoggedIn){
                    EmptyView()
                }
            }
            
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
                    LoginSwitcher(isLoginView: false)
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
                        LoginSwitcher(isLoginView: true)

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
        .onAppear{
            self.isLoggedIn = AppData().isUserLoggedIn()

        }
    }
}

