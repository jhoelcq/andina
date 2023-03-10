//
//  GalleryViewController.swift
//  News
//
//  Created by Francisco Rios on 10/03/23.
//

import UIKit

class GalleryViewController: UIViewController {

    var gallery: [GalleryItem] = [
        GalleryItem(
            intGaleriaId: 20,
            intPublicacionId: 0,
            vchTitulo: "Resumen fotográfico 2022",
            txtDescription: "",
            vchKeywords: "",
            vchTags: "",
            chrEstado: "",
            vchCreador: "mmilla",
            dtmFechaCreacion: "2022-12-30T15:49:48.063",
            vchModificador: nil,
            dtmFechaModificacion: nil,
            arrFotografias: [
                Gallery(
                    intCodigoDetalle: 537,
                    intGaleriaId: 20,
                    intFotografiaId: 922608,
                    txtLeyenda: "El derrame de 11 mil barriles de petróleo, de Repsol, ocurrido el 15 de enero en el mar de Ventanilla generó un impacto ambiental gigantesco en la costa peruana. Foto: ANDINA/Jhonel Rodríguez",
                    chrPortada: "",
                    intOrden: 1,
                    vchCreador: "mmilla",
                    dtmFechaCreacion: "2022-12-30T15:52:33.38",
                    vchModificador: nil,
                    dtmFechaModificacion: nil,
                    intSeccionId: 17,
                    vchNombreSeccion: "Política",
                    vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922608P.jpg",
                    vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922608M.jpg",
                    vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922608W.jpg"
                ),
                Gallery(
                    intCodigoDetalle: 537,
                    intGaleriaId: 20,
                    intFotografiaId: 922608,
                    txtLeyenda: "En invierno, Lima registró las más bajas temperaturas desde 1996. Foto: ANDINA/Renato Pajuelo",
                    chrPortada: "",
                    intOrden: 1,
                    vchCreador: "mmilla",
                    dtmFechaCreacion: "2022-12-30T15:52:33.38",
                    vchModificador: nil,
                    dtmFechaModificacion: nil,
                    intSeccionId: 17,
                    vchNombreSeccion: "Política",
                    vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610P.jpg",
                    vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610M.jpg",
                    vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610W.jpg"
                )
            ]
        ),
        GalleryItem(
            intGaleriaId: 20,
            intPublicacionId: 0,
            vchTitulo: "Continúan las restricciones como la inmovilización social obligatoria. Foto: ANDINA/Mindef",
            txtDescription: "",
            vchKeywords: "",
            vchTags: "",
            chrEstado: "",
            vchCreador: "mmilla",
            dtmFechaCreacion: "2022-12-30T15:49:48.063",
            vchModificador: nil,
            dtmFechaModificacion: nil,
            arrFotografias: [
                Gallery(
                    intCodigoDetalle: 537,
                    intGaleriaId: 20,
                    intFotografiaId: 922608,
                    txtLeyenda: "El derrame de 11 mil barriles de petróleo, de Repsol, ocurrido el 15 de enero en el mar de Ventanilla generó un impacto ambiental gigantesco en la costa peruana. Foto: ANDINA/Jhonel Rodríguez",
                    chrPortada: "",
                    intOrden: 1,
                    vchCreador: "mmilla",
                    dtmFechaCreacion: "2022-12-30T15:52:33.38",
                    vchModificador: nil,
                    dtmFechaModificacion: nil,
                    intSeccionId: 17,
                    vchNombreSeccion: "Política",
                    vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2021/12/30/000835673P.jpg",
                    vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2021/12/30/000835673M.jpg",
                    vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2021/12/30/000835673W.jpg"
                ),
                Gallery(
                    intCodigoDetalle: 537,
                    intGaleriaId: 20,
                    intFotografiaId: 922608,
                    txtLeyenda: "En invierno, Lima registró las más bajas temperaturas desde 1996. Foto: ANDINA/Renato Pajuelo",
                    chrPortada: "",
                    intOrden: 1,
                    vchCreador: "mmilla",
                    dtmFechaCreacion: "2022-12-30T15:52:33.38",
                    vchModificador: nil,
                    dtmFechaModificacion: nil,
                    intSeccionId: 17,
                    vchNombreSeccion: "Política",
                    vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610P.jpg",
                    vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610M.jpg",
                    vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2022/12/30/000922610W.jpg"
                )
            ]
        )
    ]

    @IBOutlet weak var galleryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        galleryTableView.dataSource = self
        galleryTableView.delegate = self
        
        let nib = UINib(nibName: "GalleryTableViewCell", bundle: nil)
        
        galleryTableView.register(nib, forCellReuseIdentifier: "GalleryTableViewCell")
        // relatedNews =
        galleryTableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension GalleryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gallery.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryTableViewCell", for: indexPath) as! GalleryTableViewCell
        
        cell.selectionStyle = .none
            
        // Configura la celda con los datos correspondientes
        let galleryItem = gallery[indexPath.row]
        
        cell.titleLabel.text = galleryItem.vchTitulo
        cell.countLabel.text = String(galleryItem.arrFotografias.count)
        
        if let url = URL(string: galleryItem.arrFotografias[0].vchUrlImgMediana) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.thumbnail.image = image
                    }
                }
            }
            task.resume()
        }
        
        return cell
    }
}

extension GalleryViewController: UITableViewDelegate {
}
