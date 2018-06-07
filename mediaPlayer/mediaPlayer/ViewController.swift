//
//  ViewController.swift
//  mediaPlayer
//
//  Created by Anup Gupta on 25/05/18.
//  Copyright © 2018 GeekGuns. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var imageSlider: UIScrollView!
    @IBOutlet var pageController: UIPageControl!
    @IBOutlet var skipButton: UIButton!
    var temp : CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        addImageOnSLider() 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func skipButtonAction(_ sender: Any) {
        
        
        print("Skip Button Action")
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    
        let vc = storyBoard.instantiateViewController(withIdentifier: "PlayVideoVCID")
        
        self.navigationController?.pushViewController(vc, animated: true)
        
//
//        
//        let aObjNavi = UINavigationController(rootViewController: vc)
//        self.navigationController?.pushViewController(aObjNavi, animated: true)
        
        
//        let aObjNavi = UINavigationController(rootViewController: vc)
//        //self.navigationController?.pushViewController(aObjNavi, animated: true)
//        //  navigationController?.pushViewController(vc, animated: true)
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        appDelegate.window?.rootViewController = aObjNavi
        
        
    }
    
    
    func addImageOnSLider()   {
        self.pageController.currentPage = 0;
        
        let imageView1 :UIImageView
        let imageView2 :UIImageView
        let imageView3 :UIImageView
//        let videoView : UIView
//        let videoPlayButton : UIButton
        
//        let img1 : UIImage = UIImage(named: "slide1.png")!
//        let img2 : UIImage = UIImage(named: "slide2.png")!
//        let img3 : UIImage = UIImage(named: "slide3.png")!
        let img1 : UIImage = #imageLiteral(resourceName: "slider1")
        let img2 : UIImage = #imageLiteral(resourceName: "slider2")
        let img3 : UIImage = #imageLiteral(resourceName: "slider3")
        
        imageView1 = UIImageView.init(image: img1)
        imageView2 = UIImageView.init(image: img2)
        imageView3 = UIImageView.init(image: img3)
//        videoView = UIView.init()
//        videoPlayButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        videoView.backgroundColor = UIColor.red
        
        
        self.imageSlider.frame = CGRect(x:0, y:0, width:self.view.frame.size.width, height:self.view.frame.size.height - 20);
        
        let ScreenWidth : CGFloat = self.imageSlider.frame.width
        let ScreeHeight : CGFloat = self.imageSlider.frame.height
        
        
        imageView1.frame = CGRect(x:0, y:0, width:ScreenWidth, height:ScreeHeight);
        imageView2.frame = CGRect(x:ScreenWidth, y:0, width:ScreenWidth, height:ScreeHeight);
        imageView3.frame = CGRect(x:ScreenWidth*2, y:0, width:ScreenWidth, height:ScreeHeight);
//        videoView.frame  = CGRect(x:ScreenWidth*3, y:0, width:ScreenWidth, height:ScreeHeight);
//        videoPlayButton.frame = CGRect (x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
//        videoPlayButton.frame.size.width = 50
//         videoPlayButton.frame.size.height = 50
        
//        videoPlayButton.centerXAnchor.constraint(equalTo: videoView.centerXAnchor)
//        videoPlayButton.centerYAnchor.constraint(equalTo: videoView.centerYAnchor)
        
        self.imageSlider.addSubview(imageView1);
        self.imageSlider.addSubview(imageView2);
        self.imageSlider.addSubview(imageView3);
//        self.imageSlider.addSubview(videoView)
//        videoView.addSubview(videoPlayButton)
        
        self.imageSlider.contentSize = CGSize(width: ScreenWidth*3, height: ScreeHeight)
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        let pageWidth = imageSlider.frame.width
        let currentPage = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
        //        float  pageWidth= scrollView.frame.size.width;
        //        float currentPage=floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1;
        
        self.pageController.currentPage = Int(currentPage);
        
        
        if (temp + currentPage == 4){
            
            skipButton.sendActions(for: .touchUpInside)
            
        }
        if (currentPage == 2){
            temp = 2;
            
        }
    }
}

