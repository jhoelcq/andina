//
//  SearchViewController.swift
//  News
//
//  Created by Francisco Rios on 13/03/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchItems: [SearchItem] = [
        SearchItem(
            intSearchId: 1,
            vchTipo: "video",
            vchTitulo: "Alberto Otárola sobre adelanto de elecciones: estamos seguros de que habrá una salida",
            dtmFecha: "2023-01-30T00:00:00",
            vchHora: "15:40",
            vchUrl: nil,
            vchNombreSeccion: nil,
            vchImagen: "https://portal.andina.pe/EDPmedia/fotografia/2023/01/30/58933_000928152W.jpg",
            vchVideo: "https://portal.andina.pe/EDPmedia/video/2023/01/30/58933_otarola_elecciones.mp4"
        ),
        SearchItem(
            intSearchId: 2,
            vchTipo: "noticia",
            vchTitulo: "Otárola: Congreso debe tomar una decisión sobre el adelanto de elecciones con prontitud",
            dtmFecha: "2023-01-30T00:00:00",
            vchHora: "15:37",
            vchUrl: nil,
            vchNombreSeccion: "Política",
            vchImagen: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2023/01/26/000929050W.jpg",
            vchVideo: nil
        ),
        SearchItem(
            intSearchId: 3,
            vchTipo: "fotografia",
            vchTitulo: "El premier Alberto Otárola lideró la instalación de comisión multisectorial que propondrá estrategias y políticas de intervención para luchar contra el narcotráfico en la zona.\r\nFoto: ANDINA/Difusión",
            dtmFecha: "2023-01-26T00:00:00",
            vchHora: "21:40",
            vchUrl: nil,
            vchNombreSeccion: "Política",
            vchImagen: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2023/01/26/000929049W.jpg",
            vchVideo: nil
        )
    ]

    @IBOutlet weak var containerInputSearch: UIView!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        containerInputSearch.layer.cornerRadius = 20
        containerInputSearch.layer.masksToBounds = true
        
        searchTableView.dataSource = self
        searchTableView.delegate = self
        
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        
        searchTableView.register(nib, forCellReuseIdentifier: "SearchTableViewCell")
        // videos =
        searchTableView.reloadData()
    }
}


extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        
        cell.selectionStyle = .none
            
        // Configura la celda con los datos correspondientes
        
        let item = searchItems[indexPath.row]
        
        cell.titleLabel.text = item.vchTitulo
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: item.dtmFecha) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            cell.datetimeLabel.text = "\(item.vchHora) - \(dateFormatter.string(from: date))"
        }
        
        if let url = URL(string: item.vchImagen) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        cell.thumbnail.image = image
                    }
                }
            }
            task.resume()
        }
        
        switch item.vchTipo {
        case "noticia":
            cell.sectionLabel.text = "Noticia: \(item.vchNombreSeccion ?? "")"
        case "fotografia":
            cell.sectionLabel.text = "Galería: \(item.vchNombreSeccion ?? "")"
            cell.saveButton.isHidden = true
        default:
            cell.sectionLabel.text = "Video"
            cell.saveButton.isHidden = true
        }
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    
}
