//
//  TouchButton.swift
//  DelegateSample
//
//  Created by Hung Chang Lo on 06/04/2017.
//  Copyright © 2017 Go-Trust. All rights reserved.
//

import Foundation
import UIKit

protocol TouchButtonProtocol {
    // Event: pass object when button is taped
    func didTapButton(touchButton: TouchButton)
    
    // Receive string and override inside TouchButton class
    func txtOnTouchButton() -> String
}

class TouchButton: UIView {
    var delegate: TouchButtonProtocol?
    var dataSource: TouchButtonProtocol?
    
    // required inherit from UIView
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // init TouchButton with CGRect
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // new a tapGesture event
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TouchButton.tapGestureEvent))
        self.addGestureRecognizer(tapGesture)
    }
    
    func tapGestureEvent() {
        self.delegate?.didTapButton(touchButton: self)
    }
    
    func setTxtOnTouchButton() {
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 100))
        label.textColor = UIColor.white
        label.font = label.font.withSize(20)
        self.addSubview(label)

        label.text = dataSource?.txtOnTouchButton()
    }
}
