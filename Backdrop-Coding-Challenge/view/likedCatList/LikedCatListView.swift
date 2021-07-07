//
//  LikeItemView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 05/07/2021.
//

import SwiftUI

struct LikedCatListView: View {
    var Likedcats:[Cat]
    
    let layout = [GridItem(.flexible(minimum: 150, maximum: 500), alignment: .top),
        GridItem(.flexible(minimum: 150, maximum: 500), alignment: .top)]
    
    var body: some View {
        VStack(){
            Text("Cats I like")
                .font(.custom("Helvetica Neue", size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .bottom])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            ScrollView(.vertical, showsIndicators: false){
                LazyVGrid(columns: layout, alignment: .center){
                    ForEach(self.Likedcats,id: \.name){ Likedcat  in
                        LikedCatItem(cat: Likedcat)
                    }
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity
                )
            }
        }
    }
}

struct LikeItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LikedCatListView(Likedcats: catsData)
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
