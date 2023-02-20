//
//  EditProfileScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 20/02/2023.
//

import SwiftUI

struct EditProfileScreen: View {
    @Environment(\.presentationMode) var presentationMode

    
    let options = ["Male", "Female", "Other"]
    @State private var selectedOption: String = "Select Gender"
    
    let age = ["18 years", "19 years", "20 years"]
    @State private var selectedAge: String = "Select Age"
    
    let interest = ["Cat lover", "Forests", "Food", "lover", "cool", "ok"]
    
    @State var selectedItems: [String] = []
    
    @State var onePhoto : Image? = nil
    
    @State var profilePhoto : Image? = nil

    
    @State var twoPhoto : Image? = nil
    
    @State var threePhoto : Image? = nil

    @State var showBottomSheet: Bool = false
    
    @State var selectedPhoto : Int = 0


    @State var name = ""
    var body: some View {
        ZStack{
            VStack{
                //top bar
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .foregroundColor(.black)

                    })
                    
                    Spacer()
                    
                    Text("Edit Profile")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_20)
                        .fontWeight(.bold)
                        .offset(x: -10)
                    
                    Spacer()
                    
                    
                    
                   
                    
                }
                .padding(.top,10)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        
                        if(self.profilePhoto != nil){
                            profilePhoto?
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(width: 75, height: 75)
                                .cornerRadius(10)
                                .padding(.top,20)

                        }
                        else{
                            
                            Image(uiImage: UIImage(named: AppImages.profilePicture)!)
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(width: 75, height: 75)
                                .padding(.top,20)
                        }
                       
                        
                        Button(action: {
                            self.showBottomSheet = true
                            self.selectedPhoto = 0
                        }, label: {
                            Text("Upload new")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                                .fontWeight(.bold)
                                .padding(.top,10)
                        })
                       
                        
                        VStack{
                            HStack{
                                Text("Add a nickname")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                Spacer()
                            }
                            
                            
                            TextField("Enter your nick name", text: self.$name)
                            .padding(15)
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                            .padding(.top,10)
                            
                        }
                        .padding(.top,20)
                        
                        VStack{
                            HStack{
                                Text("Gender")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                Spacer()
                            }
                            
                            
                            VStack {
                                Menu {
                                    ForEach(options, id: \.self) { option in
                                        Button(option) {
                                            selectedOption = option
                                        }
                                    }
                                } label: {
                                    HStack{
                                        Text(selectedOption)
                                            .foregroundColor(.black)
                                            .padding(15)
                                        
                                        Spacer()
                                        Image(systemName: "chevron.down.circle")
                                            .foregroundColor(.black)
                                            .padding(.trailing,5)
                                    }
                                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                                }
                                .menuStyle(BorderlessButtonMenuStyle())
                            }
                            .padding(.top,10)

                        }
                        .padding(.top,20)
                        
                        VStack{
                            HStack{
                                Text("Age")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                Spacer()
                            }
                            
                            
                            VStack {
                                Menu {
                                    ForEach(age, id: \.self) { age in
                                        Button(age) {
                                            selectedAge = age
                                        }
                                    }
                                } label: {
                                    HStack{
                                        Text(selectedAge)
                                            .foregroundColor(.black)
                                            .padding(15)
                                        
                                        Spacer()
                                        Image(systemName: "chevron.down.circle")
                                            .foregroundColor(.black)
                                            .padding(.trailing,5)
                                    }
                                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                                }
                                .menuStyle(BorderlessButtonMenuStyle())
                            }
                            .padding(.top,10)
                        }
                        .padding(.top,20)
                        
                        VStack{
                            HStack{
                                Text("Interest")
                                    .foregroundColor(.black)
                                    .font(AppFonts.ceraPro_16)
                                    .padding(.bottom,10)
                                Spacer()
                            }
                            
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()) , GridItem(.flexible())]){
                                
                                ForEach(interest, id : \.self){interest in

                                    card(text: interest, selectedItems: self.$selectedItems)
                                
                                
                                
                            }

                        
                    }
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black))
                            
                            
                        }
                        .padding(.top,20)
                        
                      
                        HStack{
                            Text("Upload images (at least 2 images)")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            Spacer()
                        }
                        .padding(.top,20)

                        
                        HStack{
                            
                            if(self.onePhoto != nil){
                                
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 1
                                }, label: {
                                    onePhoto?
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                })
                                   

                            }
                            else{
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 1
                                }, label: {
                                    Text("Upolad")
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                                })
                               
                            }
                           
                            
                            Spacer()
                            
                            if(self.twoPhoto != nil){
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 2
                                }, label: {
                                    twoPhoto?
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                })
                              
                            }
                            else{
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 2
                                }, label: {
                                    Text("Upolad")
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                                })
                            }
                            
                            Spacer()
                            
                            if(self.threePhoto != nil){
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 3
                                }, label: {
                                    threePhoto?
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .cornerRadius(10)
                                })
                               

                            }
                            else{
                                Button(action: {
                                    self.showBottomSheet = true
                                    self.selectedPhoto = 3
                                }, label: {
                                    Text("Upolad")
                                        .frame(width: 100, height: 100)
                                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(.black))
                                })
                            }
                            
                        }
                        .padding(.top,10)
                    
                        
                      
                        
                        
                    }
                }
                   
                
            }
            .padding(.leading,20)
            .padding(.trailing,20)
        }
        .navigationBarHidden(true)
        .sheet(isPresented: self.$showBottomSheet) {
            
            ImagePicker(sourceType: .photoLibrary) { image in
                
                if(self.selectedPhoto == 1){
                    self.onePhoto = Image(uiImage: image)

                }
                else if(self.selectedPhoto == 2){
                    self.twoPhoto = Image(uiImage: image)

                }
                else if(self.selectedPhoto == 3){
                    self.threePhoto = Image(uiImage: image)

                }
                else{
                    self.profilePhoto = Image(uiImage: image)
                }
                     
            }
            
        }
    }
}


struct Interestcard: View{
    
    @State var selected = false
    
    @State var text: String
    
    @Binding var selectedItems: [String]
    
    var body: some View{
        
        
        Text(text)
            .foregroundColor(self.selected == true ? .white : .black)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 10).fill(self.selected == true ? AppColors.pinkMainColor : .gray.opacity(0.3)))
            .padding(10)
            .onTapGesture{
                
                if(self.selected){
                    
                    self.selected = false
                    self.selectedItems.removeAll{$0 == text}
                }
                
                else{
                    
                    self.selected = true
                    self.selectedItems.append(text)

                    
                }
                
            }

        
        
    }
    
}

