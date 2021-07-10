//
//  HomeView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var catListViewModel: CatListViewModel
    
    var body: some View {
        VStack(){
            Text("All Cats")
                .font(.custom("Helvetica Neue", size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .bottom])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            if catListViewModel.isLoading {
                ProgressView()
                    .frame(width: 50, height: 50)
            }
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(){
                    ForEach(catListViewModel.catApiList,id: \.name){ cat  in
                        CatItem(cat: cat, catItemViewModel: .init())
                    }
                }
            }
            .onAppear(perform: fetchData)
            
            Text(catListViewModel.errorMessage)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
        }
    }
    
    private func fetchData() {
        self.catListViewModel.fetchList()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(catListViewModel: .init())
    }
}
