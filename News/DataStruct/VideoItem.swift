//
//  VideoItem.swift
//  News
//
//  Created by Francisco Rios on 9/03/23.
//

import Foundation

struct DataVideoItem: Decodable {
    let data: [VideoItem]
}

struct VideoItem: Decodable {
    let intMediaId: Int
    let intMediaGroupId: Int
    let vchTitulo: String
    let vchCreador: String
    let dtmFecha: String
    let dtmHora: String
    let vchImageRef: String
    let vchUrlRef: String?
    let vchArchivo: String
    let vchUrl: String
}
