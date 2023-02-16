//
//  LetsStartScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct LetsStartScreen: View {
    var body: some View {
        ZStack{
            
            Image(uiImage: UIImage(named: AppImages.LetsStartBackgound)!)
                .resizable()
                .aspectRatio( contentMode: .fill)
            
            VStack{
                
                Spacer()
                HStack{

                    Image(uiImage: UIImage(named: AppImages.LetsStartImage1)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 100, height: 200)
                    
                    Spacer()

                }
                .padding(.top,20)
                
                HStack{
                    
                    Spacer()


                    Image(uiImage: UIImage(named: AppImages.letStartImage2)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 150, height: 150)
                    

                }
                .padding(.top,10)
                
                HStack{
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(AppColors.pinkMainColor)
                        .frame(width: 50, height: 50)
                        .padding(.trailing,30)


                   Spacer()
                    

                }
                .padding(.top,10)
                
                Spacer()
                
                Text("Find friends to chat for dating")
                    .foregroundColor(.black)
                    .font(AppFonts.ceraPro_24)
                    .fontWeight(.bold)
                
                Text("Sunday night alone, let's find friend for a date")
                    .foregroundColor(AppColors.textColor)
                    .font(AppFonts.ceraPro_16)
                    .padding(.top,10)

                
                NavigationLink(destination: {
                    HomeScreen()
                }, label: {
                    PinkButton(lable: "Lets Start")
                        .padding(20)
                })
              
                
               Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
}

