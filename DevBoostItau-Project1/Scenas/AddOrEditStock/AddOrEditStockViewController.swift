//
//  AddOrEditStockViewController.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class AddOrEditStockViewController: UIViewController, HasCodeView {
    
    typealias CustomView = AddOrEditStockView
    
    // MARK: - Lifecycle
    override func loadView() {
        let customView = CustomView()
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
            setupDataInViews()
        }
        setupViews()
       // addKeyboarController(for: [startDateTextField, stockTextField, quantityTextField, priceTextField])
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
//        startDateTextField.inputView = datePicker
    }
    private func setupDataInViews() {
//        startDateTextField.text = viewModel.stock?.startDate
//        stockTextField.text = viewModel.stock?.name
//        quantityTextField.text = viewModel.stock?.quantity
//        priceTextField.text = viewModel.stock?.price
//        investButton.setTitle("Salvar", for: .normal)
    }
    private func setupViews() {
//        priceTextField.keyboardType = .decimalPad
//        quantityTextField.keyboardType = .decimalPad
//        stockTextField.keyboardType = .default
//        stockTextField.autocapitalizationType = .words
//        if viewModel.stock != nil {
//            investButton.setTitle("Salvar", for: .normal)
//        } else {
//            investButton.setTitle("Investir", for: .normal)
//        }
//        investButton.applyGradient(style: .horizontal, colors: [UIColor.itiOrange, UIColor.itiPink])
//        investButton.clipsToBounds = true
//        investButton.layer.cornerRadius = 25
    }
    // MARK: - Taps
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
       // startDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    @IBAction func didTapInvestButton(_ sender: Any) {
        verifyError()
    }
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Functions
    private func verifyError() {
//        stockLabel.textColor = stockTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
//        startDateLabel.textColor = startDateTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
//        priceLabel.textColor = priceTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
//        quantityLabel.textColor = quantityTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
//        if  !(stockTextField.text?.isEmpty ?? false) && !(quantityTextField.text?.isEmpty ?? false) && !(priceTextField.text?.isEmpty ?? false) && !(startDateTextField.text?.isEmpty ?? false) {
//            callSaveInfo()
//        }
    }
    private func callSaveInfo() {
        viewModel.saveInfo()
    }
}
