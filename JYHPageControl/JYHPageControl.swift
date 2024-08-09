//
//  JYHPageControl.swift
//  JYHPageControl
//
//  Created by YoungheeJang on 09/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

open class JYHPageControl: UIView {
    private var currentDotSize: CGSize = CGSize(width: 6, height: 6)
    private var currentDotBackgroundColor: UIColor = .white
    private var currentDotBorderColor: UIColor = .lightGray
    private var currentDotAlpha: CGFloat = 1.0
    
    private var defaultDotSize: CGSize = CGSize(width: 6, height: 6)
    private var defaultDotBackgroundColor: UIColor = .white
    private var defaultDotBorderColor: UIColor = .lightGray
    private var defaultDotAlpha: CGFloat = 0.7
    
    private var gap: CGFloat = 6
    private var isRadius: Bool = true
    private var shouldAnimate: Bool = true
    
    private var headerImageView: UIImageView?
    private var footerImageView: UIImageView?
    
    open var numberOfPages: Int = 3 {
        didSet {
            updateNumberOfPages()
            setNeedsLayout()
        }
    }
    
    open var currentPage: Int = 0 {
        didSet {
            guard !dotArray.isEmpty else { return }
            UIView.animate(withDuration: shouldAnimate ? 0.3 : 0.0) {
                self.setNeedsLayout()
            }
        }
    }
    
    private var dotArray: [PageControlDot] = []
    
    public convenience init(currentDotSize: CGSize = CGSize(width: 6, height: 6),
                            currentDotBackgroundColor: UIColor = .white,
                            currentDotBorderColor: UIColor = .lightGray,
                            currentDotAlpha: CGFloat = 1.0,
                            
                            defaultDotSize: CGSize = CGSize(width: 6, height: 6),
                            defaultDotBackgroundColor: UIColor = .white,
                            defaultDotBorderColor: UIColor = .lightGray,
                            defaultDotAlpha: CGFloat = 0.7,
                            
                            gap: CGFloat = 6,
                            isRadius: Bool = true,
                            shouldAnimate: Bool = true,
                            
                            numberOfPages: Int = 3,
                            currentPage: Int = 0) {
      
        self.init(frame: .zero)
        self.backgroundColor = .clear
        self.currentDotSize = currentDotSize
        self.currentDotBackgroundColor = currentDotBackgroundColor
        self.currentDotBorderColor = currentDotBorderColor
        self.currentDotAlpha = currentDotAlpha
        
        self.defaultDotSize = defaultDotSize
        self.defaultDotBackgroundColor = defaultDotBackgroundColor
        self.defaultDotBorderColor = defaultDotBorderColor
        self.defaultDotAlpha = defaultDotAlpha
        
        self.gap = gap
        self.isRadius = isRadius
        self.shouldAnimate = shouldAnimate
        
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
        
        updateNumberOfPages()
    }
    
    public func useHeaderImageView(size: CGSize, image: UIImage) {
        if headerImageView == nil {
            headerImageView = UIImageView()
        }
        headerImageView?.image = image
        headerImageView?.contentMode = .scaleAspectFit
        headerImageView?.clipsToBounds = true
        headerImageView?.frame = CGRect(origin: .zero, size: size)
        addSubview(headerImageView!)
    }
    
    public func removeHeaderImageView() {
        headerImageView?.removeFromSuperview()
        headerImageView = nil
    }
    
    public func useFooterImageView(size: CGSize, image: UIImage) {
        if footerImageView == nil {
            footerImageView = UIImageView()
        }
        footerImageView?.image = image
        footerImageView?.contentMode = .scaleAspectFit
        footerImageView?.clipsToBounds = true
        footerImageView?.frame = CGRect(origin: .zero, size: size)
        addSubview(footerImageView!)
    }
    
    public func removeFooterImageView() {
        footerImageView?.removeFromSuperview()
        footerImageView = nil
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    private func updateView() {
        updateDots()
        updateHeaderImageView()
        updateFooterImageView()
    }
    
    private func updateDots() {
        let subviewsWidth = currentDotSize.width + defaultDotSize.width * CGFloat(numberOfPages - 1) + gap * CGFloat(numberOfPages - 1)
        var x = (self.frame.size.width - subviewsWidth) / 2
        
        for (i, view) in dotArray.enumerated() {
            let width = i == currentPage ? currentDotSize.width : defaultDotSize.width
            let height = i == currentPage ? currentDotSize.height : defaultDotSize.width
            let alpha: CGFloat = i == currentPage ? currentDotAlpha : defaultDotAlpha
            let backgroundColor = i == currentPage ? currentDotBackgroundColor : defaultDotBackgroundColor
            let borderColor = i == currentPage ? currentDotBorderColor.cgColor : defaultDotBorderColor.cgColor
            let y = (self.frame.size.height - height) / 2
            
            view.frame = CGRect(x: x, y: y, width: width, height: height)
            view.alpha = alpha
            view.backgroundColor = backgroundColor
            view.layer.borderColor = borderColor
            view.layer.borderWidth = 1 / UIScreen.main.scale
            if isRadius { view.layer.cornerRadius = height / 2 }
            
            x = x + gap + width
        }
    }
    
    private func updateHeaderImageView() {
        guard let imageView = headerImageView, let frontView = dotArray.first else { return }
        
        let x = frontView.frame.origin.x - gap - imageView.frame.size.width
        let y = (self.frame.height - imageView.frame.height) / 2
        
        imageView.frame = CGRect(x: x, y: y, width: imageView.frame.size.width, height: imageView.frame.size.height)
    }
    
    private func updateFooterImageView() {
        guard let imageView = footerImageView, let frontView = dotArray.last else { return }
        
        let x = frontView.frame.origin.x + frontView.frame.size.width + gap
        let y = (self.frame.height - imageView.frame.height) / 2
        
        imageView.frame = CGRect(x: x, y: y, width: imageView.frame.size.width, height: imageView.frame.size.height)
    }
    
    private func updateNumberOfPages() {
        dotArray.forEach { $0.removeFromSuperview() }
        dotArray.removeAll()
        
        for _ in 0..<numberOfPages {
            let view = PageControlDot()
            addSubview(view)
            dotArray.append(view)
        }
    }
}

class PageControlDot: UIView {
    
    convenience init() {
        self.init(frame: .zero)
        self.clipsToBounds = true
    }
}
