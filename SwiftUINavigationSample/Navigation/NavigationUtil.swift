//
//  NavigationUtil.swift
//  SwiftUINavigationSample
//
//  Created by Akira Ohnishi on 2022/02/15.
//

// original: https://stackoverflow.com/a/67495147

import UIKit

struct NavigationUtil {
    static func popToRootView() {
        let nav = findNavigationController(viewController: findRootViewController())
        nav?.popToRootViewController(animated: true)
    }

    static func findCurrentWindow() -> UIWindow? {
        let scenes = UIApplication.shared.connectedScenes

        return scenes.filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap { $0 as? UIWindowScene }?
            .windows
            .first(where: \.isKeyWindow)
    }

    static func findRootViewController() -> UIViewController? {
        findCurrentWindow()?.rootViewController
    }

    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }

        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }

        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }

        return nil
    }
}
