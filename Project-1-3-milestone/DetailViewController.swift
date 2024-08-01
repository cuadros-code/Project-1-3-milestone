//
//  DetailViewController.swift
//  Project-1-3-milestone
//
//  Created by Kevin Cuadros on 31/07/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    var currentImage: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let image = currentImage {
            imageView.image = UIImage(named: image)
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action, 
            target: self,
            action: #selector(sharedTap)
        )
        
    }
    
    @objc func sharedTap() {
        let image = UIImage(named: currentImage)
        let shareAction = UIActivityViewController(
            activityItems: [image!, currentImage!],
            applicationActivities: nil
        )
        present(shareAction, animated: true)
    }

}
