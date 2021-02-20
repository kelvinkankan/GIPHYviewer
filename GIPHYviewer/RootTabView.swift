//
//  RootTabView.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 17/2/2021.
//

import SwiftUI

struct RootTabView: View {
    @ObservedObject var favouriteList =  FavouriteList()
    var body: some View {
        TabView{
            SearchView(favouriteList: favouriteList)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Serach")
                }
            FavouriteListView(favouriteList: favouriteList)
                .tabItem {
                    Image(systemName: "book")
                    Text("Favourite")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView(favouriteList :  FavouriteList())
        RootTabView(favouriteList :  FavouriteList())
            .colorScheme(.dark)
            .background(Color.black)
            .previewDevice("iPad Pro (9.7-inch)")
        
    }
}
