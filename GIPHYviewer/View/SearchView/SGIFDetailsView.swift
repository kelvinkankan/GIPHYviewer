//
//  SGIFDetailsView.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 20/2/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct SGIFDetailsView: View {
    @ObservedObject var favouriteList : FavouriteList
    @ObservedObject var gifViewModel : GIFViewModel
    @State var inFav  : Bool = false
    @State var item : Int
    func addItem(){
        if ( !favouriteList.idlist.contains(gifViewModel.GIFInfo[item].id )) {
            favouriteList.favlist.append(gifViewModel.GIFInfo[item])
            favouriteList.idlist.append(gifViewModel.GIFInfo[item].id)
            inFav = true
        }
    }
    
    var body: some View {
        VStack {
            Text(gifViewModel.GIFInfo[item].title)
            AnimatedImage(url: gifViewModel.GIFInfo[item].images.original.url)
                .resizable()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 500, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 300, alignment: .leading)
                .scaledToFit()
            Button( action: addItem) {
               Text("Add to Favourite")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color("G4"))
                    .foregroundColor(Color("IP"))
                    .cornerRadius(5)
            }
//            .alert(isPresented: $inFav){
//                Alert(title: Text("Add to favourite"), message: Text( "This is in your favourite already!!"))
//            }
        }
    }
}

struct SGIFDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SGIFDetailsView(favouriteList : FavouriteList(), gifViewModel: GIFViewModel(), item: 0)
    }
}

