//
//  LastedNewsViewController.swift
//  News
//
//  Created by joe on 8/03/23.
//

import UIKit

class LastedNewsViewController: UIViewController {

    struct Category {
        let name:String
        let title:String
        let image:String
        let time:String
    }
    
    let dataCategory: [Category] = [
        Category(
            name: "Deporte",
            title:"Techo Propio: lanzan primera convocatoria para bono habitacional de S/ 29,700",
            image: "defaultBigImageNotice",
            time: "Hace 5 minutos"
        ),
        Category(
            name: "Economía",
            title:"Pasco: inician campaña de prevención frente a la temporada de lluvias e…",
            image: "defaultBigImageNotice",
            time: "Hace 5 minutos"
        ),
        Category(
            name: "Regionales",
            title:"Campaña Licenciatón: MTC entregará brevetes electrónicos en 5 regiones",
            image: "defaultBigImageNotice",
            time: "Hace 5 minutos"
        ),
        Category(
            name: "Locales",
            title:"Campaña Licenciatón: MTC entregará brevetes electrónicos en 5 regiones",
            image: "defaultBigImageNotice",
            time: "Hace 5 minutos"
        ),
        Category(
            name: "Politica",
            title:"Contienda política",
            image: "defaultBigImageNotice",
            time: "Hace 5 minutos"
        )
    ]
    
    
    // var data = ["Item 1", "Item 2", "Item 3"]
    
    
    
    @IBOutlet weak var tableViewLasted: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = nil
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        tableViewLasted.dataSource = self
        tableViewLasted.delegate = self

        // Registrar una celda personalizada para la vista de tabla
        // tableViewCategories.register(UITableViewCell.self, forCellReuseIdentifier: "cellCategories")
        
        tableViewLasted.register(UINib(nibName: "LastedTableViewCell", bundle: nil), forCellReuseIdentifier: "cellLasted")
        
        tableViewLasted.register(UINib(nibName: "LastedMainTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMainLasted")
         
    }
}

enum CellTypeLasted {
    case typeOne
    case typeTwo
}

extension LastedNewsViewController: UITableViewDataSource {

    // Devuelve el número de secciones en la vista de tabla (opcional, por defecto es 1)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // Devuelve el número de filas en la sección especificada
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCategory.count + 1
    }

    // Devuelve la celda para la fila especificada
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cellType: CellTypeLasted = indexPath.row == 0 ? .typeOne : .typeTwo
        if cellType == .typeOne {
            let dataCell = dataCategory[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellMainLasted", for: indexPath) as? LastedMainTableViewCell
            return cell!
        }else{
         
            let dataCell = dataCategory[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellLasted", for: indexPath) as? LastedTableViewCell
            
            cell?.customTitle?.text = dataCell.title
            cell?.customImage?.image = UIImage(named: dataCell.image)
            cell?.customCategory?.text = dataCell.name
            cell?.customTime?.text = dataCell.time
            
            return cell!
        }
        
    }
    
}


extension LastedNewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            //return 135
            return 215
    }
}
