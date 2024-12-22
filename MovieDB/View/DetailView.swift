//
//  MovieDetailView.swift
//  MovieDB
//
//  Created by MAC os on 8/30/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    var movie : DetailModel
    var screenSize = UIScreen.main.bounds.width
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    Text(movie.original_title)
                        .font(.title)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    WebImage(url: URL(string:"https://image.tmdb.org/t/p/w500\(movie.poster_path)"))
                        .resizable()
                        .frame(width: screenSize, height: screenSize)
                        .cornerRadius(15)
                    
                    Text(movie.overview)
                        .animation(.easeInOut(duration:1.0))
                        .padding()
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
