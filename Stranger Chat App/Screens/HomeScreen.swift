//
//  HomeScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI
import Foundation
import Kingfisher


struct HomeScreen: View {
    
    @StateObject var getAllUsers : GetAllUsersApi = GetAllUsersApi()
    
    @StateObject var likeApi : LikeUnlikeApi = LikeUnlikeApi()


    
    @State var showPlacePicker : Bool = false
    
    @State var address : String = ""
    
    @State var showSearch : Bool = false
    
    @State var like : Bool = false

    @State var unlike : Bool = false
    
    @State var likePressed : Int = 0

    
    @State var showToast : Bool = false
    @State var toastMessage : String = ""


   
    @State var latitude : Double = 0.0
    @State var longitude : Double = 0.0
    
    @State var search = ""
    @State var showSheet : Bool = false
    
    @State var selected : Bool = false

    @State var seekBarValue : Int = 25
    let options = ["Male", "Female", "Other"]
      @State private var selectedOption: String = "Option 1"
    
    let interest = ["Cat lover", "Forests", "Food", "lover", "cool", "ok"]
    
    @State var selectedItems: [String] = []
    
    var body: some View {
        ZStack{
            AppColors.appBackGroundColor
                .ignoresSafeArea(.all)
            
            if(self.getAllUsers.isLoading){

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
            
            else if(self.getAllUsers.isApiCallDone && (!self.getAllUsers.isApiCallSuccessful)){
                
                VStack{
                    
                    
                    Spacer()
                    
                    Text("Unable to access internet.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    
                    Button(action: {
                        withAnimation{
                            self.getAllUsers.getAllUsers()
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
            
            else if(self.getAllUsers.isApiCallDone && self.getAllUsers.isApiCallSuccessful){
                
                if(self.getAllUsers.dataRetrivedSuccessfully){
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
                                TextField("", text: self.$search)
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                
                                Button(action: {
                                    self.showSheet = true
                                }, label: {
                                    Image(uiImage: UIImage(named: AppImages.filterIconWhite)!)
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 20, height: 20)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
                                })
                               
                                
                            }
                            .padding(.top,10)
                            .padding(.bottom,5)
                        }
                       
                        
                        ScrollView(.vertical, showsIndicators: false){
                            LazyVStack{
                                ForEach(self.getAllUsers.apiResponse!.docs.indices, id : \.self){ index in
                                    VStack{
                                        
                                        NavigationLink(destination: {
                                            UserProfileDetailScreen(user_id: self.getAllUsers.apiResponse!.docs[index]._id)
                                        }, label: {
                                            KFImage(URL(string: self.getAllUsers.apiResponse!.docs[index].profileImage))
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                
                                        })
                                        .frame(height: 340)

                                       
                                        
                                        VStack{
                                            HStack{
                                                Text("\(self.getAllUsers.apiResponse!.docs[index].nickName)")
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
                                                if(self.likePressed == 1){
                                                    if(self.likeApi.isLoading){
                                                        ProgressView()
                                                            .onDisappear{
                                                                
                                                                if(self.likeApi.isApiCallDone && self.likeApi.isApiCallSuccessful){
                                                                    
                                                                    
                                                                    if(self.likeApi.likeSuccessful){
                                                                        self.like = false
                                                                        self.unlike = true
                                                                        self.likePressed = 0

                                                                        
                                                                        self.toastMessage = "DisLike Successfully"
                                                                        self.showToast = true
                                                                    }
                                                                    else{
                                                                        
                                                                        
                                                                        self.toastMessage = "Unable to dislike"
                                                                        self.showToast = true
                                                                        self.likePressed = 0

                                                                    }
                                                                }
                                                                else if(self.likeApi.isApiCallDone && (!self.likeApi.isApiCallSuccessful)){
                                                                    self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                                                    self.showToast = true
                                                                }
                                                                
                                                            }
                                                    }
                                                }
                                                
                                                else{
                                                    Button(action: {
                                                        self.likePressed = 1
                                                        
                                                        self.likeApi.registerUser(forId: self.getAllUsers.apiResponse!.docs[index]._id, like: false)
                                                        
                                                        
                                                    }, label: {
                                                        Image(systemName: "multiply")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 20, height: 20)
                                                            .foregroundColor(.white)
                                                            .padding()
                                                            .background(Circle().fill(self.unlike ? Color.black.opacity(0.5)  : .black  ))
                                                    })
                                                    .disabled(self.unlike)

                                                }

                                               
                                                
                                                Spacer()
                                                
                                                if(self.likePressed == 2){
                                                    if(self.likeApi.isLoading){
                                                        ProgressView()
                                                            .onDisappear{
                                                                
                                                                if(self.likeApi.isApiCallDone && self.likeApi.isApiCallSuccessful){
                                                                    
                                                                    
                                                                    if(self.likeApi.likeSuccessful){
                                                                        self.like = true
                                                                        self.unlike = false
                                                                        self.likePressed = 0

                                                                        
                                                                        self.toastMessage = "Like Successfully"
                                                                        self.showToast = true
                                                                    }
                                                                    else{
                                                                        
                                                                        
                                                                        self.toastMessage = "Unable to like"
                                                                        self.showToast = true
                                                                    }
                                                                }
                                                                else if(self.likeApi.isApiCallDone && (!self.likeApi.isApiCallSuccessful)){
                                                                    self.toastMessage = "Unable to access internet. Please check you internet connection and try again."
                                                                    self.showToast = true
                                                                }
                                                                
                                                            }
                                                    }
                                                }
                                                
                                                else{
                                                    
                                                    Button(action: {
                                                        self.likePressed = 2

                                                        self.likeApi.registerUser(forId: self.getAllUsers.apiResponse!.docs[index]._id, like: true)
                                                    }, label: {
                                                        Image(systemName: "heart")
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .frame(width: 20, height: 20)
                                                            .foregroundColor(.white)
                                                            .padding()
                                                            .background(Circle().fill(self.like ? AppColors.pinkMainColor.opacity(0.5) : AppColors.pinkMainColor))
                                                    })
                                                    .disabled(self.like)
                                                }
                                               
                                                
                                                Spacer()

                                            }
                                            .padding(.bottom,20)
                                            
                                        }
                                        .background(Color.white)
                                        
                                    }
                                    .background(RoundedRectangle(cornerRadius: 20))
                                    .padding(.top,20)
                                    .frame(height: 500)

                                    
                                   
                                }
                            }
                           
                        }
                       
                        
                    }
                    .padding(.leading,20)
                    .padding(.trailing,20)
                    .padding(.bottom,80)
                }
                
                else{
                    VStack{
                        
                        Spacer()
                        
                        Text("Unable to get Users.")
                            .font(.system(size: 14))
                            .foregroundColor(.black)
                        
                        Button(action: {
                            withAnimation{
                                self.getAllUsers.getAllUsers()
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
                    
                    Text("Unable to get users.")
                        .font(.system(size: 14))
                        .foregroundColor(.black)
                    
                    Button(action: {
                        withAnimation{
                            self.getAllUsers.getAllUsers()
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

            if(showToast){
                Toast(isShowing: self.$showToast, message: self.toastMessage)
            }
            
            
        }
        .navigationBarHidden(true)
        .onAppear{
            self.getAllUsers.getAllUsers()
        }
        .sheet(isPresented: self.$showSheet){
            ZStack{
                VStack{
                    Group{
                        HStack{
                            Text("Apply Filter")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_18)
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Image(systemName: "xmark.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                                .onTapGesture{
                                    self.showSheet = false
                                }
                            
                            
                        }
                        .padding(.top,20)
                        
                        HStack{
                            Text("Age range")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        
                        SeekBar(lable: "", maxRange: 50, color: AppColors.pinkMainColor, value: self.$seekBarValue)
                            .padding(.top,10)
                        
                        Divider()
                            .padding(.top,20)
                        
                        HStack{
                            Text("Gender")
                                .foregroundColor(.black)
                                .font(AppFonts.ceraPro_16)
                            
                            Spacer()
                            
                        }
                        .padding(.top,20)
                        
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
                    }
                    Divider()
                        .padding(.top,20)
                    
                    HStack{
                        Text("City")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_16)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    
                    HStack{
                        
                        Text("Address")
                            .font(AppFonts.ceraPro_14)
                            .foregroundColor(AppColors.textColor)

                        Spacer()
                            
                    }
                    .padding()
                    .background(AppColors.pinkMainColor)
                    .cornerRadius(10)
                    .onTapGesture{
                        withAnimation{
                            self.showPlacePicker = true
                        }
                    }
                    
                    Divider()
                        .padding(.top,20)
                    
                    HStack{
                        Text("Interest")
                            .foregroundColor(.black)
                            .font(AppFonts.ceraPro_16)
                        
                        Spacer()
                        
                    }
                    .padding(.top,20)
                    
//                    ScrollView(.vertical, showsIndicators: false){
                        
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()) , GridItem(.flexible())]){
                                
                                ForEach(interest, id : \.self){interest in

                                    card(text: interest, selectedItems: self.$selectedItems)
                                
                                
                                
                            }
//                        }
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.black))
                   
                    Spacer()
                    
                }
                .padding(.leading,20)
                .padding(.trailing,20)
                .onChange(of: self.selectedItems) { newValue in
                    
                    print(
                        self.selectedItems
                    )
                    
                }
                
                if(self.showPlacePicker){
                    ZStack {
                        
                        Rectangle().fill(Color.black.opacity(0.3))
                        
                        VStack{
                            
                            HStack{
                                
                                    
                                
                                Text(self.address.isEmpty ? "Address" : self.address)
                                    .font(AppFonts.ceraPro_18)
                                    .foregroundColor(AppColors.textColor)
                                    .padding(.trailing,10)
                                
                                Spacer()
                                
                                Image(systemName: "xmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20,alignment:.center)
                                    .foregroundColor(.black)
                                    .onTapGesture(perform: {
                                        withAnimation{
                                            self.showPlacePicker = false
                                        }
                                    })
                            }
                            .padding(20)
                            
                          
                            
                            Spacer()
                            
                        }
                        .background(RoundedCorners(tl: 20, tr: 20, bl: 0, br: 0).fill(Color.white))
                        .padding(.top,200)
                        
                    }
                    .onDisappear{
    //                    print("Selected Place Address ===> \(result.address)\nSelected Place Latitude ===> \(result.latitude)\nSelected Palce Longitude ===> \(result.longitude)")
                    }
                }
                
            }
        }
    }
    func locationReceived(placeViewModel: PlaceViewModel) {
        self.address = placeViewModel.address
        self.latitude = placeViewModel.latitude
        self.longitude = placeViewModel.longitude
        self.showPlacePicker.toggle()
    }
}



class PlaceViewModel: Identifiable , ObservableObject {
    
    let id : UUID
    @Published var latitude : Double
    @Published var longitude : Double
    @Published var address : String
    @Published var province : String
    @Published var city : String
    @Published var country : String
    @Published var zipCode : String

    
    init(lat : Double , long : Double , address : String , province : String = "" , city : String = "",country : String = "" ,zipCode : String = ""){
        self.id = UUID()
        self.latitude = lat
        self.longitude = long
        self.address = address
        self.province = province
        self.city = city
        self.country = country
        self.zipCode = zipCode
    }
    
}

struct card: View{
    
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

