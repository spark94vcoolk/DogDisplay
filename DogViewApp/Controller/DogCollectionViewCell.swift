//
//  DogCollectionViewCell.swift
//  DogViewApp
//
//  Created by spark-02 on 2024/02/21.
//

import UIKit
import Alamofire
import AlamofireImage

class DogCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var DogCollectionImage: UIImageView!
    
    func configure(with url: URL) {
        AF.request(url).responseImage { [ weak self] responce in
            switch responce.result {
            case .success(let image):
                self?.DogCollectionImage.image = image
            case .failure(let error):
                print("Error loading image: \(error)")
            }
        }
    }
    
}
