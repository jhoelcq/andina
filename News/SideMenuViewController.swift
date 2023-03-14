//
//  SideMenuViewController.swift
//  News
//
//  Created by joe on 10/03/23.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    
        @IBOutlet var sideMenuTableView: UITableView!
        
        var defaultHighlightedCell: Int = 0

        var menu: [SideMenuModel] = [
            SideMenuModel(
                type: "icon",
                icon: UIImage(named: "iconUserWhite")!,
                title: "Iniciar sesión",
                height: 40
            ),
            SideMenuModel(
                type: "bold",
                icon: UIImage(systemName: "person.fill")!,
                title: "PORTADA",
                height: 42
            ),
            SideMenuModel(
                type: "bold",
                icon: UIImage(systemName: "person.fill")!,
                title: "ÚLTIMAS NOTICIAS",
                height: 42
            ),
            SideMenuModel(
                type: "space",
                icon: UIImage(systemName: "person.fill")!,
                title: "",
                height: 11
            ),
            SideMenuModel(
                type: "section",
                icon: UIImage(systemName: "person.fill")!,
                title: "Secciones/Actualidad",
                height: 40
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Política",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Economía",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Regionales",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Locales",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Internacional",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Cultural",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Deporte",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Clic",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Ciencia y Tecnología",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Cambio Climático",
                height: 34
            ),
            SideMenuModel(
                type: "space",
                icon: UIImage(systemName: "person.fill")!,
                title: "",
                height: 11
            ),
            SideMenuModel(
                type: "icon",
                icon: UIImage(named: "iconSettings")!,
                title: "Configuración",
                height: 32
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Canal Online",
                height: 34
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Videos",
                height: 34
            ),
            SideMenuModel(
                type: "space",
                icon: UIImage(systemName: "person.fill")!,
                title: "",
                height: 11
            ),
            SideMenuModel(
                type: "image",
                icon: UIImage(named: "LogoEditoraColores")!,
                title: "-",
                height: 54
            ),
            
            
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Buscador",
                height: 40
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "Galería",
                height: 40
            ),
            SideMenuModel(
                type: "simple",
                icon: UIImage(systemName: "person.fill")!,
                title: "SuggestNavID",
                height: 34
            ),
            
        ]

        var delegate: SideMenuViewControllerDelegate?
    
        override func viewDidLoad() {
            super.viewDidLoad()

            // TableView
            self.sideMenuTableView.delegate = self
            self.sideMenuTableView.dataSource = self
            self.sideMenuTableView.backgroundColor = .white
            self.sideMenuTableView.separatorStyle = .none

            // Set Highlighted Cell
            DispatchQueue.main.async {
                let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
                self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
            }
 
            // Register TableView Cell
            
            // CELL ICON
            self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)
            // CELL BOLD
            self.sideMenuTableView.register(SideMenuBoldCell.nib, forCellReuseIdentifier: SideMenuBoldCell.identifier)
            // CELL SPACE
            self.sideMenuTableView.register(SideMenuSpaceCell.nib, forCellReuseIdentifier: SideMenuSpaceCell.identifier)
            // CELL IMAGE
            self.sideMenuTableView.register(SideMenuImageCell.nib, forCellReuseIdentifier: SideMenuImageCell.identifier)
            // CELL SECTION
            self.sideMenuTableView.register(SideMenuSectionCell.nib, forCellReuseIdentifier: SideMenuSectionCell.identifier)
            // CELL SIMPLE
            self.sideMenuTableView.register(SideMenuSimpleCell.nib, forCellReuseIdentifier: SideMenuSimpleCell.identifier)
            
            // self.sideMenuTableView.register(UINib(nibName: "CategoryMainTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMainCategories")

            // Update TableView with the data
            self.sideMenuTableView.reloadData()
        }
    }

    // MARK: - UITableViewDelegate


    extension SideMenuViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            
            let dataCell = menu[indexPath.row]
            return CGFloat(dataCell.height)
            // return 40
        }
    }

    // MARK: - UITableViewDataSource

    extension SideMenuViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.menu.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
            let dataCell = menu[indexPath.row]
            
            if( dataCell.type == "bold" ){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuBoldCell.identifier, for: indexPath) as? SideMenuBoldCell else { fatalError("xib doesn't exist") }

                // cell.iconImageView.image = self.menu[indexPath.row].icon
                cell.titleLabel.text = self.menu[indexPath.row].title
                // cell.titleLabel.textColor = .black

                // Highlighted color
                let myCustomSelectionColorView = UIView()
                myCustomSelectionColorView.backgroundColor = .white
                cell.selectedBackgroundView = myCustomSelectionColorView
                return cell
            }
            else if( dataCell.type == "space" ){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuSpaceCell.identifier, for: indexPath) as? SideMenuSpaceCell else { fatalError("xib doesn't exist") }

                // cell.iconImageView.image = self.menu[indexPath.row].icon
                // cell.titleLabel.text = self.menu[indexPath.row].title
                // cell.titleLabel.textColor = .black

                // Highlighted color
                let myCustomSelectionColorView = UIView()
                myCustomSelectionColorView.backgroundColor = .blue
                cell.selectedBackgroundView = myCustomSelectionColorView
                
                var frame = cell.frame
                frame.size.height = 11
                cell.frame = frame
                
                return cell
            }
            else if( dataCell.type == "image" ){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuImageCell.identifier, for: indexPath) as? SideMenuImageCell else { fatalError("xib doesn't exist") }

                cell.customImage.image = self.menu[indexPath.row].icon
                // cell.titleLabel.text = self.menu[indexPath.row].title
                // cell.titleLabel.textColor = .black

                // Highlighted color
                let myCustomSelectionColorView = UIView()
                myCustomSelectionColorView.backgroundColor = .white
                cell.selectedBackgroundView = myCustomSelectionColorView
                return cell
            }
            else if( dataCell.type == "section" ){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuSectionCell.identifier, for: indexPath) as? SideMenuSectionCell else { fatalError("xib doesn't exist") }

                // cell.iconImageView.image = self.menu[indexPath.row].icon
                cell.titleLabel.text = self.menu[indexPath.row].title
                
                
                let attributedString = NSMutableAttributedString(string: self.menu[indexPath.row].title)
                attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: cell.titleLabel.font.pointSize), range: NSRange(location: 0, length: attributedString.length))

                // Establece el atributo de texto en negrita en el UILabel
                cell.titleLabel.attributedText = attributedString
                
                
                
                
                // Highlighted color
                let myCustomSelectionColorView = UIView()
                myCustomSelectionColorView.backgroundColor = .white
                cell.selectedBackgroundView = myCustomSelectionColorView
                return cell
            }
            else if( dataCell.type == "simple" ){
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuSimpleCell.identifier, for: indexPath) as? SideMenuSimpleCell else { fatalError("xib doesn't exist") }

                // cell.iconImageView.image = self.menu[indexPath.row].icon
                cell.titleLabel.text = self.menu[indexPath.row].title
                cell.titleLabel.textColor = .black

                // Highlighted color
                let myCustomSelectionColorView = UIView()
                myCustomSelectionColorView.backgroundColor = .white
                cell.selectedBackgroundView = myCustomSelectionColorView
                return cell
            }
            
            // TYPE ICON
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }

            cell.iconImageView.image = self.menu[indexPath.row].icon
            cell.titleLabel.text = self.menu[indexPath.row].title

            // Highlighted color
            let myCustomSelectionColorView = UIView()
            myCustomSelectionColorView.backgroundColor = .white
            cell.selectedBackgroundView = myCustomSelectionColorView
            return cell
            
            
            
            
            /*
             let dataCell = dataCategory[indexPath.row - 1]
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCategories", for: indexPath) as? CategoryTableViewCell
            
            cell?.customTitle?.text = dataCell.title
            cell?.customImage?.image = UIImage(named: dataCell.image)
            cell?.customCategory?.text = dataCell.name
            cell?.customTime?.text = dataCell.time
             */
        }

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            // ...
            
            self.delegate?.selectedCell(indexPath.row)
            
        }
    }


