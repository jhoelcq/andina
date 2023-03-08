//
//  CategoriesViewController.swift
//  News
//
//  Created by joe on 7/03/23.
//

import UIKit

class CategoriesViewController: UIViewController {

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
    
    @IBOutlet weak var tableViewCategories: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = nil
        self.navigationController?.isNavigationBarHidden = true
        navigationItem.setHidesBackButton(true, animated: false)
        
        tableViewCategories.dataSource = self
        tableViewCategories.delegate = self

        // Registrar una celda personalizada para la vista de tabla
        // tableViewCategories.register(UITableViewCell.self, forCellReuseIdentifier: "cellCategories")
        
        tableViewCategories.register(UINib(nibName: "CategoryTableViewCell", bundle: nil), forCellReuseIdentifier: "cellCategories")
        
        tableViewCategories.register(UINib(nibName: "CategoryMainTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMainCategories")
         
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func goButtonAction(_ sender: Any) {
        print("CATEGORIAS")
    }
}

enum CellType {
    case typeOne
    case typeTwo
}

extension CategoriesViewController: UITableViewDataSource {

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
        
        
        let cellType: CellType = indexPath.row == 0 ? .typeOne : .typeTwo
        if cellType == .typeOne {
            let dataCell = dataCategory[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellMainCategories", for: indexPath) as? CategoryMainTableViewCell
            return cell!
        }else{
         
            let dataCell = dataCategory[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategories", for: indexPath) as? CategoryTableViewCell
            
            cell?.customTitle?.text = dataCell.title
            cell?.customImage?.image = UIImage(named: dataCell.image)
            cell?.customCategory?.text = dataCell.name
            cell?.customTime?.text = dataCell.time
            
            return cell!
        }
        
    }
    
}


extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            //return 135
            return 160
    }
}
