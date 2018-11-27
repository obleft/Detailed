//
//  DetailedViewController.swift
//  Detailed
//
//  Created by Benjamin Hakes on 11/27/18.
//  Copyright © 2018 Benjamin Hakes. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var character: Model.Animation?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let character = character else {return}
        titleLabel.text = character.rawValue
        imageView.image = Model.shared.image(for: character)
        
        let cells = Model.shared.cells(for: character)
        imageView.animationImages = cells
        imageView.animationRepeatCount = 0
        imageView.animationDuration = (Double(Model.shared.cells(for: character).count)/15)
        imageView.startAnimating()
    }
}
