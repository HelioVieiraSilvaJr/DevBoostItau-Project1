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
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView(delegate: self)
        view = customView
    }
    // MARK: - Properts
    private var datePicker: UIDatePicker?
    var viewModel: AddOrEditStockViewModel?
    
    // MARK: - Init
    //    convenience init(stock: Investment) {
//        self.init(stock: stock)
////        self.viewModel.investment = stock
//    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        if viewModel?.investment != nil {
            setupDateAndViews()
        }
        addKeyboarController(for: [customView.startDateTextField, customView.stockTextField, customView.quantityTextField, customView.priceTextField])
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
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        customView.startDateTextField.inputView = datePicker
    }
    private func setupDateAndViews() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        customView.startDateTextField.text = dateFormatter.string(from: viewModel?.investment?.purchaseDate ?? Date())
        customView.stockTextField.text = viewModel?.investment?.brokerName
        customView.quantityTextField.text = "\(viewModel?.investment?.quantityOfStocks)"
        customView.priceTextField.text = "\(viewModel?.investment?.purchasePrice)"
        customView.setSaveButton()
    }
    // MARK: - Taps
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        // startDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    // MARK: - Functions
    private func callSaveInfo() {
        viewModel?.saveInfo(brokerName: customView.stockTextField.text!, brokerCode: "0", qtyOfStocks: customView.quantityTextField.text!, purchasePrice: customView.priceTextField.text!, purchaseDate: customView.startDateTextField.text!)
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
