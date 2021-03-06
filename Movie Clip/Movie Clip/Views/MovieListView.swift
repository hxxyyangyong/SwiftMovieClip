//
//  MovieListView.swift
//  Wrist Movies WatchKit Extension
//
//  Created by Narcis Zait on 09/03/2020.
//  Copyright © 2020 Narcis Zait. All rights reserved.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct NewestMovieListView: View {
    @ObservedObject var ​movieListVM = NewestMovieListViewModel()
    
    init() {
        self.​movieListVM.fetchAllNewMovies()
    }
    
    var body: some View {
        NavigationView {
            List(​movieListVM.movies, id:\.title) { movie in
                NavigationLink(
                    destination: MovieListViewCell(movie: movie),
                    label: {
                        Text(movie.title)
                            .font(.headline)
                    })
            }
            .onAppear {
                print(self.​movieListVM.movies.count)
            }.navigationBarTitle("New Movies", displayMode: .automatic)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        NewestMovieListView()
    }
}

//HStack {
//    KFImage(URL(string: movie.poster)!)
//    .resizable()
//    .scaledToFit()
//    .clipShape(RoundedRectangle(cornerRadius: 20))
//    .frame(width: 80, height: 80)
//
//
//    VStack(alignment: .leading) {
//        Text(movie.title)
//            .minimumScaleFactor(0.5)
//    }
//}
