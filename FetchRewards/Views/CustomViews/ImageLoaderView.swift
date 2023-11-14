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
