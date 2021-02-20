//
//  GIFDetailsView.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 20/2/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct TGIFDetailsView: View {
    @ObservedObject var favouriteList : FavouriteList
    @ObservedObject var gifViewModel2 : GIFViewModel2
    @State var inFav  : Bool = false
    var item : Int
    
    func addItem(){
        if ( !favouriteList.idlist.contains(gifViewModel2.GIFInfo[item].id) ) {
            favouriteList.favlist.append(gifViewModel2.GIFInfo[item])
            favouriteList.idlist.append(gifViewModel2.GIFInfo[item].id)
            inFav = true
        }
    }
    
    var body: some View {
        VStack {
            Text(gifViewModel2.GIFInfo[item].title)
            AnimatedImage(url: gifViewModel2.GIFInfo[item].images.original.url)
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
        }
    }
}

struct TGIFDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        TGIFDetailsView(favouriteList : FavouriteList(), gifViewModel2: GIFViewModel2(), item: 0)
    }
}
