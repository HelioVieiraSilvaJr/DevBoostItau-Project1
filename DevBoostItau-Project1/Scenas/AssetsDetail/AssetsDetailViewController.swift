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
    var cordinator: AssetDetailCordinator?
    var detail: AssetDetail?
    
    var customView: AssetDetailView {
        let myView = view as! AssetDetailView
        myView.delegate = self
        return myView
    }
    
    
    // MARK: Overrides
    override func loadView() {
        view = AssetDetailView()
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindEvents()
        showLoading()
        viewModel.getAssetDetail()
    }
    
    // MARK: Actions
    @IBAction func handlerCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handlerButtonEdit(_ sender: Any) {
//        present(AddOrEditStockViewController(investment: asset), animated: true, completion: nil)
    }
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.onSuccess = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                guard let assetDetail = self.viewModel.detail,
                    let asset = self.viewModel.asset else {return}
                self.customView.initialize(assetDetail: assetDetail, asset: asset)
                self.closeLoading()
            }
        }

        viewModel.onFail = { [weak self] error in
            print("==> Error: \(error)")
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                self?.closeLoading()
            }
        }
    }
}

extension AssetsDetailViewController: AssetDetailViewDelegate {
    func pressEditButton() {
        
    }
    
    func pressCloseButton() {
        navigationController?.popViewController(animated: true)
    }
}
