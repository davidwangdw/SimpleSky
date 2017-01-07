//
//  OnboardingPager.swift
//  onboardingWithUIPageViewController
//
//  Created by Robert Chen on 8/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class MainPageViewController : UIPageViewController {
    
    override func viewDidLoad() {
        // Set the dataSource and delegate in code.  
        // I can't figure out how to do this in the Storyboard!
        dataSource = self
        delegate = self
        // this sets the background color of the built-in paging dots
        view.backgroundColor = UIColor.darkGray
        
        // This is the starting point.  Start with step zero.
        setViewControllers([getCurrentViewController()], direction: .forward, animated: false, completion: nil)
    }
    
    func getCurrentViewController() -> CurrentViewController {
        return storyboard!.instantiateViewController(withIdentifier: "CurrentViewController") as! CurrentViewController
    }
    
    func getDailyViewController() -> DailyViewController {
        return storyboard!.instantiateViewController(withIdentifier: "DailyViewController") as! DailyViewController
    }
    
    func getWeeklyViewController() -> WeeklyViewController {
        return storyboard!.instantiateViewController(withIdentifier: "WeeklyViewController") as! WeeklyViewController
    }
}

// MARK: - UIPageViewControllerDataSource methods

extension MainPageViewController : UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: WeeklyViewController.self) {
            // 2 -> 1
            return getDailyViewController()
        } else if viewController.isKind(of: DailyViewController.self) {
            // 1 -> 0
            return getCurrentViewController()
        } else {
            // 0 -> end of the road
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: CurrentViewController.self) {
            // 0 -> 1
            return getDailyViewController()
        } else if viewController.isKind(of: DailyViewController.self) {
            // 1 -> 2
            return getWeeklyViewController()
        } else {
            // 2 -> end of the road
            return nil
        }
    }
    
    // Enables pagination dots
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    // This only gets called once, when setViewControllers is called
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

// MARK: - UIPageViewControllerDelegate methods

extension MainPageViewController : UIPageViewControllerDelegate {
    
}
