//
//  SearchItem.swift
//  News
//
//  Created by Francisco Rios on 13/03/23.
//

import Foundation

struct DataSearchItem: Decodable {
    let data: [SearchItem]
}

struct SearchItem: Decodable {
    let intSearchId: Int
    let vchTipo: String
    let vchTitulo: String
    let dtmFecha: String
    let vchHora: String
    let vchUrl: String?
    let vchNombreSeccion: String?
    let vchImagen: String
    let vchVideo: String?
}
