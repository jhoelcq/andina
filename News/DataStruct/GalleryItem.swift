//
//  GalleryItem.swift
//  News
//
//  Created by Francisco Rios on 10/03/23.
//

import Foundation

struct DataGalleryItem: Decodable {
    let data: [GalleryItem]
}

struct GalleryItem: Decodable {
    let intGaleriaId: Int
    let intPublicacionId: Int
    let vchTitulo: String
    let txtDescription: String?
    let vchKeywords: String?
    let vchTags: String?
    let chrEstado: String?
    let vchCreador: String
    let dtmFechaCreacion: String
    let vchModificador: String?
    let dtmFechaModificacion: String?
    let arrFotografias: [Gallery]
}

struct Gallery: Decodable {
    let intCodigoDetalle: Int
    let intGaleriaId: Int
    let intFotografiaId: Int
    let txtLeyenda: String
    let chrPortada: String?
    let intOrden: Int
    let vchCreador: String
    let dtmFechaCreacion: String
    let vchModificador: String?
    let dtmFechaModificacion: String?
    let intSeccionId: Int
    let vchNombreSeccion: String
    let vchUrlImgPequena: String
    let vchUrlImgMediana: String
    let vchUrlImgWeb: String
}
