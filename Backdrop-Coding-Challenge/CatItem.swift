//
//  CatRow.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatItem: View {
    var cat:Cat
    
    var body: some View {
        HStack(alignment: .center, spacing: 15.0){
            Image(cat.imageName).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fill)
                .frame(width:60,height:60)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1))
                .shadow(radius: 10)
           
            
            
            Text(cat.name)
                .font(.headline)
                .fontWeight(.regular)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image("empty_heart").resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fit)
                .frame(width:30,height:30)
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .padding([.leading, .bottom, .trailing])
      
        
        
    }
}

struct CatRow_Previews: PreviewProvider {
    static var previews: some View {
        CatItem(cat: catsData[0])
    }
}
