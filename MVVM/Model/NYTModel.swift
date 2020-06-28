//
//  NYTModelView.swift
//  NYTimes
//
//  Created by Abdul on 22/06/20.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct NYTResponse : Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Results]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }

}

struct Results : Codable {
    let uri : String?
    let url : String?
    let id : Int?
    let asset_id : Int?
    let source : String?
    let published_date : String?
    let updated : String?
    let section : String?
    let subsection : String?
    let nytdsection : String?
    let adx_keywords : String?
    let column : String?
    let byline : String?
    let type : String?
    let title : String?
    let abstract : String?
    let des_facet : [String]?
    let org_facet : [String]?
    let per_facet : [String]?
    let geo_facet : [String]?
//    let media : [String]?
    let eta_id : Int?

    enum CodingKeys: String, CodingKey {

        case uri = "uri"
        case url = "url"
        case id = "id"
        case asset_id = "asset_id"
        case source = "source"
        case published_date = "published_date"
        case updated = "updated"
        case section = "section"
        case subsection = "subsection"
        case nytdsection = "nytdsection"
        case adx_keywords = "adx_keywords"
        case column = "column"
        case byline = "byline"
        case type = "type"
        case title = "title"
        case abstract = "abstract"
        case des_facet = "des_facet"
        case org_facet = "org_facet"
        case per_facet = "per_facet"
        case geo_facet = "geo_facet"
//        case media = "media"
        case eta_id = "eta_id"
    }

}
