//
//  ContentView.swift
//  MovieDB
//
//  Created by MAC os on 8/30/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    
    @State var movies = [DetailModel]()
    @State var searchText = ""
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Text("Search")
                        .fontWeight(.semibold)
                    VStack {
                        SearchBar(text: $searchText)
                        list
                        
                        .onAppear{
                            UITableView.appearance().backgroundColor = colorScheme == .dark ? .black : .white
                        }
                    }
                }
                .onAppear{
                    MovieViewModel.shared.getMovieseList { movieDetails in
                        if movieDetails != nil{
                            self.movies = movieDetails!
                        }
                    }
                }
            }
        }.accentColor(colorScheme == .light ? Color.black : Color.white)
    }
    var list: some View{
        List(movies.filter({ searchText.isEmpty ? true : $0.original_title.lowercased().contains(searchText.lowercased())})) { item in
            
            NavigationLink(destination:
                            DetailView(movie : item)
            ) {
                HStack{
                    
                    WebImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(item.poster_path)"))
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(15)
                        .padding(5)
                    VStack (alignment: .leading){
                        Text(item.original_title)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        Text(item.release_date)
                    }.padding()
                    Spacer()
                }
                
                .navigationBarHidden(true)
            }        .listRowBackground(colorScheme == .dark ? Color.black : Color.white)

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
             ContentView()
     }
}
