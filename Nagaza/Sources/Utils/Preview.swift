//
//  Preview.swift
//  Nagaza
//
//  Created by SeungMin on 2023/10/19.
//

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    }
    
    func toPreView() -> some View {
        Preview(viewController: self)
    }
}

extension UIView {
    
    private struct Preview: UIViewRepresentable {
        let view: UIView
//        init(_ builder: @escaping () -> UIView) {
//            view = builder()
//        }
        
        func makeUIView(context: Context) -> UIView {
            return view
        }
        func updateUIView(_ view: UIView, context: Context) {
            view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
    }
    
    func toPreView() -> some View {
        Preview(view: self)
    }
}
#endif
