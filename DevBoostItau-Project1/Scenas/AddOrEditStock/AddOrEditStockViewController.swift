//
//  AddOrEditStockViewController.swift
//  DevBoostItau-Project1
//
//  Created by Caio Cardozo on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class AddOrEditStockViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var stockTextField: UITextField!
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var investButton: UIButton!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    
    // MARK: - Properts
    private var datePicker = UIDatePicker()
    private var viewModel = AddOrEditStockViewModel()
    // MARK: - Init
    convenience init(investment: Investment) {
        self.init()
        viewModel.investment = investment
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.context = context
        setupDatePicker()
        setupDataInViews()
        setupViews()
        addKeyboardController(for: [startDateTextField, stockTextField, quantityTextField, priceTextField])
    }
    // MARK: - Override
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    // MARK: - Setups
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.locale = Locale.init(identifier: "pt-br")
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        startDateTextField.inputView = datePicker
    }
    private func setupDataInViews() {
        if let investment = viewModel.investment {
            startDateTextField.text = investment.purchaseDate?.description
            stockTextField.text = investment.brokerName!.isEmpty ? investment.brokerCode : investment.brokerName
            quantityTextField.text = "\(investment.quantityOfStocks)"
            priceTextField.text = "\(investment.purchasePrice)"
        }
        setupButton()
    }
    private func setupViews() {
        priceTextField.keyboardType = .decimalPad
        quantityTextField.keyboardType = .decimalPad
        stockTextField.keyboardType = .default
        stockTextField.autocapitalizationType = .words
        investButton.applyGradient(style: .horizontal, colors: [UIColor.itiOrange, UIColor.itiPink])
        investButton.clipsToBounds = true
        investButton.layer.cornerRadius = 25
    }
    private func setupButton() {
        if viewModel.investment != nil {
            investButton.setTitle("Salvar", for: .normal)
        } else {
            investButton.setTitle("Investir", for: .normal)
        }
    }
    
    // MARK: - Taps
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        startDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
    @IBAction func didTapInvestButton(_ sender: Any) {
        if (validateFields()) {
            callSaveInfo()
        }
    }
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Functions
    private func validateFields() -> Bool {
        stockLabel.textColor = stockTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        startDateLabel.textColor = startDateTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        priceLabel.textColor = priceTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        quantityLabel.textColor = quantityTextField.text?.isEmpty ?? false ? UIColor.red : UIColor.gray
        if  !(stockTextField.text?.isEmpty ?? true) && !(quantityTextField.text?.isEmpty ?? true) && !(priceTextField.text?.isEmpty ?? true) && !(startDateTextField.text?.isEmpty ?? true) {
            return true
        }
        return false
    }
    
    private func callSaveInfo() {
        let brokerName = ""
        let brokerCode = stockTextField.text ?? ""
        let purchaseDate = startDateTextField.text ?? ""
        let purchasePrice = priceTextField.text ?? "0"
        let purchaseQuantity = quantityTextField.text ?? "0"
        let saveSuccess = viewModel.saveInfo(brokerName: brokerCode, //TODO: não tem field para brokerName então estou setando brokerCode no brokerName mesmo
                                             brokerCode: brokerCode,
                                             qtyOfStocks: purchaseQuantity,
                                             purchasePrice: purchasePrice,
                                             purchaseDate: purchaseDate)
        if (saveSuccess) {
            dismiss(animated: true, completion: nil)
        }
    }
}
