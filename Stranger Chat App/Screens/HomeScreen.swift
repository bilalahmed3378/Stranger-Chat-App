//
//  HomeScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct HomeScreen: View {
    @State var search = ""
    var body: some View {
        ZStack{
            AppColors.appBackGroundColor
                .ignoresSafeArea(.all)
            VStack{
                
                //top bar
                HStack{
                    Image(systemName: "location.north")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                        .foregroundColor(.black)
                    
                    Text("Haripur, United States")
                        .foregroundColor(AppColors.textColor)
                        .font(AppFonts.ceraPro_14)
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: AppImages.bellIconBlack)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 16, height: 16)
                    
                }
                .padding(.top,10)
                
                HStack{
                    Text("Find Friends Nearby \nFor Dating")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_24)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top,10)
                
                HStack{
                    TextField("", text: self.$search)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    
                    Image(uiImage: UIImage(named: AppImages.filterIconWhite)!)
                        .resizable()
                        .aspectRatio( contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                    
                }
                .padding(.top,10)
                .padding(.bottom,5)
                
                ScrollView(.vertical, showsIndicators: false){
                    LazyVStack{
                        ForEach(0...2, id : \.self){ index in
                            VStack{
                                Image(uiImage: UIImage(named: AppImages.homeScreenImage1)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame( height: 340)
                                
                                VStack{
                                    HStack{
                                        Text("Janice Ramirez")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_16)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        Text("1.5 KM")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_16)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,10)
                                    
                                    HStack{
                                        Text("NYC , United states")
                                            .foregroundColor(AppColors.textColor)
                                            .font(AppFonts.ceraPro_16)
                                        
                                        Spacer()
                                        
                                      
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                    
                                    HStack{
                                        Spacer()
                                        
                                        
                                        Image(systemName: "multiply")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Circle().fill(.black))
                                        
                                        Spacer()

                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Circle().fill(AppColors.pinkMainColor))
                                        
                                        Spacer()

                                    }
                                    .padding(.bottom,20)
                                    
                                }
                                .background(Color.white)
                                
                            }
                            .background(RoundedRectangle(cornerRadius: 20))
                            .padding(.top,20)
                            
                            VStack{
                                Image(uiImage: UIImage(named: AppImages.homeScreenImage2)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame( height: 340)
                                
                                VStack{
                                    HStack{
                                        Text("Janice Ramirez")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_16)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        Text("1.5 KM")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_16)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,10)
                                    
                                    HStack{
                                        Text("NYC , United states")
                                            .foregroundColor(AppColors.textColor)
                                            .font(AppFonts.ceraPro_16)
                                        
                                        Spacer()
                                        
                                      
                                    }
                                    .padding(.leading,20)
                                    .padding(.trailing,20)
                                    .padding(.top,10)
                                    .padding(.bottom,10)
                                    
                                    HStack{
                                        Spacer()
                                        
                                        
                                        Image(systemName: "multiply")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Circle().fill(.black))
                                        
                                        Spacer()

                                        Image(systemName: "heart")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(.white)
                                            .padding()
                                            .background(Circle().fill(AppColors.pinkMainColor))
                                        
                                        Spacer()

                                    }
                                    .padding(.bottom,20)
                                    
                                }
                                .background( Color.white)
                                
                            }
                            .background(RoundedRectangle(cornerRadius: 20))
                            .padding(.top,20)
                        }
                    }
                   
                }
               
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            
        }
        .navigationBarHidden(true)
    }
}


