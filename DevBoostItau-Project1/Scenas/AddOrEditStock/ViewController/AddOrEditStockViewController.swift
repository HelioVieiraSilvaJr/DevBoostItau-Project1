//
//  AddOrEditStockViewController.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AddOrEditStockViewController: UIViewController, HasCodeView {
    // MARK: - Properts
    typealias CustomView = AddOrEditStockView
    weak var coordinator: AddOrEditStockCoordinator?
    var newInvestment: Bool = true
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView(delegate: self)
        view = customView
    }
    // MARK: - Properts
    private var datePicker: UIDatePicker?
    var viewModel: AddOrEditStockViewModel?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        setupTypeInvestment()
        addKeyboardController(for: [customView.startDateTextField, customView.stockTextField, customView.quantityTextField, customView.priceTextField])
    }
    // MARK: - Override
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    // MARK: - Setups
    private func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.locale = Locale.init(identifier: "pt-br")
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        datePicker?.maximumDate = yesterdayDate
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        customView.startDateTextField.inputView = datePicker
    }
    private func setupDelegate() {
        customView.quantityTextField.delegate = self
    }
    private func setupTypeInvestment() {
        if viewModel?.investment != nil {
            setupDateAndViews()
            newInvestment = false
        }
    }
    private func setupDateAndViews() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        customView.startDateTextField.text = dateFormatter.string(from: viewModel?.investment?.purchaseDate ?? Date())
        customView.stockTextField.text = viewModel?.investment?.brokerName
        customView.quantityTextField.text = "\(viewModel!.investment!.quantityOfStocks)"
        customView.priceTextField.text = "\(viewModel!.investment!.purchasePrice)"
        customView.setSaveButton()
    }
    // MARK: - Taps
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        customView.startDateTextField.text! = dateFormatter.string(from: datePicker.date)
    }
    
    // MARK: - Functions
    private func callSaveInfo() {
        
        let resultSave = viewModel!.saveInfo(brokerName: customView.stockTextField.text!,
                                             brokerCode: "0",
                                             qtyOfStocks: customView.quantityTextField.text!,
                                             purchasePrice: customView.priceTextField.text!,
                                             purchaseDate: customView.startDateTextField.text!)
        if resultSave {
            let messageSuccess = newInvestment ? "Seu investimento foi adicionado com sucesso!" : "Seu investimento foi atualizado com sucesso!"
            let alert = UIAlertController(title: "Sucesso!", message: messageSuccess, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
                self.coordinator?.dismissDisplay()
            }))
            self.present(alert, animated: true)
        } else {
            let messageError = newInvestment ? "Falha ao adicionar o investimento! :(" : "Falha ao atualizar o investimento! :("
            let alert = UIAlertController(title: "Erro!", message: messageError, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
// MARK: - AddOrEditStockViewDelegate
extension AddOrEditStockViewController: AddOrEditStockViewDelegate {
    func didTapCloseButton() {
        self.coordinator?.dismissDisplay()
    }
    func didTapInvestOrSaveButton() {
        callSaveInfo()
    }
}

extension AddOrEditStockViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == customView.quantityTextField {
            let invalidCharacters = CharacterSet(charactersIn: "0123456789").inverted
            return string.rangeOfCharacter(from: invalidCharacters) == nil
        }
        return false
    }
}
