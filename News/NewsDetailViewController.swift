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
        txtContenido: "<div>Asimismo, detalló que el año pasado se negociaron más de un millón 147,000 facturas, que permitió el financiamiento a 17,843 empresas en todo el país, de las cuales 15,019  (84% del total) fueron micro y pequeñas empresas (mypes)</div><div><br /></div><div>Los sectores económicos que más destacaron en este periodo son: Servicios, con un monto negociado de 8,784 millones de soles, beneficiando a 7,665 empresas (88.3% mypes); Comercio, favoreció a 4,479 empresas (78.5% mypes) negociando un monto de 9,306 millones de soles.</div><div><br /></div><div>Asimismo, Manufactura con 8,114 millones de soles en negociaciones, a favor de 3,537 empresas (80.3% mypes); mientras que, en otros sectores, se beneficiaron a 2,162 empresas (87.6% mypes), negociando 4,254 millones de soles.  </div><div> </div><div>En el 2022, participaron más de 100 operadores de factoring; de ellos: 11 son Operadores de Factoring supervisados por la Superintendencia de Banca, Seguros y AFP (SBS), principalmente bancos, que negociaron 881,602 facturas por 22,309 millones de soles.</div><div><br /></div><div>Además, se registran 90 operadores de Factoring no supervisados, los cuales ofrecen un servicio diferenciado al brindar financiamiento, incluso a las mype de baja clasificación o sin historial crediticio. </div><div><br /></div><div>Estos últimos, negociaron 265,451 facturas por 8,149 millones de soles, un 27% del mercado aproximadamente.   </div><div> </div><div>La negociación en Factoring en el 2022 registra un crecimiento importante del 36.4% en comparación con el año 2021. Asimismo, el monto negociado del 2022 representa el 3.3% con respecto al PBI del 2022.</div><div><strong><br /></strong></div><div><strong><br /></strong></div><h2><strong>Proyección</strong></h2><div><br /></div><div>En esa línea, se estima que el monto negociado de Factoring durante el 2023 superará los 32,000 millones de soles, permitiendo el financiamiento de más de 18,500 empresas, de las cuales el 84% serían micro y pequeña empresa.  </div><div> </div><div>Es importante mencionar que la décimo primera disposiciones complementarias finales de la Ley Nº 31538 permite al Banco de la Nación prestar servicios de Factoring a los proveedores mype del Estado.  </div><div> </div><div>Estos resultados del mercado de factoring y la medida normativa contribuyen significativamente al acceso a financiamiento de las mypes para su reactivación económica. </div><div> </div><div>Por su parte, el Registro Central de Valores y Liquidaciones Cavali, destacó que, durante el segundo semestre del 2022, se observó un incremento consecutivo en el registro de facturas a través de la plataforma digital Factrack, superando los 100,000 comprobantes mensuales. </div><div> </div><div>Asimismo, detalló que, solo en el mes de diciembre del 2022, se alcanzó un nuevo récord con más de 130,000 facturas anotadas, lo que demuestra que el factoring representa una muy buena opción para financiar las campañas comerciales de fin de año, justamente cuando las mype más lo necesitan.  </div><div><br /></div><div><strong>Más en Andina:</strong></div><div><br /></div><blockquote class=\"twitter-tweet\"><p lang=\"es\" dir=\"ltr\">Desembolsarán S/ 15 millones en créditos para negocios liderados por mujeres emprendedoras. <a href=\"https://t.co/hB87vEE75s\">https://t.co/hB87vEE75s</a> <a href=\"https://t.co/UsbLlh51D2\">pic.twitter.com/UsbLlh51D2</a></p>— Agencia Andina (@Agencia_Andina) <a href=\"https://twitter.com/Agencia_Andina/status/1622704294679007232?ref_src=twsrc%5Etfw\">February 6, 2023</a></blockquote><div><br /></div><div>(FIN) NDP / MDV </div>",
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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var carouselView: UIImageView!
    @IBOutlet weak var carouselLeftButton: UIButton!
    @IBOutlet weak var carouselRightButton: UIButton!
    @IBOutlet weak var carouselPageControl: UIPageControl!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionImgLabel: UILabel!
    @IBOutlet weak var groupContainer: UIStackView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var groupRightButtons: UIStackView!
    @IBOutlet weak var sizeFontButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var readingButton: UIButton!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleRelatedNewsView: UIView!
    @IBOutlet weak var containerRelatedNewsView: UIView!
    @IBOutlet weak var relatedNewsTableView: UITableView!
    
    // MARK: - Lifecycle∫
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Obtén las dimensiones de la pantalla
        let screenSize = UIScreen.main.bounds.size

        // Ajusta el tamaño y la posición del scrollView
        scrollView.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height)
        scrollView.backgroundColor = .lightGray
        
        // Set title label's text
        titleLabel.text = newsItem.vchTitulo
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        
        titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32).isActive = true
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: titleLabel.frame.height + 32)
        
        
        // carouselView
        carouselView.frame = CGRect(x: 0, y: titleLabel.frame.maxY + 16, width: scrollView.frame.width, height: 200)
        
        carouselView.contentMode = .scaleAspectFill
        carouselView.clipsToBounds = true
        
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            carouselView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            carouselView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            carouselView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            carouselView.heightAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5)
        ])
        
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
        

        carouselLeftButton.setTitle("", for: .normal)
        carouselLeftButton.translatesAutoresizingMaskIntoConstraints = false
        carouselLeftButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)

        carouselRightButton.setTitle("", for: .normal)
        carouselRightButton.translatesAutoresizingMaskIntoConstraints = false
        carouselRightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)

        // Configura las restricciones de los botones
        carouselLeftButton.centerYAnchor.constraint(equalTo: carouselView.centerYAnchor).isActive = true
        carouselLeftButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16).isActive = true

        carouselRightButton.centerYAnchor.constraint(equalTo: carouselView.centerYAnchor).isActive = true
        carouselRightButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16).isActive = true
        
        
        // Hora
        timeLabel.text = newsItem.vchHora
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont.systemFont(ofSize: 10)
        timeLabel.textColor = .red
        timeLabel.numberOfLines = 0
        timeLabel.sizeToFit()
        timeLabel.frame.origin = CGPoint(x: 16, y: carouselView.frame.maxY + 16)
        
        // fecha
        dateLabel.text = "-"
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
        groupContainer.frame.size.width = scrollView.frame.width - 32
        groupContainer.translatesAutoresizingMaskIntoConstraints = false
        groupContainer.axis = .horizontal
        groupContainer.distribution = .equalSpacing
        groupContainer.spacing = 16
        
        NSLayoutConstraint.activate([
            groupContainer.topAnchor.constraint(equalTo: captionImgLabel.bottomAnchor, constant: 16),
            groupContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            groupContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
        ])
        
        shareButton.setTitle("Compartir", for: .normal)
        shareButton.setTitleColor(.black, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        sizeFontButton.setTitle("", for: .normal)
        sizeFontButton.setTitleColor(.black, for: .normal)
        sizeFontButton.backgroundColor = .gray
        
        saveButton.setTitle("", for: .normal)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.backgroundColor = .gray

        readingButton.setTitle("", for: .normal)
        readingButton.setTitleColor(.black, for: .normal)
        readingButton.backgroundColor = .gray
        
        groupRightButtons.axis = .horizontal
        groupRightButtons.distribution = .equalSpacing
        groupRightButtons.spacing = 4
        
        // content
        bodyTextView.translatesAutoresizingMaskIntoConstraints = false
        bodyTextView.backgroundColor = .clear
        bodyTextView.isEditable = false
        bodyTextView.isScrollEnabled = false
        bodyTextView.textContainerInset = .zero
        
        if let htmlData = newsItem.txtContenido.data(using: .unicode) {
            do {
                let attributedString = try NSMutableAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
                let bodyFont = UIFont.systemFont(ofSize: 16)
                let titleFont = UIFont.boldSystemFont(ofSize: 24)
                
                attributedString.addAttribute(.font, value: bodyFont, range: NSRange(location: 0, length: attributedString.length))
                
                let regex = try NSRegularExpression(pattern: "<h\\d>.*?(<.*?>)?(.*?)</h\\d>", options: [])
                let matches = regex.matches(in: attributedString.string, options: [], range: NSRange(location: 0, length: attributedString.length))
                
                // print("matches > \(matches)")
                
                for match in matches {
                    let range = match.range
                    attributedString.addAttribute(.font, value: titleFont, range: range)
                }
                
                // print("parseHTML > \(attributedString)")
                
                bodyTextView.attributedText = attributedString
            } catch {
                print("Error al crear la cadena de atributos: \(error.localizedDescription)")
            }
        }
        
        NSLayoutConstraint.activate([
            bodyTextView.topAnchor.constraint(equalTo: groupContainer.bottomAnchor, constant: 16),
            bodyTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            bodyTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            // bodyTextView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
        
        titleRelatedNewsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleRelatedNewsView.topAnchor.constraint(equalTo: bodyTextView.bottomAnchor, constant: 16),
            titleRelatedNewsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titleRelatedNewsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            titleRelatedNewsView.heightAnchor.constraint(equalToConstant: 20),
            // titleRelatedNewsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
        
        containerRelatedNewsView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerRelatedNewsView.topAnchor.constraint(equalTo: titleRelatedNewsView.bottomAnchor, constant: 16),
            containerRelatedNewsView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            containerRelatedNewsView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            containerRelatedNewsView.heightAnchor.constraint(equalToConstant: 100),
            containerRelatedNewsView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
        ])
        
        relatedNewsTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            relatedNewsTableView.topAnchor.constraint(equalTo: containerRelatedNewsView.topAnchor, constant: 0),
            relatedNewsTableView.leadingAnchor.constraint(equalTo: containerRelatedNewsView.leadingAnchor, constant: 0),
            relatedNewsTableView.trailingAnchor.constraint(equalTo: containerRelatedNewsView.trailingAnchor, constant: 0),
            relatedNewsTableView.bottomAnchor.constraint(equalTo: containerRelatedNewsView.bottomAnchor, constant: 0),
        ])
        
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
    
    @IBAction func didTabShareButton(_ sender: Any) {
        print("share")
    }
    
    
    @IBAction func didTabSizeFontButton(_ sender: Any) {
        print("size font")
    }
    
    
    @IBAction func didTabSaveButton(_ sender: Any) {
        print("save")
    }
    
    
    @IBAction func didTabReadingButton(_ sender: Any) {
        print("reading")
    }
    
}
