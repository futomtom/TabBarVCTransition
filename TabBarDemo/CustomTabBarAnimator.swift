import UIKit
/* 用法:
 
 extension TabBarViewController: UITabBarControllerDelegate {
 
 func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
 
 let customTabBarAnimator = CustomTabBarAnimator()
 customTabBarAnimator.tabBarController = self
 
 return customTabBarAnimator
 }
 }
 */

class CustomTabBarAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var tabBarController: UITabBarController!
    var anim: UIViewImplicitlyAnimating!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let anim = self.interruptibleAnimator(using: transitionContext)
        anim.startAnimation()
    }
    
    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        
        if self.anim != nil {
            return self.anim
        }
        
        let vc1 = transitionContext.viewController(forKey: .from)!
        let vc2 = transitionContext.viewController(forKey: .to)!
        let con = transitionContext.containerView
        let r1start = transitionContext.initialFrame(for: vc1)
        let r2end = transitionContext.finalFrame(for: vc2)
        let v1 = transitionContext.view(forKey: .from)!
        let v2 = transitionContext.view(forKey: .to)!
        let ix1 = tabBarController.viewControllers!.index(of: vc1)!
        let ix2 = tabBarController.viewControllers!.index(of: vc2)!
        let dir: CGFloat = ix1 < ix2 ? 1 : -1
        var r1end = r1start
        r1end.origin.x -= r1end.size.width * dir
        var r2start = r2end
        r2start.origin.x += r2start.size.width * dir
        
        v2.frame = r2start
        con.addSubview(v2)
        let anim = UIViewPropertyAnimator(duration: 0.4, curve: .linear) {
            v1.frame = r1end
            v2.frame = r2end
        }
        
        anim.addCompletion { (_) in
            transitionContext.completeTransition(true)
        }
        
        self.anim = anim
        return anim
    }
}





