//
//  MyNewsViewController.swift
//  News
//
//  Created by Francisco Rios on 10/03/23.
//

import UIKit

class MyNewsViewController: UIViewController {

    // MARK: - Properties
    
    var myNews: [NewsItem] = [
        NewsItem(
            intNoticiaId: 460098,
            intSeccionId: 2,
            vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú 1",
            vchBajada: "",
            vchDescripcion: "",
            txtContenido: "",
            contenidoLimpio: "",
            vchCreador: "gcanchari",
            vchNombreSeccion: "Economía",
            vchUrl: "",
            dtmFecha: "2013-05-26T00:00:00",
            vchHora: "17:18",
            arrFotografias: [
            Foto(
                intFotografiaId: 210665,
                intNoticiaId: 460098,
                vchLeyenda: "Delegación peruana.",
                vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg",
                vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg",
                vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")
            ]
        ),
        NewsItem(
            intNoticiaId: 460098,
            intSeccionId: 2,
            vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú 2",
            vchBajada: "",
            vchDescripcion: "",
            txtContenido: "",
            contenidoLimpio: "",
            vchCreador: "gcanchari",
            vchNombreSeccion: "Economía",
            vchUrl: "",
            dtmFecha: "2013-05-26T00:00:00",
            vchHora: "17:18",
            arrFotografias: [
            Foto(
                intFotografiaId: 210665,
                intNoticiaId: 460098,
                vchLeyenda: "Delegación peruana.",
                vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg",
                vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg",
                vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")
            ]
        ),
        NewsItem(
            intNoticiaId: 460098,
            intSeccionId: 2,
            vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú 3",
            vchBajada: "",
            vchDescripcion: "",
            txtContenido: "",
            contenidoLimpio: "",
            vchCreador: "gcanchari",
            vchNombreSeccion: "Economía",
            vchUrl: "",
            dtmFecha: "2013-05-26T00:00:00",
            vchHora: "17:18",
            arrFotografias: [
            Foto(
                intFotografiaId: 210665,
                intNoticiaId: 460098,
                vchLeyenda: "Delegación peruana.",
                vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg",
                vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg",
                vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")
            ]
        ),
        NewsItem(
            intNoticiaId: 460098,
            intSeccionId: 2,
            vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú 4",
            vchBajada: "",
            vchDescripcion: "",
            txtContenido: "",
            contenidoLimpio: "",
            vchCreador: "gcanchari",
            vchNombreSeccion: "Economía",
            vchUrl: "",
            dtmFecha: "2013-05-26T00:00:00",
            vchHora: "17:18",
            arrFotografias: [
            Foto(
                intFotografiaId: 210665,
                intNoticiaId: 460098,
                vchLeyenda: "Delegación peruana.",
                vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg",
                vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg",
                vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")
            ]
        ),
        NewsItem(
            intNoticiaId: 460098,
            intSeccionId: 2,
            vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú 5",
            vchBajada: "",
            vchDescripcion: "",
            txtContenido: "",
            contenidoLimpio: "",
            vchCreador: "gcanchari",
            vchNombreSeccion: "Economía",
            vchUrl: "",
            dtmFecha: "2013-05-26T00:00:00",
            vchHora: "17:18",
            arrFotografias: [
            Foto(
                intFotografiaId: 210665,
                intNoticiaId: 460098,
                vchLeyenda: "Delegación peruana.",
                vchUrlImgPequena: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg",
                vchUrlImgMediana: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg",
                vchUrlImgWeb: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")
            ]
        )
    ]
    
    // MARK: - Outlets
    
    @IBOutlet weak var myNewsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        myNewsTableView.dataSource = self
        myNewsTableView.delegate = self
        
        let nib = UINib(nibName: "MyNewsTableViewCell", bundle: nil)
        
        myNewsTableView.register(nib, forCellReuseIdentifier: "MyNewsTableViewCell")
        // relatedNews =
        myNewsTableView.reloadData()
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

extension MyNewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyNewsTableViewCell", for: indexPath) as! MyNewsTableViewCell
        
        cell.selectionStyle = .none
            
        // Configura la celda con los datos correspondientes
        let newsItem = myNews[indexPath.row]
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: newsItem.dtmFecha) {
            dateFormatter.dateFormat = "dd 'de' MMMM, yyyy"
            cell.dateTimeLabel.text = "\(newsItem.vchHora) - \(dateFormatter.string(from: date))"
        }
        
        cell.titleLabel.text = newsItem.vchTitulo
        
        if let url = URL(string: newsItem.arrFotografias[0].vchUrlImgMediana) {
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

extension MyNewsViewController: UITableViewDelegate {
    
}
