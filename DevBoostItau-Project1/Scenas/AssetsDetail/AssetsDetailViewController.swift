//
//  AssetsDetailViewController.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

final class AssetsDetailViewController: BaseViewController {
    
    // MARK: Properties
    var viewModel: AssetsDetailViewModel!
    var coordinator: AssetDetailCoordinator?
    var detail: StockPrice?
    
    var customView: AssetDetailView {
        let myView = view as! AssetDetailView
        myView.delegate = self
        return myView
    }
    
    
    // MARK: Overrides
    override func loadView() {
        view = AssetDetailView()
        customView.delegate = self
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindEvents()
        showLoading()
        viewModel.getStockPrice()
    }
    
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.onSuccess = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                guard let assetDetail = self.viewModel.getAssetDetail() else {return}
                self.customView.updateUI(assetDetail: assetDetail)
                self.closeLoading()
            }
        }

        viewModel.onFail = { [weak self] error in
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                self?.closeLoading()
                self?.customView.showNotFound()
            }
        }
    }
}

extension AssetsDetailViewController: AssetDetailViewDelegate {
    func pressEditButton() {
        guard let investment = viewModel.getAssetDetail()?.investment else {return}
        dismiss(animated: true) {
            self.coordinator?.editInvestment(investment: investment)
        }
    }
    
    func pressCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}
