//
//  ViewController.swift
//  Project-1-3-milestone
//
//  Created by Kevin Cuadros on 31/07/24.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image Shared"
        navigationController?.navigationBar.prefersLargeTitles = true
        loadImages()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: pictures[indexPath.row])
        content.imageProperties.cornerRadius = 5
        content.imageProperties.maximumSize = CGSize(width: 70, height: 30)
        content.text = pictures[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func loadImages() {
        let fm = FileManager.default
        let path = Bundle.main.bundlePath
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix(".jpg"){
                pictures.append(item)
            }
        }
    }


}

