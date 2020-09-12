//
//  AssetsDetailViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class AssetsDetailBuilder {
    func builder(asset: Investment) -> AssetsDetailViewController {
        let viewController = UIStoryboard(name: "AssetsDetailViewController", bundle: nil)
            .instantiateViewController(withIdentifier: "AssetsDetailViewController") as! AssetsDetailViewController
        viewController.asset = asset
        return viewController
    }
}

final class AssetsDetailViewController: BaseViewController {
    
    // MARK: Properties
    var viewModel: AssetsDetailViewModel!
    var asset: Investment!
    var detail: AssetDetail?
    
    // MARK: Outlets
    @IBOutlet weak var labelAssetName: UILabel!
    @IBOutlet weak var labelQuantity: UILabel!
    @IBOutlet weak var labelPricePurchase: UILabel!
    @IBOutlet weak var labelDatePurchase: UILabel!
    @IBOutlet weak var labelTotalValue: UILabel!
    @IBOutlet weak var labelDateToday: UILabel!
    @IBOutlet weak var labelTotalValueToday: UILabel!
    @IBOutlet weak var labelRentabilityPercent: UILabel!
    @IBOutlet weak var imgIconClose: UIImageView!
    @IBOutlet weak var viewButtonEdit: UIView!
    
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AssetsDetailViewModel(asset: asset)
        
        setupView()
        bindEvents()
        showLoading()
        viewModel.getAssetDetail()
    }
    
    
    // MARK: Actions
    @IBAction func handlerCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlerButtonEdit(_ sender: Any) {
    }
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.onSuccess = { [weak self] in
            DispatchQueue.main.async {
                self?.setupView()
                self?.closeLoading()
            }
        }
        
        viewModel.onFail = { [weak self] error in
            print("==> Error: \(error)")
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                self?.closeLoading()
            }
        }
    }
    
    private func setupView() {
        imgIconClose.tintImage(color: .gray)
        viewButtonEdit.layer.cornerRadius = 25
        viewButtonEdit.applyGradient(style: .vertical, colors: [UIColor.itiOrange, UIColor.itiPink])
        
        labelAssetName.text = detail?.getName
        labelQuantity.text = viewModel.asset?.quantityOfStocks.description
        labelPricePurchase.text = viewModel.getPricePurchase()
        labelDatePurchase.text = viewModel.getDatePurchase()
        labelTotalValue.text = viewModel.getTotalValuePurchase()
        labelDateToday.text = viewModel.dateFormatter.string(from: Date())
        labelTotalValueToday.text = viewModel.getTotalValueToday()
        labelRentabilityPercent.text = viewModel.getRentability()
        
        var color = UIColor(red: 109/255, green: 173/255, blue: 51/255, alpha: 1)
        if viewModel.getRentabilityValue() < 0 {
            color = .red
        }
        
        labelRentabilityPercent.textColor = color
        labelDateToday.textColor = color
        labelTotalValueToday.textColor = color
    }
}
