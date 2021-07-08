//
//  HomeView.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatListView: View {
    @ObservedObject var viewModel: CatListViewModel
    
    @State private var cats = [CatModel]()
    
   // var cats:[Cat]
    func LoadData(){
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=20&order=Asc&api_key=7d5a7390-46dd-44d1-973b-a531bc07b6f2") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        print("here-1")
        URLSession.shared.dataTask(with: request) { data, response, error in
            print("here0")
            if let data = data {
                print(data)
                print("here")
                do {
                                let decoder = JSONDecoder()
                                decoder.dateDecodingStrategy = .iso8601
                                let catsData = try decoder.decode([CatModel].self, from: data)
                                DispatchQueue.main.async {
                                    print("this is cats data" ,catsData)
                                    self.cats = catsData
                                }
                            } catch {
                                print(error)
                            }
            }else{

            // if we're still here it means there was a problem
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()
    }
    
    var body: some View {
        VStack(){
            Text("All Cats")
                .font(.custom("Helvetica Neue", size: 20))
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding([.top, .leading, .bottom])
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
           // Text(viewModel.isLoading ? "Loading..." : "")
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(){
                    ForEach(viewModel.models,id: \.name){ cat  in
                        CatItem(cat: cat)
                    }
                }
            }
            //.onAppear(perform: { self.viewModel.apply(.onAppear) })
            .onAppear(perform: fetchData)
        }
    }
    
    private func fetchData() {
        self.viewModel.fetchList()
    }
   
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        CatListView()
//    }
//}
