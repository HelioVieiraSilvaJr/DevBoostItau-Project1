//
//  AddOrEditStockViewController.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class AddOrEditStockViewController: UIViewController, HasCodeView {
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
    private let viewModel = AddOrEditStockViewModel()
    
    // MARK: - Init
    convenience init(stock: Stock) {
        self.init()
        self.viewModel.stock = stock
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        if viewModel.stock != nil {
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
        customView.startDateTextField.text = viewModel.stock?.startDate
        customView.stockTextField.text = viewModel.stock?.name
        customView.quantityTextField.text = viewModel.stock?.quantity
        customView.priceTextField.text = viewModel.stock?.price
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
        viewModel.saveInfo()
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
