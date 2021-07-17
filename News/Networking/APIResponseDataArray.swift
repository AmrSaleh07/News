//
//  APIResponseDataArray.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

struct APIResponseDataArray<DataType:Decodable> {
    
    let status: String?
    let totalResults: Int?
    let articles: [DataType]?
}

