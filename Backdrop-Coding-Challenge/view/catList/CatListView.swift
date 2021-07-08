//
//  HomeView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel: CatListViewModel
    
    var body: some View {
        VStack(){
            Text("All Cats")
                .font(.custom("Helvetica Neue", size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .bottom])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            if viewModel.isLoading {
            Image("Loading_Default_Picture").resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fit)
                .frame(width:150,height:150)
            }
            
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(){
                    ForEach(viewModel.models,id: \.name){ cat  in
                        CatItem(cat: cat)
                    }
                }
            }
            .onAppear(perform: fetchData)
            
            Text(viewModel.errorMessage)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
        }
    }
    
    private func fetchData() {
        self.viewModel.fetchList()
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        CatListView(viewModel: .init())
    }
}
