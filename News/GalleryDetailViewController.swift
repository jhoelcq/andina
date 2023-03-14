//
//  GalleryDetailViewController.swift
//  News
//
//  Created by Francisco Rios on 13/03/23.
//

import UIKit

class GalleryDetailViewController: UIViewController {
        
    var galleryItem: GalleryItem?
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var sharedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = galleryItem?.vchTitulo
        
        let isoDateFormatter = ISO8601DateFormatter()
        let date = isoDateFormatter.date(from: galleryItem!.dtmFechaCreacion) ?? Date()

        // Formatear la fecha para el label de la hora
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: date)
        timeLabel.text = timeString

        // Formatear la fecha para el label de la fecha
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM, yyyy"
        let dateString = dateFormatter.string(from: date)
        dateLabel.text = "- \(dateString)"
        
        let attributedString = NSAttributedString(
            string: galleryItem?.arrFotografias[0].txtLeyenda ?? "",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(named: "Text-333333") ?? .black,
                NSAttributedString.Key.backgroundColor: UIColor.clear,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0)
            ]
        )
        contentTextView.attributedText = attributedString
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        if let url = URL(string: "https://nativosdigitales.pe/que-hacemos") {
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = sender as? UIView
            present(activityViewController, animated: true, completion: nil)
        }
    }
}
