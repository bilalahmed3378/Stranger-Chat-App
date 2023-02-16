//
//  OtpVerificationScreen.swift
//  Stranger Chat App
//
//  Created by Bilal Ahmed on 16/02/2023.
//

import SwiftUI

struct OtpVerificationScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = ViewModel()
    @State var isFocused = false

    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 15
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }

    var body: some View {
        ZStack{
            VStack{
                
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
                }
                .padding(.top,20)
                

                
                HStack{
                    
                    Text("OTP Verification")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_28)
                        .fontWeight(.bold)
                 
                }
                .padding(.top,40)


                Spacer()
                
                Text("Enter OTP")
                    .foregroundColor(.black)
                    .font(AppFonts.ceraPro_14)
                    .padding(.bottom,20)
                
                //textfields
                Group{
                   
                   
                    ZStack {
                        
                        HStack (spacing: spaceBetweenBoxes){
                            
                            otpText(text: viewModel.otp1)
                            otpText(text: viewModel.otp2)
                            otpText(text: viewModel.otp3)
                            otpText(text: viewModel.otp4)
                            otpText(text: viewModel.otp5)
                            
                        }
                        
                        
                        TextField("", text: $viewModel.otpField)
                            .frame(width: isFocused ? 0 : textFieldOriginalWidth, height: textBoxHeight)
                            .disabled(viewModel.isTextFieldDisabled)
                            .textContentType(.oneTimeCode)
                            .autocapitalization(.none)
                            .foregroundColor(.clear)
                            .accentColor(.clear)
                            .keyboardType(.phonePad)
                            .background(Color.clear)
                            .onChange(of: self.viewModel.otpField) { newValue in
                                self.viewModel.otpField = newValue.filterNumbers(limit : 5)
                            }
                    }
                    .padding(.top)
                    .padding(.bottom)
                  
                    
                   
                    
                   
                }
                
                
                
                
                NavigationLink(destination: {
                    LetsStartScreen()
                }, label: {
                    PinkButton(lable: "VERIFY")
                        .padding(.top,20)
                    
                })
               
                
                HStack{
                    Text("Didn't get OTP?")
                        .foregroundColor(.black)
                        .font(AppFonts.ceraPro_14)
                    
                        Text("Resend")
                            .foregroundColor(AppColors.pinkMainColor)
                            .font(AppFonts.ceraPro_14)
                       
                }
                .padding(.top,20)
                
               
                Spacer()
            }
            .padding(.leading,20)
            .padding(.trailing,20)
        }
        .navigationBarHidden(true)
    }
    
    private func otpText(text: String) -> some View {
        
        return Text(text)
            .font(.title)
            .frame(width: textBoxWidth, height: textBoxHeight)
            .background(VStack{
                Spacer()
                RoundedRectangle(cornerRadius: 1)
                    .frame(height: 0.5)
            })
            .padding(paddingOfBox)
    }
}


class ViewModel: ObservableObject {
    
    @Published var otpField = "" {
        didSet {
            guard otpField.count <= 6
                    //                  otpField.last?.isNumber ?? true else {
                    //                otpField = oldValue
            else{ return
            }
        }
    }
    var otp1: String {
        guard otpField.count >= 1 else {
            return ""
        }
        return String(Array(otpField)[0])
    }
    var otp2: String {
        guard otpField.count >= 2 else {
            return ""
        }
        return String(Array(otpField)[1])
    }
    var otp3: String {
        guard otpField.count >= 3 else {
            return ""
        }
        return String(Array(otpField)[2])
    }
    var otp4: String {
        guard otpField.count >= 4 else {
            return ""
        }
        return String(Array(otpField)[3])
    }
    
    var otp5: String {
        guard otpField.count >= 5 else {
            return ""
        }
        return String(Array(otpField)[4])
    }
    
    
    
    @Published var borderColor: Color = .black
    @Published var isTextFieldDisabled = false
    var successCompletionHandler: (()->())?
    
    @Published var showResendText = false
    
}



