//
//  GradientButton.swift
//  MeccaFitness
//
//  Created by CodeCue on 13/02/2022.
//

import SwiftUI

struct PinkButton: View {
    
    let lable : String
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(lable)
                .foregroundColor(.white)
                .font(AppFonts.ceraPro_14)
            Spacer()
        }
        .padding()
        .background(AppColors.pinkMainColor)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


struct WhiteButton: View {
    
    let lable : String
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(lable)
                .foregroundColor(AppColors.pinkMainColor)
                .font(AppFonts.ceraPro_14)
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}


struct BlueButton: View {
    
    let lable : String
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(lable)
                .foregroundColor(.white)
                .font(AppFonts.ceraPro_14)
            Spacer()
        }
        .padding()
        .background(.blue)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct RedButton: View {
    
    let lable : String
    
    var body: some View {
        
        HStack{
            Spacer()
            Text(lable)
                .foregroundColor(.white)
                .font(AppFonts.ceraPro_14)
            Spacer()
        }
        .padding()
        .background(.red)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
