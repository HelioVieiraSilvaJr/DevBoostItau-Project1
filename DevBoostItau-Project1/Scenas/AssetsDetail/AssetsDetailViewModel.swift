//
//  AssetsDetailViewModel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 05/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import Foundation

class AssetsDetailViewModel {
    
    let repository: AssetDetailRepository!
    var asset: AssetModel?
    var detail: AssetDetail?
    
    init(asset: AssetModel?, _ repository: AssetDetailRepository = AssetDetailRepository()) {
        self.asset = asset
        self.repository = repository
    }
    
    var onSuccess: (() -> Void)?
    var onFail: ((String) -> Void)?
    
    func getAssetDetail() {
        guard let code = asset?.brokerCode else {return}
        repository.getAsset(code: code, onSuccess: { [weak self] assetDetail in
            self?.detail = assetDetail
            self?.onSuccess?()
        }) { [weak self] error in
            self?.onFail?(error)
        }
    }
}
