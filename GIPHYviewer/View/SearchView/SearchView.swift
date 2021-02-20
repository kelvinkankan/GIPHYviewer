//
//  SearchView.swift
//  GIFHYviewer
//
//  Created by Kevin Kan on 16/2/2021.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var favouriteList : FavouriteList
    @ObservedObject var GIFviewModel = GIFViewModel()
    @ObservedObject var GIFviewModel2 = GIFViewModel2()
    var GIFSearchList = GIFViewModel().GIFInfo
    
    var GIFTrendList =  GIFViewModel2().GIFInfo
    @State var searchKey : String = ""
    @State var isSearching : Bool = false
    var body: some View {
        VStack{
            TextField("Search GIFPY", text: $searchKey, onEditingChanged: { (_) in
            }) {
                if !self.searchKey.isEmpty {
                    self.GIFviewModel.fetch(searchKey: searchKey)
                    self.isSearching = true
                }
                else{
                    self.GIFviewModel2.fetch()
                    self.isSearching = false
                }
            }
           
            .padding()
            .background(Color("G1"))
            .cornerRadius(15)
            
//            VStack {
                if (isSearching == true){
                    if (!GIFviewModel.GIFInfo.isEmpty){
                        DisplaySearchingGIF(favouriteList: favouriteList, gifViewModel:GIFviewModel, searchKey:searchKey)
                    }
                } else{
                    if (!GIFviewModel2.GIFInfo.isEmpty){
                        DisplayTredningGIF(favouriteList: favouriteList, gifViewModel2: GIFviewModel2)
                    }
                }
//            }
            Spacer()
            HStack {
                Spacer()
                Text("Powered by GIFHY")
                    .fontWeight(.bold)
                    .font(.footnote)
                    .padding(.trailing,5)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchView(favouriteList: FavouriteList())
            SearchView(favouriteList: FavouriteList())
                .colorScheme(.dark)
                .background(Color.black)
        }
        
    }
}
