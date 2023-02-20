//
//  ProfileScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 17/02/2023.
//

import SwiftUI

struct ProfileScreen: View {
    @State var seekBarValue : Int = 25
    @State var selectedInterest : Int = 0

    
    var body: some View {
        ZStack{
            VStack{
                //top bar
                HStack{
                    Spacer()
                    
                    Text("Profile")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_16)
                        .fontWeight(.bold)
                        .offset(x: 10)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.editIconPink)!)
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(width: 18, height: 18)
                    
                }
                .padding(.top,10)
                
               
                    VStack{
                        Image(uiImage: UIImage(named: AppImages.profilePicture)!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 75, height: 75)
                            .padding(.top,20)
                        
                        Text("Salman Ahmed")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_16)
                            .fontWeight(.bold)
                            .padding(.top,10)
                        
                        HStack{
                            Text("Nick Name")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                            Text("Salman Ahmed")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                                .fontWeight(.bold)
                        }
                        .padding(.top,20)
                        
                        HStack{
                            Text("Gender")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                            Text("Male")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                                .fontWeight(.bold)
                        }
                        .padding(.top,20)
                        
                        HStack{
                            Text("Age")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                            Text("18 years")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                                .fontWeight(.bold)
                        }
                        .padding(.top,20)
                        
                        HStack{
                            Text("Interest")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top,20)
                        
                        HStack{
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedInterest = 1
                                }
                            }, label: {
                                Text("Females")
                                    .foregroundColor(self.selectedInterest == 1 ? Color.white : .black )
                                    .font(AppFonts.ceraPro_14)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(self.selectedInterest == 1 ? AppColors.pinkMainColor : Color.gray.opacity(0.3)))
                            })
                           
                            
                            Button(action: {
                                withAnimation{
                                    self.selectedInterest = 2
                                }
                            }, label: {
                                Text("Males")
                                    .foregroundColor(self.selectedInterest == 2 ? Color.white : .black )
                                    .font(AppFonts.ceraPro_14)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(self.selectedInterest == 2 ? AppColors.pinkMainColor : Color.gray.opacity(0.3)))
                            })
                          
                            Button(action: {
                                withAnimation{
                                    self.selectedInterest = 3
                                }
                            }, label: {
                                Text("Others")
                                    .foregroundColor(self.selectedInterest == 3 ? Color.white : .black )
                                    .font(AppFonts.ceraPro_14)
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(self.selectedInterest == 3 ? AppColors.pinkMainColor : Color.gray.opacity(0.3)))
                            })
                           
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top,10)
                        
                        HStack{
                            Text("Age Range")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                            
                        }
                        .padding(.top,20)
                        
                        
                        SeekBar(lable: "", maxRange: 50, color: AppColors.pinkMainColor, value: self.$seekBarValue)
                        
                        
                    }
                
                Spacer()
            }
            .padding(.leading,20)
            .padding(.trailing,20)
        }
        .navigationBarHidden(true)
    }
}


