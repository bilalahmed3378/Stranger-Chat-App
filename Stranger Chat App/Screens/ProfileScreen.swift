//
//  ProfileScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 17/02/2023.
//

import SwiftUI
import Kingfisher

struct ProfileScreen: View {
    @State var seekBarValue : Int = 25
    @State var selectedInterest : Int = 0
    
    @StateObject var getProfileApi = GetProfileApi()

    @Binding var isUserLoggedIn : Bool
    
    
    init(isUserLoggedIn : Binding<Bool>){
        self._isUserLoggedIn = isUserLoggedIn
    }

    
    var body: some View {
        ZStack{
            
            
            if(self.getProfileApi.isLoading){

                VStack{

                    Spacer()

                    HStack{

                        Spacer()

                        ProgressView()
                            .padding()
                          


                        Spacer()

                    }


                    Spacer()

                }


            }
            
            else if(self.getProfileApi.isApiCallDone && (!self.getProfileApi.isApiCallSuccessful)){
                
                VStack{
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileApi.getProfile()
                        }
                    }){
                        Text("Try Agin")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                }
            }
            
            else if(self.getProfileApi.isApiCallDone && self.getProfileApi.isApiCallSuccessful){
                
                if(self.getProfileApi.dataRetrivedSuccessfully){
                    
                    VStack{
                        //top bar
                        HStack{
                            Spacer()
                            
                            Text("Profile")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_20)
                                .fontWeight(.bold)
                                .offset(x: 10)
                            
                            Spacer()
                            
                            NavigationLink(destination: {
                                LogoutScreen(isUserLoggedIn: self.$isUserLoggedIn)
                            }, label: {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.red)
                                    .padding(.trailing,5)
                            
                            })
                            
                            NavigationLink(destination: {
                                EditProfileScreen()
                            }, label: {
                                Image(uiImage: UIImage(named: AppImages.editIconPink)!)
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 18, height: 18)
                            })
                           
                            
                        }
                        .padding(.top,10)
                        
                       
                            VStack{
                                KFImage(URL(string: self.getProfileApi.apiResponse!.docs!.profileImage))
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                                    .padding(.top,20)
                                
                                Text("\(self.getProfileApi.apiResponse!.docs!.nickName)")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                    .fontWeight(.bold)
                                    .padding(.top,10)
                                
                                HStack{
                                    Text("Nick Name")
                                        .foregroundColor(.black)
                                        .font(AppFonts.ceraPro_16)
                                    
                                    Spacer()
                                    
                                    Text("\(self.getProfileApi.apiResponse!.docs!.nickName)")
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
                                    
                                    Text("\(self.getProfileApi.apiResponse!.docs!.gender)")
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
                                    
                                    Text("\(self.getProfileApi.apiResponse!.docs!.age) years")
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
                                    
                                 
                                        Text("\(self.getProfileApi.apiResponse!.docs!.interest)")
                                            .foregroundColor(self.selectedInterest == 1 ? Color.white : .black )
                                            .font(AppFonts.ceraPro_14)
                                            .padding(10)
                                            .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray.opacity(0.3)))
                                    
                                   
                                    Spacer()
                                    
                                    
                                }
                                .padding(.top,10)
                                
                              
                                
                                
                            }
                        
                        Spacer()
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                }
                
                else{
                    VStack{
                        
                        Spacer()
                        
                        Text("Unable to get profile.")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        
                        Button(action: {
                            withAnimation{
                                self.getProfileApi.getProfile()

                            }
                        }){
                            Text("Try Agin")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                            
                        }
                        .padding(.top,30)
                        
                        Spacer()
                        
                    }
                }
            }
            
            
            else{
                
                VStack{
                    
                    Spacer()
                    
                    Text("Unable to get profile.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    
                    Button(action: {
                        withAnimation{
                            self.getProfileApi.getProfile()
                        }
                    }){
                        Text("Try Agin")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.blue))
                        
                    }
                    .padding(.top,30)
                    
                    Spacer()
                    
                }
                
            }
            
          
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getProfileApi.getProfile()
        }
    }
}


