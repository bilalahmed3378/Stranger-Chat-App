//
//  SingleChatScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 20/02/2023.
//

import SwiftUI

struct SingleChatScreen: View {
    @Environment(\.presentationMode) var presentationMode

    @State var messageText : [String] = []
    @State var message = ""
    var body: some View {
        ZStack{
            VStack{
                // top bar
                HStack{
                    
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .foregroundColor(.black)
                    })
                    
                    
                    HStack(alignment: .top){
                        
                        Image(uiImage: UIImage(named: AppImages.messageImage)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                            .padding(.leading,20)
                           
                        
                        
                        VStack(alignment:.leading){
                            
                            Text("Libra shetty")
                                .font(AppFonts.ceraPro_18)
                                .foregroundColor(.black)
                                .padding(.top,5)
                            
                           
                            
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                   
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    LazyVStack{
                        
                        //received
                        HStack(alignment: .top){
                            
                            
                            Image(uiImage: UIImage(named: AppImages.messageImage)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                                .clipShape(Circle())
                            
                            
                            HStack{
                                
                                
                                VStack(alignment: .trailing , spacing: 1){
                                    
                                    Text("Hello this is me. to theek ho gaya. tesre ma dum chothy ma ghoom poyo oil")
                                        .font(AppFonts.ceraPro_14)
                                        .foregroundColor(Color.black)
                                        .frame(minWidth: 80,alignment: .leading)
                                    
                                    
                                    Text("09:45")
                                        .font(AppFonts.ceraPro_12)
                                        .foregroundColor(Color.black)
                                    
                                    
                                    
                                }
                                .padding(5)
                                .background(RoundedRectangle(cornerRadius: 8).fill(.gray.opacity(0.2)))
                                
                                Spacer()
                                
                            }
                            .frame(width: (UIScreen.widthBlockSize * 70))
                          
                            
                            Spacer()
                            
                        }
                        .padding(.leading,20)
                        .padding(.top,5)
                        .padding(.bottom,5)
                        
                        ForEach(self.messageText.indices, id:\.self) { messages in
                            //send
                            HStack(alignment: .top){
                                
                                Spacer()
                                
                                HStack{
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing , spacing: 1){
                                        
                                        Text("\(self.messageText[messages])")
                                            .font(AppFonts.ceraPro_14)
                                            .foregroundColor(Color.black)
                                            .frame(minWidth: 80,alignment: .leading)
                                        
                                        HStack{
                                            
                                            Text("09:10")
                                                .font(AppFonts.ceraPro_12)
                                                .foregroundColor(Color.black)
                                            
                                            
                                            
                                           
                                           
                                            
                                            
                                            
                                        }
                                        .padding(.trailing,5)
                                        
                                    }
                                    .padding(5)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(AppColors.pinkMainColor))
                                    
                                }
                                .frame(width: (UIScreen.widthBlockSize * 70))
                                .padding(.trailing,20)
                               
                                
                            }
                            .padding(.top,5)
                            .padding(.bottom,5)
                            
                           
                           
                           
                        }
                    }
                    
                    
                }
                
                
                HStack{
                   
                    HStack{
                        
                        TextField("Message" , text: self.$message)
                            .autocapitalization(.sentences)
                        
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 18).fill(.gray.opacity(0.2)))
                    
                    Image(systemName: "arrow.forward.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                        .foregroundColor(AppColors.pinkMainColor)
                        .padding(.leading,5)
                        .onTapGesture{
                            self.messageText.append(message)
                            self.message = ""
                            
                        }
                      
                    
                    
                }
                .padding(.top,10)
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.bottom,10)

                
                
                
                
                
            }
        }
        .navigationBarHidden(true)
    }
}






