//
//  TitleBodyLabel.swift
//  DevBoostItau-Project1
//
//  Created by Helio Junior on 12/09/20.
//  Copyright © 2020 DevBoost-Itau. All rights reserved.
//

import UIKit

class TitleBodyLabel: UIStackView {
    
    enum Style {
        case simple, colorGreen, colorRed, gigantColorGreen, gigantColorRed
    }
    
    var style: Style = .simple
    var title: String = ""
    var body: String = ""
    
    private var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Titulo"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .itiGrey
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var bodyLabel: UILabel = {
        var label = UILabel()
        label.text = "Conteudo"
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: .zero)
        commonInit()
    }
    
    convenience init(title: String, body: String, style: Style) {
        self.init(frame: .zero)
        self.title = title
        self.body = body
        self.style = style
        commonInit()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func commonInit() {
        var bodyColor: UIColor = .black
        var bodyFont: UIFont = UIFont.systemFont(ofSize: 18)
        
        switch style {
        case .colorGreen:
            bodyColor = UIColor(red: 109/255, green: 173/255, blue: 51/255, alpha: 1)
            bodyFont = UIFont.boldSystemFont(ofSize: 18)
        case .colorRed:
            bodyColor = .red
            bodyFont = UIFont.boldSystemFont(ofSize: 18)
        case .gigantColorGreen:
            bodyColor = UIColor(red: 109/255, green: 173/255, blue: 51/255, alpha: 1)
            bodyFont = UIFont.boldSystemFont(ofSize: 90)
        case .gigantColorRed:
            bodyColor = .red
            bodyFont = UIFont.boldSystemFont(ofSize: 90)
        default:
            break
        }
        
        titleLabel.text = title
        bodyLabel.text = body
        bodyLabel.font = bodyFont
        bodyLabel.textColor = bodyColor
        axis = .vertical
        distribution = .fill
        spacing = 0
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(bodyLabel)
    }
    
    // MARK: Helpers
    func setInfos(body: String, style: Style = .simple) {
        self.body = body
        self.style = style
        commonInit()
    }
}
