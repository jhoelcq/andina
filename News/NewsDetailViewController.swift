//
//  NewsDetailViewController.swift
//  News
//
//  Created by Francisco Rios on 7/03/23.
//

import UIKit
import Alamofire
import SDWebImage

class NewsDetailViewController: UIViewController {

    // MARK: - Properties
    
    var newsItem: NewsItem = NewsItem(
        intNoticiaId: 460098,
        intSeccionId: 2,
        vchTitulo: "Empresarios de EAU conocen prioridad que tienen las inversiones en Perú",
        vchBajada: "",
        vchDescripcion: "",
        txtContenido: "<p>Primer parrafo</p><p>Lorem ipsum...</p>",
        contenidoLimpio: "",
        vchCreador: "gcanchari",
        vchNombreSeccion: "Economía",
        vchUrl: URL(string: "https://andina.pe/agencia/noticia-empresarios-eau-conocen-prioridad-tienen-las-inversiones-peru-460098.aspx")!,
        dtmFecha: "2013-05-26T00:00:00",
        vchHora: "17:18",
        arrFotografias: [Foto(
            intFotografiaId: 210665,
            intNoticiaId: 460098,
            vchLeyenda: "Delegación peruana encabezada por el ministro de Economía, Luis Miguel Castilla, en la foto oficial del road show de inversiones que se inició hoy en Abu Dhabi y Dubái. Foto: inPerú",
            vchUrlImgPequena: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2018/03/26/000491816P.jpg")!,
            vchUrlImgMediana: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2018/03/26/000491816M.jpg")!,
            vchUrlImgWeb: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2018/03/26/000491816W.jpg")!),
        Foto(
            intFotografiaId: 210665,
            intNoticiaId: 460098,
            vchLeyenda: "Delegación peruana.",
            vchUrlImgPequena: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841P.jpg")!,
            vchUrlImgMediana: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841M.jpg")!,
            vchUrlImgWeb: URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2019/01/09/000554841W.jpg")!)]
    )
    
    // MARK: - Outlets∫
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var carouselView: UIImageView!
    @IBOutlet weak var carouselLeftButton: UIButton!
    @IBOutlet weak var carouselRightButton: UIButton!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionImgLabel: UILabel!
    
    @IBOutlet weak var groupContainer: UIStackView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set title label's text
        titleLabel.text = newsItem.vchTitulo
        
        // Set title label's font and color
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        
        // Set title label's constraints
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        
        // Set title label's number of lines and line break mode
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        // carouselView
        carouselView.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 16, width: view.frame.width, height: 200)
        
        carouselView.contentMode = .scaleAspectFill
        carouselView.clipsToBounds = true
        
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            carouselView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
        /*
        let images = newsItem.arrFotografias.compactMap { foto in
            print(foto.vchUrlImgMediana)
            UIImage(contentsOfFile: foto.vchUrlImgMediana)
        }*/
         
        let __url = URL(string: "https://portal.andina.pe/EDPFotografia3/Thumbnail/2018/03/26/000491816M.jpg")
                
        carouselView.sd_setImage(with: __url, completed: { (image, error, cacheType, url) in
            print("completed")
            if let error = error {
                print("Error al cargar la imagen: \(error.localizedDescription)")
            }
        })
    
        carouselView.animationImages = []
        carouselView.animationDuration = Double(newsItem.arrFotografias.count) * 2.0
        carouselView.startAnimating()
        
        carouselPageControl.translatesAutoresizingMaskIntoConstraints = false
        carouselPageControl.numberOfPages = newsItem.arrFotografias.count
        carouselPageControl.currentPage = 0
        carouselPageControl.currentPageIndicatorTintColor = .systemBlue
        carouselPageControl.pageIndicatorTintColor = .systemGray

        // Configura las restricciones del page control
        carouselPageControl.bottomAnchor.constraint(equalTo: carouselView.bottomAnchor, constant: 8).isActive = true
        carouselPageControl.centerXAnchor.constraint(equalTo: carouselView.centerXAnchor).isActive = true
        

        carouselLeftButton.translatesAutoresizingMaskIntoConstraints = false
        carouselLeftButton.text = ""
        carouselLeftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        carouselLeftButton.addTarget(self, action: #selector(didTapLeftButton), for: .touchUpInside)

        carouselRightButton.translatesAutoresizingMaskIntoConstraints = false
        carouselRightButton.text = ""
        carouselRightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        carouselRightButton.addTarget(self, action: #selector(didTapRightButton), for: .touchUpInside)


        // Configura las restricciones de los botones
        carouselLeftButton.centerYAnchor.constraint(equalTo: carouselView.centerYAnchor).isActive = true
        carouselLeftButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true

        carouselRightButton.centerYAnchor.constraint(equalTo: carouselView.centerYAnchor).isActive = true
        carouselRightButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        
        
        // Hora
        timeLabel.text = newsItem.vchHora
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textColor = .red
        timeLabel.numberOfLines = 0
        timeLabel.sizeToFit()
        timeLabel.frame.origin = CGPoint(x: 16, y: carouselView.frame.maxY + 16)
        
        // fecha
        dateLabel.text = "-test-"
        dateLabel.font = UIFont.systemFont(ofSize: 10)
        dateLabel.textColor = .black
        dateLabel.adjustsFontSizeToFitWidth = true
        dateLabel.numberOfLines = 1
        dateLabel.lineBreakMode = .byTruncatingTail
        dateLabel.sizeToFit()
        dateLabel.frame.origin = CGPoint(x: timeLabel.frame.maxX + 4, y: carouselView.frame.maxY + 16)
        dateLabel.frame.size.width = UIScreen.main.bounds.width - dateLabel.frame.minX - 16
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        guard let date = dateFormatter.date(from: newsItem.dtmFecha) else {
            return
        }
        
        dateFormatter.dateFormat = "dd 'de' MMMM, yyyy"
        dateLabel.text = "- \(dateFormatter.string(from: date))"
        
        // Leyenda imagen
        
        captionImgLabel.text = "Delegación peruana encabezada por el ministro de Economía, Luis Miguel Castilla, en la foto oficial del road show de inversiones que se inició hoy en Abu Dhabi y Dubái. Foto: inPerú"
        captionImgLabel.font = UIFont.systemFont(ofSize: 10)
        captionImgLabel.textColor = .black
        captionImgLabel.numberOfLines = 0
        captionImgLabel.lineBreakMode = .byWordWrapping
        captionImgLabel.sizeToFit()
        captionImgLabel.frame.origin = CGPoint(x: 16, y: dateLabel.frame.maxY + 16)
        captionImgLabel.frame.size.width = UIScreen.main.bounds.width - 16 * 2
        
        // group container
        groupContainer.frame.origin = CGPoint(x: 16, y: captionImgLabel.frame.maxY + 16)
        groupContainer.frame.size.width = view.frame.width - 32
        groupContainer.backgroundColor = .gray
        
        
        /*
        AF.request("http://104.196.199.198/api/EdpNoticias/460098").responseDecodable(of: NewsItem.self) {
            response in switch response.result {
            case .success(let data):
                print("data:  \(data)")
            case .failure(let error):
                // La petición falló
                print("Error response fail: \(error.localizedDescription)")
            }
        }
         */
        
        /*
            .responseJSON {
                response in
                switch response.result {
                case .success(let data):
                    // Convertir los datos JSON en un objeto Dictionary
                    if let json = data as? [String: Any] {
                        // Crear un objeto NewsItem a partir de los datos
                        self.newsItem = try ? JSONDecoder().decode(NewsItem.self, from: JSONSerialization.data(withJSONObject: json))
                        // Usar la variable newsItem aquí
                        print(self.newsItem)
                        
                        DispatchQueue.main.async {
                            self.titleLabel.text = self.newsItem?.vchTitulo
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
         */
    }
    
    
    @IBAction func didTapLeftButton(_ sender: Any) {
        // Calcula el índice de la imagen anterior
        let newIndex = max(carouselPageControl.currentPage - 1, 0)
        // Actualiza el page control
        carouselPageControl.currentPage = newIndex
        // Actualiza la imagen en el carrusel de imágenes
        let url = newsItem.arrFotografias[newIndex].vchUrlImgMediana
        // carouselView.image = newsItem.arrFotografias[newIndex].vchUrlImgMediana
        print("next \(url)")
        carouselView.sd_setImage(with: url, completed: nil)
    }
    
    @IBAction func didTapRightButton(_ sender: Any) {
        // Calcula el índice de la siguiente imagen
        let newIndex = min(carouselPageControl.currentPage + 1, newsItem.arrFotografias.count - 1)
        // Actualiza el page control
        carouselPageControl.currentPage = newIndex
        // Actualiza la imagen en el carrusel de imágenes
        let url = newsItem.arrFotografias[newIndex].vchUrlImgMediana
        print("next \(url)")
        carouselView.sd_setImage(with: url, completed: nil)
        // carouselView.image = newsItem.arrFotografias[newIndex].vchUrlImgMediana
    }
    
    
}
