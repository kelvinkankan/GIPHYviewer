//
//  FavouriteListView.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 16/2/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct FavouriteListView: View {
    @ObservedObject var favouriteList : FavouriteList
    func delete(at offsets:IndexSet){
        favouriteList.favlist.remove(atOffsets: offsets)
        favouriteList.idlist.remove(atOffsets: offsets)
    }
    
    var body: some View {
        VStack{
            Text("Favourite GIF")
                .fontWeight(.heavy)
                .bold()
                .font(Font.custom("Helvetica Neue", size: 30 ))
                
            List{
                ForEach(favouriteList.favlist, id:\.self){item in
                            AnimatedImage(url: item.images.original.url)
                                .resizable()
                                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: 500, maxWidth: 500, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 300, maxHeight: 300, alignment: .leading)
                                .scaledToFit()
                }.onDelete(perform: delete)
            }
//            }
            
            Spacer()
            Text(String(favouriteList.favlist.count) + "Saved GIF." )
        }
    }
}

struct FavouriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteListView(favouriteList : FavouriteList())
    }
}
