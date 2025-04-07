//
//  UIViewController.swift
//  Kenlo Vistoria
//
//  Created by Priya Gandhi on 2024-01-19.
//

import UIKit

extension UIViewController {
    
    func currentMonthInfo(currDate : Date,completion : (String, String) -> Void) {
        let today = currDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: today)
        dateFormatter.dateFormat = "MMMM"
        let month = dateFormatter.string(from: today)
        completion(month, year)
    }
    
    
    
    func pushViewController<T: UIViewController>(_ viewControllerType: T.Type, from viewController: UIViewController, data: Any, storyboardName:Storyboard) {
        // Instantiate the view controller
       // let destinationViewController = viewControllerType.init()
        guard let destinationViewController = UIStoryboard(name: storyboardName.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }

        // Check if the destination view controller conforms to a protocol that defines a method to receive data
        if let dataReceiver = destinationViewController as? DataReceiver {
            // Pass the data to the destination view controller
            dataReceiver.receiveData(data)
        }

        // Push the view controller onto the navigation stack
        viewController.navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    
    func presentScreen<T:UIViewController>(viewController:T, storyboardName:Storyboard) {
        guard let nextViewController = UIStoryboard(name: storyboardName.rawValue, bundle: nil).instantiateViewController(withIdentifier: String(describing: T.self)) as? T else { return }
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    

    
    func presentView<T:UIViewController>(viewController:T) {
        let presentView : T = T(nibName :String(describing: T.self),bundle : nil)
        presentView.modalPresentationStyle = .overCurrentContext
        self.present(presentView, animated: true, completion: nil)
    }
    
    func presentViewWithData<T:UIViewController>(viewController:T, txt : String) {
        let presentView : T = T(nibName :String(describing: T.self),bundle : nil)
        presentView.modalPresentationStyle = .overCurrentContext
        self.present(presentView, animated: true, completion: nil)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func pop() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // present alert on UIViewController this function only hide the alert
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title.localized(), message: message.localized(), preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK".localized(), style: .default) { action in
        }
        alertController.addAction(OKAction)
        // Present Alert on Controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert(title: String?, message: String?, actionTitle: String = "Close".localized(), completion: @escaping () -> Void ){
        
        DispatchQueue.main.async {
            guard let controller = UIApplication.topViewController() else{
                return
            }
            print(NSLocalizedString("Properties", comment: ""))
            let alert = UIAlertController.init(title: title?.localized(), message: message?.localized(), preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: actionTitle, style: .cancel) { (action) in
                completion()
            }
            alert.addAction(okAction)
            controller.present(alert, animated: true, completion: nil)
        }
        
    }
    
}

protocol ImagePickerDelegate {
    func imagePicker(_ imagePicker: ImagePicker, grantedAccess: Bool,
                     to sourceType: UIImagePickerController.SourceType)
    func imagePicker(_ imagePicker: ImagePicker, didSelect image: UIImage)
    func cancelButtonDidClick(on imageView: ImagePicker)
}

class ImagePicker: NSObject {

    private weak var controller: UIImagePickerController?
     var delegate: ImagePickerDelegate? = nil

    func dismiss() { controller?.dismiss(animated: true, completion: nil) }
    func present(parent viewController: UIViewController, sourceType: UIImagePickerController.SourceType) {
        let controller = UIImagePickerController()
        controller.delegate = self

        controller.sourceType = sourceType
        self.controller = controller
        DispatchQueue.main.async {
            viewController.present(controller, animated: true, completion: nil)
        }
    }
}

// MARK: Get access to camera or photo library

extension ImagePicker {

    private func showAlert(targetName: String, completion: ((Bool) -> Void)?) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertVC = UIAlertController(title: "Access to the \(targetName)",
                                            message: "Please provide access to your \(targetName)",
                                            preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "Settings", style: .default, handler: { action in
                guard   let settingsUrl = URL(string: UIApplication.openSettingsURLString),
                        UIApplication.shared.canOpenURL(settingsUrl) else { completion?(false); return }
                UIApplication.shared.open(settingsUrl, options: [:]) { [weak self] _ in
                    self?.showAlert(targetName: targetName, completion: completion)
                }
            }))
            alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in completion?(false) }))
            UIApplication.shared.windows.filter { $0.isKeyWindow }.first?
                .rootViewController?.present(alertVC, animated: true, completion: nil)
        }
    }

}

// MARK: UINavigationControllerDelegate

extension ImagePicker: UINavigationControllerDelegate { }

// MARK: UIImagePickerControllerDelegate

extension ImagePicker: UIImagePickerControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Check if the picked media is an image
        if let originalImage = info[.originalImage] as? UIImage {
            // Resize the original image to a lower resolution
            let lowResolutionSize = CGSize(width: 100, height: 100)
            if let lowResolutionImage = originalImage.resizeImage(targetSize: lowResolutionSize) {
                // Pass the low-resolution image to the delegate
                delegate?.imagePicker(self, didSelect: lowResolutionImage)
            } else {
                // Handle error during resizing (optional)
                print("Error resizing image")
            }
        } else {
            // Handle the case where the picked media is not an image (optional)
            // For example, display an alert to inform the user
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        delegate?.cancelButtonDidClick(on: self)
    }
}
protocol DataReceiver {
    func receiveData(_ data: Any?)
}

extension UIViewController {
    
    func setDeviceOrientation(orientation: UIInterfaceOrientationMask) {
        if #available(iOS 16.0, *) {
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: orientation))
        } else {
            UIDevice.current.setValue(orientation.toUIInterfaceOrientation.rawValue, forKey: "orientation")
        }
    }

}
extension UIInterfaceOrientationMask {
    var toUIInterfaceOrientation: UIInterfaceOrientation {
        switch self {
        case .portrait:
            return UIInterfaceOrientation.portrait
        case .portraitUpsideDown:
            return UIInterfaceOrientation.portraitUpsideDown
        case .landscapeRight:
            return UIInterfaceOrientation.landscapeRight
        case .landscapeLeft:
            return UIInterfaceOrientation.landscapeLeft
        default:
            return UIInterfaceOrientation.unknown
        }
    }
}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { (context) in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
enum Storyboard : String {
    case Main
    case Dashboard

    
    
}
struct StoryboardApp
{
    static let Main = UIStoryboard.init(name: "Main", bundle: Bundle.main)
    static let Dashboard = UIStoryboard.init(name: "Dashboard", bundle: Bundle.main)

}
