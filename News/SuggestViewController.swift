//
//  SuggestViewController.swift
//  News
//
//  Created by joe on 14/03/23.
//

import UIKit

class SuggestViewController: UIViewController {

    
    @IBOutlet weak var tableSuggest: UITableView!
    
    struct Suggest {
        let name:String
        let status:Bool
    }
    let dataSuggest: [Suggest] = [
        Suggest(
            name: "Política",
            status: false
        ),
        Suggest(
            name: "Economía",
            status: false
        ),
        Suggest(
            name: "Regionales",
            status: false
        ),
        Suggest(
            name: "Locales",
            status: false
        ),
        Suggest(
            name: "Internacionales",
            status: false
        ),
        Suggest(
            name: "Cultural",
            status: false
        ),
        Suggest(
            name: "Deporte",
            status: false
        ),
        Suggest(
            name: "Clic",
            status: false
        ),
        Suggest(
            name: "Ciencia y Tecnología",
            status: false
        ),
        Suggest(
            name: "Cambio Climático",
            status: false
        )
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableSuggest.dataSource = self
        tableSuggest.delegate = self
        
        tableSuggest.register(UINib(nibName: "SuggestTableViewCell", bundle: nil), forCellReuseIdentifier: "cellSuggests")
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

extension SuggestViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSuggest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let dataCell = dataSuggest[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSuggests", for: indexPath) as? SuggestTableViewCell
        
        cell!.buttonOption.setTitle(dataCell.name, for: .normal)
        
        return cell!
    }
    
}

extension SuggestViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
    }
}
