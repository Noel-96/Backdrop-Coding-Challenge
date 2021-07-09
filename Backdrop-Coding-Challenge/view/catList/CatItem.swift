//
//  CatRow.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatItem: View {
    var cat:CatModel
    @StateObject var viewModel = ImageProvider()
    
    var body: some View {
        HStack(alignment: .center, spacing: 15.0){
            
            Image(uiImage: viewModel.image).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fill)
                .frame(width:60,height:60)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1))
                .onAppear {
                    viewModel.loadImage(url:URL(string: cat.image?.url ?? "https://miro.medium.com/max/1400/0*H3jZONKqRuAAeHnG.jpg")! )
                    }
                
            
            
            Text(cat.name)
                .font(.headline)
                .fontWeight(.regular)
                .foregroundColor(.primary)
            
            Spacer()
            
            
            Button(action: {
                print("Edit button was tapped")
            }) {
                Image( "empty_heart")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:25,height:25)
            }
            
        }
        .padding([.leading, .bottom, .trailing])
    }
}

//struct CatItem_Previews: PreviewProvider {
//     static var previews: some View {
//         CatItem(cat: catsData[0])
//     }
// }
