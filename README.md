
a ready to use uitabbar transition:
check file:CustomTabBarAnimator
usage:
Step1:
1.subclass TabBarViewController 
2.  override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

3. extension TabBarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        let customTabBarAnimator = CustomTabBarAnimator()
        customTabBarAnimator.tabBarController = self
        
        return customTabBarAnimator
    }
}

![demo](https://github.com/futomtom/TabBarVCTransition/blob/master/tabbar_animation.gif)