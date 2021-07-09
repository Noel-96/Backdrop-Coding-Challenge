//
//  LikedCatItem.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 05/07/2021.
//

import SwiftUI

struct LikedCatItem: View {
    var cat:Cat
    var body: some View {
        VStack(alignment: .center){
            Image(cat.imageName).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fill)
                .frame(width:150,height:150)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
            
            HStack(alignment: .top){
                Text(cat.name)
                    .font(.headline)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.primary)
                    .lineLimit(5)
                
                Spacer()
                
                Button(action: {
                    print("Edit red button was tapped")
                }) {
                    Image( "redFilled_heart")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:25,height:25)
                }
               
            }
            .padding(.top)
            .frame(width:150)
        }
        .padding([.top, .leading])
        .frame(width:150)
    }
}

struct LikedCatItem_Previews: PreviewProvider {
    static var previews: some View {
        LikedCatItem(cat: catsData[0])
    }
}
