//
//  Comic.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation

// MARK: - Comic
struct Comic: Codable  {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClassComic
}

// MARK: - DataClass
struct DataClassComic: Codable  {
    let offset, limit, total, count: Int
    let results: [ResultComic]
}

// MARK: - Result
struct ResultComic: Codable  {
    let id: Int
    let title: String
    let issueNumber: Int
    let variantDescription: String
    let description: String?
    let modified: String
    let isbn: String
    let upc: String
    let diamondCode: String
    let ean, issn: String
    let format: String
    let pageCount: Int
    let textObjects: [TextObject]
    let resourceURI: String
    let urls: [URLElementComic]
    let series: Series
    let variants: [Series]
    //let collections: [Any?]
    //let collectedIssues: [Series]
    let dates: [DateElement]
    let prices: [Price]
    let thumbnail: ThumbnailComic
    let images: [ThumbnailComic]
    let creators: Creators
    let characters: Characters
    let stories: StoriesComic
    let events: Characters
}

// MARK: - Characters
struct Characters: Codable  {
    let available: Int
    let collectionURI: String
    let items: [Series]
    let returned: Int
}

// MARK: - Series
struct Series: Codable  {
    let resourceURI: String
    let name: String
}

// MARK: - Creators
struct Creators: Codable  {
    let available: Int
    let collectionURI: String
    let items: [CreatorsItem]
    let returned: Int
}

// MARK: - CreatorsItem
struct CreatorsItem: Codable {
    let resourceURI: String
    let name: String
    let role: String
}


// MARK: - DateElement
struct DateElement: Codable  {
    let type: String
    let date: String
}






// MARK: - Thumbnail
struct ThumbnailComic: Codable {
    let path: String
    let thumbnailExtension: String?
}



// MARK: - Price
struct Price: Codable {
    let type: String
    let price: Double
}



// MARK: - Stories
struct StoriesComic: Codable {
    let available: Int
    let collectionURI: String
    let items: [StoriesItemComic]
    let returned: Int
}

// MARK: - StoriesItem
struct StoriesItemComic: Codable {
    let resourceURI: String
    let name: String
    let type: String
}


// MARK: - TextObject
struct TextObject: Codable {
    let type: String
    let language: String
    let text: String
}




// MARK: - URLElement
struct URLElementComic: Codable {
    let type: String
    let url: String
}
