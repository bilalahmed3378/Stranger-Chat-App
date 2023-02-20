//
//  MessageScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 20/02/2023.
//

import SwiftUI

struct MessageScreen: View {
    @Environment(\.presentationMode) var presentationMode

    @State var showSearch : Bool = false
    @State var search = ""

    var body: some View {

        ZStack{
            
            VStack{
                //top bar
                HStack{
                   
                    Spacer()
                    
                    Text("Messages")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_20)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation{
                            self.showSearch.toggle()
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)
                        
                    })
                   
                   
                    
                }
                .padding(.top,10)
                
                if(self.showSearch){
                    HStack{
                        TextField("Search", text: self.$search)
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        
                        
                    }
                    .padding(.top,10)
                    .padding(.bottom,5)
                }
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            Text("Available chat")
                                .foregroundColor(AppColors.textColor)
                                .font(AppFonts.ceraPro_16)
                            Spacer()
                        }
                        .padding(.top,20)
                            
                            Divider()
                                .padding(.top,5)
                            
                            
                        ForEach(0...4, id: \.self){index in
                            
                            NavigationLink(destination: {
                                SingleChatScreen()
                            }, label: {
                                HStack{
                                    Image(uiImage: UIImage(named: AppImages.messageImage)!)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 70, height: 70)
                                        .clipShape(Circle())

                                    VStack(alignment: .leading){
                                        HStack{
                                            Text("Libra shetty")
                                                .foregroundColor(.black)
                                                .font(AppFonts.ceraPro_20)
                                                .fontWeight(.bold)
                                            Spacer()
                                            
                                            Circle()
                                                .foregroundColor(AppColors.pinkMainColor)
                                                .frame(width: 10, height: 10)
                                            
                                            Text("01:45 PM")
                                                .foregroundColor(.black)
                                                .font(AppFonts.ceraPro_14)
                                        }
                                        
                                        HStack{
                                            Text("lorem ipsum dolor sit amet consectetur Vitae ul")
                                                .foregroundColor(AppColors.textColor)
                                                .font(AppFonts.ceraPro_14)
                                                
                                            
                                            Spacer()
                                            
                                           
                                        }
                                    }
                                    .padding(.leading,3)
                                    
                                    Spacer()
                                }
                                .padding(.top,10)
                            })
                          
                            
                            Divider()
                                .padding(.top,10)
                                .padding(.bottom,10)
                        }
                        
                        
                        HStack{
                            Text("Requested Chat")
                                .foregroundColor(AppColors.textColor)
                                .font(AppFonts.ceraPro_16)
                            Spacer()
                        }
                        .padding(.top,20)
                            
                            Divider()
                                .padding(.top,5)
                        
                        ForEach(0...1, id: \.self){index in
                            HStack{
                                
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 70, height: 70)
                                    .cornerRadius(100)
                                
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Libra shetty")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_20)
                                            .fontWeight(.bold)
                                        Spacer()
                                        
                                       
                                        
                                        Text("01:45 PM")
                                            .foregroundColor(.black)
                                            .font(AppFonts.ceraPro_14)
                                    }
                                    
                                    HStack{
                                        Text("New Message Request")
                                            .foregroundColor(AppColors.textColor)
                                            .font(AppFonts.ceraPro_14)
                                            
                                        
                                        Spacer()
                                        
                                       
                                    }
                                }
                                .padding(.leading,3)
                                
                                Spacer()
                            }
                            .padding(.top,10)
                            
                            Divider()
                                .padding(.top,10)
                                .padding(.bottom,10)
                        }
                            
                            
                        
                    }
                }
                
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
            .padding(.bottom,70)
            
        }
        .navigationBarHidden(true)
    }
}

