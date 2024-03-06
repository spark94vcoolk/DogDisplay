//
//  ViewController.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/28.
//

import UIKit
import Alamofire
import AlamofireImage

class DogDetailViewController: UIViewController {
    
    var imageURL: URL?
    var isZoomed = false
    
    @IBOutlet weak var detailDogImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doubleTapGesture = UITapGestureRecognizer(target: self, action:#selector(self.doubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        self.detailDogImage.isUserInteractionEnabled = true
        self.detailDogImage.addGestureRecognizer(doubleTapGesture)
        
        if let imageURL = imageURL {
            AF.request(imageURL).responseImage { [weak self] response in
                switch response.result {
                case .success(let image):
                    self?.detailDogImage.image = image
                case .failure(let error):
                    print("Error loading image: \(error)")
                }
            }
        }
        
    }
    @objc func doubleTap(_ recognizer: UITapGestureRecognizer) {
        if isZoomed {
            detailDogImage.transform = CGAffineTransform.identity
        } else {
            detailDogImage.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }
        
        isZoomed = !isZoomed
    }
}
