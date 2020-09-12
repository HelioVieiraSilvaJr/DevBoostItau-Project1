//
//  UIViewController+Extensions.swift
//  DevBoostItau-Project1
//
//  Created by bruna on 9/5/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

extension UIViewController{
    func addKeyboardController(for textFields: [UITextField]){
        for (index, textField) in textFields.enumerated() {
            let toolbar: UIToolbar = UIToolbar()
            toolbar.sizeToFit()

            var items = [UIBarButtonItem]()
            let previousButton = UIBarButtonItem(title: Localization.previous, style: .plain, target: nil, action: nil)
              previousButton.width = 30
              if textField == textFields.first {
                previousButton.isEnabled = false
              } else {
                previousButton.target = textFields[index - 1]
                previousButton.action = #selector(UITextField.becomeFirstResponder)
              }

            let nextButton = UIBarButtonItem(title: Localization.next, style: .plain, target: nil, action: nil)
              nextButton.width = 30
              if textField == textFields.last {
                nextButton.isEnabled = false
              } else {
                nextButton.target = textFields[index + 1]
                nextButton.action = #selector(UITextField.becomeFirstResponder)
              }
              items.append(contentsOf: [previousButton, nextButton])

            let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: view, action: #selector(UIView.endEditing))
            items.append(contentsOf: [spacer, doneButton])


            toolbar.setItems(items, animated: false)
            textField.inputAccessoryView = toolbar
          }
    }
}
