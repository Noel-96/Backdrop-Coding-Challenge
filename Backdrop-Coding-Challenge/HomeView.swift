//
//  HomeView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct HomeView: View {
    
    var cats:[Cat]
    
    var body: some View {
        VStack(){
         Text("All Cats")
            .font(.custom("Helvetica Neue", size: 20))
            .fontWeight(.medium)
            .multilineTextAlignment(.leading)
            .padding([.top, .leading, .bottom])
            .frame(maxWidth: .infinity, alignment: .leading)
            
         Spacer()
            
         ScrollView(.vertical, showsIndicators: false){
            VStack(){
                ForEach(self.cats,id: \.name){ cat  in
                    CatItem(cat: cat)
                    }
                  }
                }
        
            
//            TabView {
////                HomeView(cats: catsData)
////                    .tabItem {
////                        Image(systemName: "1.square.fill")
////                        Text("First")
////                    }
//                
//                LikeItemView()
//                    .tabItem {
//                        Image(systemName: "2.square.fill")
//                        Text("Second")
//                    }
//            }
//            .font(.headline)
      }
   }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(cats: catsData)
    }
}
