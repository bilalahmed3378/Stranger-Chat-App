//
//  UserProfileDetailScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 17/02/2023.
//

import SwiftUI

struct UserProfileDetailScreen: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @State var images : Array<String> = [AppImages.detailProfilePic , AppImages.detailProfilePic , AppImages.detailProfilePic , AppImages.detailProfilePic]
    
    @State private var selection = 0
    
    @State private var dragOffset : CGFloat = 0.0
    
   
    
    var body: some View {
        
        ZStack{
            
            VStack{
                
                TabView(selection : $selection){
                                
                    ForEach(0...(images.count-1) , id:\.self){ i in
                        
                        Image("\(images[i])")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.screenWidth, height: 400)
                        
                    }

                                
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .frame(width: UIScreen.screenWidth, height: 400)
                .clipped()
                
                Spacer()
                
            }
           
            
            
            VStack{
                
                
                HStack{
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.5)))

                    })
                    
                    Spacer()
                    
                    ForEach(0...(images.count-1) , id: \.self){ index in
                        Circle()
                            .fill(self.selection == index ? AppColors.pinkMainColor : .white)
                            .frame(width: 8, height: 8)
                    }
                    
                    
                    Spacer()
                    
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.5)))
                       
                        
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                Spacer()
                    .frame(height: 380)
                
                HStack{
                    Text("Janice Ramirez")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_16)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Text("1.5 Km")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_16)
                        .fontWeight(.bold)
                    
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                
                HStack{
                    Text("Haripur, United States")
                        .foregroundColor(AppColors.textColor)
                        .font(AppFonts.ceraPro_14)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                HStack{
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_14)
                    
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,10)
                
                
                HStack{
                    
                    BlueButton(lable: "Call")
                    
                    Spacer()
                    
                    PinkButton(lable: "Chat")
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .padding(.top,20)
               
                Spacer()
            }
            
        }
        .navigationBarHidden(true)
    }
}

