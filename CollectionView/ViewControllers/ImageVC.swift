//
//  ImageVC.swift
//  CollectionView
//
//  Created by mac on 9/25/22.
//

import UIKit

class ImageVC: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
       
    }
    
}
