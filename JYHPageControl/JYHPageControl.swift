//
//  JYHPageControl.swift
//  JYHPageControl
//
//  Created by YoungheeJang on 09/01/2019.
//  Copyright © 2019 YH.Jang. All rights reserved.
//

import UIKit

open class JYHPageControl: UIView {
    fileprivate var currentDotSize: CGSize!
    fileprivate var currentDotBackgroundColor: UIColor!
    fileprivate var currentDotBorderColor: UIColor!
    fileprivate var currentDotAlpha: CGFloat!
    
    fileprivate var defaultDotSize: CGSize!
    fileprivate var defaultDotBackgroundColor: UIColor!
    fileprivate var defaultDotBorderColor: UIColor!
    fileprivate var defaultDotAlpha: CGFloat!
    
    fileprivate var gab: CGFloat!
    fileprivate var radius: Bool!
    fileprivate var animation: Bool!
    
    fileprivate var headerImageView: UIImageView?
    fileprivate var footerImageView: UIImageView?
    
    open var numberOfPages: Int! {
        didSet {
            self.updateNumberOfPages()
            self.updateView()
        }
    }
    
    open var currentPage: Int! {
        didSet {
            if dotArray.count > 0 {
                UIView.animate(withDuration: self.animation ? 0.3 : 0.0) {
                    self.updateView()
                }
            }
        }
    }
    fileprivate var dotArray: [PageControlDot] = []
    
    public convenience init(currentDotSize: CGSize = CGSize(width: 6, height: 6),
                            currentDotBackgroundColor: UIColor = UIColor.white,
                            currentDotBorderColor: UIColor = UIColor.lightGray,
                            currentDotAlpha: CGFloat = 1.0,
                            
                            defaultDotSize: CGSize = CGSize(width: 6, height: 6),
                            defaultDotBackgroundColor: UIColor = UIColor.white,
                            defaultDotBorderColor: UIColor = UIColor.lightGray,
                            defaultDotAlpha: CGFloat = 0.7,
                            
                            gab: CGFloat = 6,
                            radius: Bool = true,
                            animation: Bool = true,
                            
                            numberOfPages: Int = 3,
                            currentPage: Int = 0) {
        self.backgroundColor = .clear
        self.init(frame: .zero)
        self.currentDotSize = currentDotSize
        self.currentDotBackgroundColor = currentDotBackgroundColor
        self.currentDotBorderColor = currentDotBorderColor
        self.currentDotAlpha = currentDotAlpha
        
        self.defaultDotSize = defaultDotSize
        self.defaultDotBackgroundColor = defaultDotBackgroundColor
        self.defaultDotBorderColor = defaultDotBorderColor
        self.defaultDotAlpha = defaultDotAlpha
        
        self.gab = gab
        self.radius = radius
        self.animation = animation
        
        self.numberOfPages = numberOfPages
        self.currentPage = currentPage
        
        self.updateNumberOfPages()
    }
    
    public func useHeaderImageView(size: CGSize, image: UIImage) {
        if self.headerImageView == nil {
            self.headerImageView = UIImageView()
        }
        self.headerImageView?.image = image
        self.headerImageView?.contentMode = .scaleAspectFit
        self.headerImageView?.clipsToBounds = true
        self.headerImageView?.frame = CGRect(origin: .zero, size: size)
        self.addSubview(self.headerImageView!)
    }
    
    public func removeHeaderImageView() {
        if self.headerImageView != nil {
            self.headerImageView?.removeFromSuperview()
            self.headerImageView = nil
        }
    }
    
    public func useFooterImageView(size: CGSize, image: UIImage) {
        if self.footerImageView == nil {
            self.footerImageView = UIImageView()
        }
        self.footerImageView?.image = image
        self.footerImageView?.contentMode = .scaleAspectFit
        self.footerImageView?.clipsToBounds = true
        self.footerImageView?.frame = CGRect(origin: .zero, size: size)
        self.addSubview(self.footerImageView!)
    }
    
    public func removeFooterImageView() {
        if self.footerImageView != nil {
            self.footerImageView?.removeFromSuperview()
            self.footerImageView = nil
        }
    }
    
    override open func draw(_ rect: CGRect) {
        self.updateView()
    }
    
    private func updateView() {
        self.updateDots()
        self.updateHeaderImageView()
        self.updateFooterImageView()
    }
    
    private func updateDots() {
        guard let currentDotSize = self.currentDotSize else { return }
        guard let defaultDotSize = self.defaultDotSize else { return }
        
        let subviewsWidth = currentDotSize.width + defaultDotSize.width * CGFloat((numberOfPages - 1)) + gab * CGFloat((numberOfPages - 1))
        var x = (self.frame.size.width - subviewsWidth) / 2
        
        for (i, view) in dotArray.enumerated() {
            let width =             i == currentPage ? currentDotSize.width : defaultDotSize.width
            let height =            i == currentPage ? currentDotSize.height : defaultDotSize.width
            let alpha: CGFloat =    i == currentPage ? currentDotAlpha : defaultDotAlpha
            let backgroundColor =   i == currentPage ? currentDotBackgroundColor : defaultDotBackgroundColor
            let borderColor =       i == currentPage ? currentDotBorderColor.cgColor : defaultDotBorderColor.cgColor
            let y = (self.frame.size.height - height) / 2
            
            view.frame = CGRect(x: x, y: y, width: width, height: height)
            view.alpha = alpha
            view.backgroundColor = backgroundColor
            view.layer.borderColor = borderColor
            view.layer.borderWidth = 1
            if radius { view.layer.cornerRadius = height / 2 }
            
            x = x + gab + width
        }
    }
    
    private func updateHeaderImageView() {
        guard let imageView = self.headerImageView else { return }
        guard let frontView = dotArray.first else { return }
        
        let x = frontView.frame.origin.x - gab - imageView.frame.size.width
        let y = (self.frame.height - imageView.frame.height) / 2
        
        imageView.frame = CGRect(x: x, y: y, width: imageView.frame.size.width, height: imageView.frame.size.height)
    }
    
    private func updateFooterImageView() {
        guard let imageView = self.footerImageView else { return }
        guard let frontView = dotArray.last else { return }
        
        let x = frontView.frame.origin.x + frontView.frame.size.width + gab
        let y = (self.frame.height - imageView.frame.height) / 2
        
        imageView.frame = CGRect(x: x, y: y, width: imageView.frame.size.width, height: imageView.frame.size.height)
    }
    
    private func updateNumberOfPages() {
        for view in dotArray {
            view.removeFromSuperview()
        }
        dotArray.removeAll()
        
        for _ in 0..<self.numberOfPages {
            let view = PageControlDot()
            self.addSubview(view)
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
