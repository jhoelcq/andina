//
//  VideosViewController.swift
//  News
//
//  Created by Francisco Rios on 9/03/23.
//

import UIKit

class VideosViewController: UIViewController {

    // MARK: - Properties
    
    var videos: [VideoItem] = [
        VideoItem(
            intMediaId: 58947,
            intMediaGroupId: 36,
            vchTitulo: "Línea 2 del Metro: el tren de Lima que funciona sin piloto",
            vchCreador: "Kmeweb",
            dtmFecha: "2023-02-01T00:00:00",
            dtmHora: "07:34",
            vchImageRef: "https://portal.andina.pe/EDPmedia/fotografia/2023/02/01/58947_tren md.jpg",
            vchUrlRef: "https://www.youtube.com/embed/KHiRc7fEZts",
            vchArchivo: "https://portal.andina.pe/EDPmedia/video/2023/02/01/58947_linea 2 metro de Lima y Callao_1.mp4",
            vchUrl: "https://andina.pe/agencia/video-linea-2-del-metro-tren-lima-funciona-sin-piloto-58947.aspx"
        ),
        VideoItem(
            intMediaId: 27930,
            intMediaGroupId: 169,
            vchTitulo: "Soplar los alimentos del bebé puede producir caries",
            vchCreador: "dmcweb",
            dtmFecha: "2013-07-11T14:13:55.017",
            dtmHora: "07:34",
            vchImageRef: "https://portal.andina.pe/EDPmedia2/fotografia/2013/07/11/27930_27909_fotograma2.jpg",
            vchUrlRef: "",
            vchArchivo: "https://portal.andina.pe/EDPmedia2/video/2013/07/11/27930_27909_vide ok.flv",
            vchUrl: "https://andina.pe/agencia/video-soplar-los-alimentos-del-bebe-puede-producir-caries-27930.aspx"
        ),
        VideoItem(
            intMediaId: 58987,
            intMediaGroupId: 36,
            vchTitulo: "Arequipa en alerta: 36 muertos por lluvias y huaicos",
            vchCreador: "dmcweb",
            dtmFecha: "2013-07-11T14:13:55.017",
            dtmHora: "07:34",
            vchImageRef: "https://portal.andina.pe/EDPmedia/fotografia/2023/02/06/58987_Miniatura Mod.jpg",
            vchUrlRef: "",
            vchArchivo: "https://portal.andina.pe/EDPmedia/video/2023/02/06/58987_Lluvias Mod 36.mp4",
            vchUrl: "https://andina.pe/agencia/video-arequipa-alerta-36-muertos-lluvias-y-huaicos-58987.aspx"
        )
    ]
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerInputSearch: UIView!
    @IBOutlet weak var videosTableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        containerInputSearch.layer.cornerRadius = 20
        containerInputSearch.layer.masksToBounds = true
         
        videosTableView.dataSource = self
        videosTableView.delegate = self
        
        let nib = UINib(nibName: "VideosTableViewCell", bundle: nil)
        
        videosTableView.register(nib, forCellReuseIdentifier: "VideosTableViewCell")
        // videos =
        videosTableView.reloadData()
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

extension VideosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as! VideosTableViewCell
        
        cell.selectionStyle = .none
            
        // Configura la celda con los datos correspondientes
        let video = videos[indexPath.row]
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: video.dtmFecha) {
            dateFormatter.dateFormat = "dd.MM.yyyy"
            cell.dateLabel.text = dateFormatter.string(from: date)
        }
        
        cell.titleLabel.text = video.vchTitulo
        
        if let url = URL(string: video.vchImageRef) {
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

extension VideosViewController: UITableViewDelegate {
    
}
