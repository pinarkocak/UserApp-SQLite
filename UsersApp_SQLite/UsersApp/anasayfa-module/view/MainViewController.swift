//
//  MainViewController.swift
//  UsersApp
//
//  Created by Pınar Koçak on 12.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var peopleTableView: UITableView!
    
    var peopleList = [Person]()
    
    var anaSayfaPresenterObj: ViewToPresenterAnaSayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        searchBar.delegate = self
        
        copyDatabase()
        
        AnaSayfaRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anaSayfaPresenterObj?.fetch()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceedDetail" {
            let person = sender as? Person
            let controller = segue.destination as! DetailViewController
            controller.person = person
        }
    }
    
    private func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let destinationPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: destinationPath).appendingPathComponent("rehber.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyPath.path) {
            print("Database is already exists.")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            } catch {}
        }
    }
}

extension MainViewController: PresenterToViewAnaSayfaProtocol {
    func sendDataToView(personList: Array<Person>) {
        self.peopleList = personList
        self.peopleTableView.reloadData()
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anaSayfaPresenterObj?.search(search: searchText)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = peopleList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as! TableViewCell
        cell.personInfoLabel.text = "\(person.person_name!) - \(person.person_number!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = peopleList[indexPath.row]
        performSegue(withIdentifier: "proceedDetail", sender: person)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //delete button when cell slides
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, bool) in
            let person = self.peopleList[indexPath.row]
            let alert = UIAlertController(title: "Delete Transaction", message: "Are you sure to delete \(person.person_name!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
            alert.addAction(cancelAction)
            
            let okAction = UIAlertAction(title: "OK", style: .destructive) { action in
                self.anaSayfaPresenterObj?.delete(person_id: person.person_id!)
            }
            alert.addAction(okAction)
            
            self.present(alert, animated: true)
        }
        
        //ypu can add more than one action
        return UISwipeActionsConfiguration(actions: [deleteAction])
        
    }
    
}
