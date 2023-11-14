//
//  ImageView.swift
//  FetchRewards
//
//

import SwiftUI

struct ImageLoaderView: View {
    @ObservedObject private var imageViewCache: ImageCache
    
    init(urlString: String?) {
        imageViewCache = ImageCache(urlString: urlString)
    }
    
    var body: some View {
        Image(uiImage: imageViewCache.image ?? UIImage())
            .resizable().aspectRatio(contentMode: .fit)
    }
}

#Preview {
    ImageLoaderView(urlString: "https://www.themealdb.com//images//media//meals//adxcbq1619787919.jpg")
}
