//
//  CatRow.swift
//  Backdrop-Coding-Challenge
//
//  Created by Noel Obaseki on 04/07/2021.
//

import SwiftUI

struct CatItem: View {
    
    var cat:CatModel
  
    @Environment(\.managedObjectContext) var managedObjectContext
    @StateObject var imageHandlerViewModel = ImageProvider()
    @StateObject var catItemViewModel: CatItemViewModel
    @State private var showingAlert = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 15.0){
            
            Image(uiImage: imageHandlerViewModel.image).resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode:.fill)
                .frame(width:60,height:60)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                .onAppear {
                    imageHandlerViewModel.loadImage(url:URL(string: cat.image?.url ?? "https://1080motion.com/wp-content/uploads/2018/06/NoImageFound.jpg.png")! )
                }
            
            Text(cat.name)
                .font(.headline)
                .fontWeight(.regular)
                .foregroundColor(.primary)
            
            Spacer()
            
            Button(action: {
                    if imageHandlerViewModel.image ==  UIImage(imageLiteralResourceName: "Loading_Default_Picture"){
                        //do nothing ideally i would have put an alert here
                        print("image is still loading")
                    } else {
                        let likedCat = LikedCat(context: managedObjectContext)
                        let imageData = imageHandlerViewModel.image.jpegData(compressionQuality: 1.0)
                        self.showingAlert = true
                        catItemViewModel.likeCatPicture(id: cat.id, catName: cat.name, imageData: imageData!, isLiked: true, likedCat: likedCat)
                        
                    }}) {
                Image(catItemViewModel.checkIfCatIsLiked(id: cat.id, managedObjectContext: managedObjectContext) ? "redFilled_heart" : "empty_heart")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width:25,height:25)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(cat.name + " " + "has been added as part of your favorite cats"), message: Text("...."), dismissButton: .default(Text("OK")))
                    }
            .disabled(catItemViewModel.checkIfCatIsLiked(id: cat.id, managedObjectContext: managedObjectContext) == true)
        }
        .padding([.leading, .bottom, .trailing])
    }
}

//struct CatItem_Previews: PreviewProvider {
//     static var previews: some View {
//         CatItem(cat: catsData[0])
//     }
// }
