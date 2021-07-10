//
//  LikeItemView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 05/07/2021.
//

import SwiftUI

struct LikedCatListView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: LikedCat.entity(), sortDescriptors:[NSSortDescriptor(keyPath: \LikedCat.catName, ascending: true)]) private var Likedcats: FetchedResults<LikedCat>
    
    let layoutColums = [GridItem(.flexible(minimum: 150, maximum: 500), alignment: .top),
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
                LazyVGrid(columns: layoutColums, alignment: .center){
                    ForEach(Likedcats,id: \.self){ Likedcat  in
                        LikedCatItem(cat: Likedcat, CviewModel: .init(), likedCatItemViewModel: .init())
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
            LikedCatListView()
                .previewDevice("iPhone 12 Pro Max")
        }
    }
}
