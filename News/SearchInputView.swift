//
//  SearchInputView.swift
//  News
//
//  Created by Francisco Rios on 9/03/23.
//

import UIKit

class SearchInputView: UIView {
    
    @IBOutlet weak var groupSearchView: UIView!
    
    @IBOutlet weak var searchIcon: UIImageView!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var microphoneButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        // groupSearchView.layer.cornerRadius = 30
        // groupSearchView.layer.masksToBounds = true
    }
}
