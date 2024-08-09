//
//  ViewController.swift
//  JYHPageControlSample
//
//  Created by YH.Jang on 09/01/2019.
//  Copyright © 2019 Younghee Jang. All rights reserved.
//

import UIKit
import JYHPageControl

class ViewController: UIViewController {
  
  var scrollView: UIScrollView?
  var pageControl: JYHPageControl?
  
  let sampleImage01 = UIImageView(image: UIImage(named: "sample01"))
  let sampleImage02 = UIImageView(image: UIImage(named: "sample02"))
  let sampleImage03 = UIImageView(image: UIImage(named: "sample03"))
  let sampleImage04 = UIImageView(image: UIImage(named: "sample04"))
  let sampleImage05 = UIImageView(image: UIImage(named: "sample05"))
  let sampleImage06 = UIImageView(image: UIImage(named: "sample06"))
  let sampleImage07 = UIImageView(image: UIImage(named: "sample07"))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView = UIScrollView()
    scrollView?.isPagingEnabled = true
    scrollView?.isScrollEnabled = true
    scrollView?.showsVerticalScrollIndicator = false
    scrollView?.showsHorizontalScrollIndicator = false
    scrollView?.translatesAutoresizingMaskIntoConstraints = false
    scrollView?.delegate = self
    
    pageControl = JYHPageControl(currentDotSize: CGSize(width: 12, height: 6),
                                 currentDotBackgroundColor: UIColor.white,
                                 currentDotBorderColor: UIColor.lightGray,
                                 currentDotAlpha: 1.0,
                                 defaultDotSize: CGSize(width: 6, height: 6),
                                 defaultDotBackgroundColor: UIColor.white,
                                 defaultDotBorderColor: UIColor.lightGray,
                                 defaultDotAlpha: 0.7,
                                 gap: 6,
                                 isRadius: true,
                                 numberOfPages: 7,
                                 currentPage: 0)
    
    pageControl?.useHeaderImageView(size: CGSize(width: 15, height: 15), image: UIImage(named: "sampleHeader")!)
    pageControl?.useFooterImageView(size: CGSize(width: 15, height: 15), image: UIImage(named: "sampleFooter")!)
    pageControl?.translatesAutoresizingMaskIntoConstraints = false
    
    sampleImage01.contentMode = .scaleAspectFill
    sampleImage01.clipsToBounds = true
    sampleImage02.contentMode = .scaleAspectFill
    sampleImage02.clipsToBounds = true
    sampleImage03.contentMode = .scaleAspectFill
    sampleImage03.clipsToBounds = true
    sampleImage04.contentMode = .scaleAspectFill
    sampleImage04.clipsToBounds = true
    sampleImage05.contentMode = .scaleAspectFill
    sampleImage05.clipsToBounds = true
    sampleImage06.contentMode = .scaleAspectFill
    sampleImage06.clipsToBounds = true
    sampleImage07.contentMode = .scaleAspectFill
    sampleImage07.clipsToBounds = true
    
    sampleImage01.translatesAutoresizingMaskIntoConstraints = false
    sampleImage02.translatesAutoresizingMaskIntoConstraints = false
    sampleImage03.translatesAutoresizingMaskIntoConstraints = false
    sampleImage04.translatesAutoresizingMaskIntoConstraints = false
    sampleImage05.translatesAutoresizingMaskIntoConstraints = false
    sampleImage06.translatesAutoresizingMaskIntoConstraints = false
    sampleImage07.translatesAutoresizingMaskIntoConstraints = false
  
    self.view.addSubview(scrollView!)
    self.view.addSubview(pageControl!)
    self.scrollView?.addSubview(sampleImage01)
    self.scrollView?.addSubview(sampleImage02)
    self.scrollView?.addSubview(sampleImage03)
    self.scrollView?.addSubview(sampleImage04)
    self.scrollView?.addSubview(sampleImage05)
    self.scrollView?.addSubview(sampleImage06)
    self.scrollView?.addSubview(sampleImage07)
    
    let margins = self.view.safeAreaLayoutGuide
    let scrollViewContentMargins = self.scrollView?.contentLayoutGuide
    let scrollViewMargins = self.scrollView?.safeAreaLayoutGuide
    
    scrollView?.centerYAnchor.constraint(equalTo: margins.centerYAnchor).isActive = true
    scrollView?.centerXAnchor.constraint(equalTo: margins.centerXAnchor).isActive = true
    scrollView?.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    scrollView?.leftAnchor.constraint(equalTo: margins.leftAnchor).isActive = true
    scrollView?.rightAnchor.constraint(equalTo: margins.rightAnchor).isActive = true
    scrollView?.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    
    pageControl?.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    pageControl?.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    pageControl?.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -30).isActive = true
    pageControl?.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    sampleImage01.centerYAnchor.constraint(equalTo: (scrollViewContentMargins?.centerYAnchor)!).isActive = true
    sampleImage01.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage01.leftAnchor.constraint(equalTo: (scrollViewContentMargins?.leftAnchor)!).isActive = true
    sampleImage01.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage01.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage02.leftAnchor.constraint(equalTo: sampleImage01.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage02.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage02.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage02.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage03.leftAnchor.constraint(equalTo: sampleImage02.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage03.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage03.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage03.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage04.leftAnchor.constraint(equalTo: sampleImage03.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage04.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage04.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage04.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage05.leftAnchor.constraint(equalTo: sampleImage04.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage05.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage05.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage05.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage06.leftAnchor.constraint(equalTo: sampleImage05.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage06.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage06.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage06.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true

    sampleImage07.leftAnchor.constraint(equalTo: sampleImage06.safeAreaLayoutGuide.rightAnchor).isActive = true
    sampleImage07.topAnchor.constraint(equalTo: (scrollViewMargins?.topAnchor)!).isActive = true
    sampleImage07.bottomAnchor.constraint(equalTo: (scrollViewMargins?.bottomAnchor)!).isActive = true
    sampleImage07.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
    sampleImage07.rightAnchor.constraint(equalTo: (scrollViewContentMargins?.rightAnchor)!).isActive = true
  }
  
}

extension ViewController: UIScrollViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
    pageControl!.currentPage = Int(pageNumber)
  }
  
}
