//
//  ViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/16.
//

import UIKit

class DogListViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var DogResponce: DogResponce?
    let dog = Dog()
    
    var breeds : [String] = []
    var selectedDogName: String?
    
    @IBOutlet weak var DogList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DogList.delegate = self
        DogList.dataSource = self
        
        Task {
            await displayDogs()
        }
    }
    
    func displayDogs() async {
        let result = await dog.setDogList()
        switch result {
        case .success(let dogBreeds):
            self.DogResponce = dogBreeds
            self.breeds = DogResponce?.message.keys.sorted() ?? []
            self.DogList.reloadData()
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = breeds[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        selectedDogName = breeds[indexPath.row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCollection" {
            if let destinationVC = segue.destination as? DogImageCollectionViewController {
                destinationVC.selectedDogName = selectedDogName
            }
        }
    }
    
}
