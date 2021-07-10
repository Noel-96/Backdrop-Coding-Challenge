//
//  HomeTabView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 06/07/2021.
//

import SwiftUI

struct HomeTabView: View {
    
    var body: some View {
        
        TabView {
            CatListView(catListViewModel: .init())
                .tabItem {
                    Image("tab_cat").renderingMode(.template)
                    Text("All Cats")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
            
            LikedCatListView()
                .tabItem {
                    Image( "black_heart").renderingMode(.template)
                    Text("Cats I Like")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                }
        }
        .font(.headline)
        .onAppear() {
            UITabBar.appearance().barTintColor = .white
        }
        .accentColor(.black)
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabView()
    }
}
