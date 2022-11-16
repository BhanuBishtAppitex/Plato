//
//  DashCornerView.swift
//  Plato
//
//  Created by wOOx Technology on 16/11/22.
//

import UIKit

class DashCornerView: UIView {
    
    static var count: Int = 1
    //static var strokeColor: UIColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
    //
    //  DashView.swift
    //  Demo
    //
    //  Created by wOOx Technology on 16/11/22.
    //
    
    private var shapeLayer: CAShapeLayer = {
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = #colorLiteral(red: 0.2156862745, green: 0.4470588235, blue: 1, alpha: 1)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 4
        shapeLayer.lineCap = .round
        return shapeLayer
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }
}

private extension DashCornerView {
    func configure() {
        layer.addSublayer(shapeLayer)
    }
    
    func updatePath() {
        let rect = bounds.insetBy(dx: shapeLayer.lineWidth / 2, dy: shapeLayer.lineWidth / 2)
        let radius = min(rect.width, rect.height) / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let path = UIBezierPath()
        var relativeDashLength: CGFloat = 1.0
        if DashCornerView.count != 1 {
            relativeDashLength = 0.85
        }       //0.25 // a value between 0 and 1
        let increment: CGFloat = .pi * 2 / CGFloat(DashCornerView.count)
        
        for i in 0 ..< DashCornerView.count {
            let startAngle = increment * CGFloat(i)
            let endAngle = startAngle + relativeDashLength * increment
            path.move(to: CGPoint(x: center.x + radius * cos(startAngle),
                                  y: center.y + radius * sin(startAngle)))
            path.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        }
        shapeLayer.path = path.cgPath
    }
    
    
}
