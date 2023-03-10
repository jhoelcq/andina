//
//  NewsItem.swift
//  News
//
//  Created by Francisco Rios on 7/03/23.
//

import Foundation

struct DataNewsItem: Decodable {
    let data: [NewsItem]
}

struct NewsItem: Decodable {
    let intNoticiaId: Int
    let intSeccionId: Int
    let vchTitulo: String
    let vchBajada: String
    let vchDescripcion: String
    let txtContenido: String
    let contenidoLimpio: String
    let vchCreador: String
    let vchNombreSeccion: String
    let vchUrl: String
    let dtmFecha: String
    let vchHora: String
    let arrFotografias: [Foto]
}

struct Foto: Decodable {
    let intFotografiaId: Int
    let intNoticiaId: Int
    let vchLeyenda: String
    let vchUrlImgPequena: String
    let vchUrlImgMediana: String
    let vchUrlImgWeb: String
}
