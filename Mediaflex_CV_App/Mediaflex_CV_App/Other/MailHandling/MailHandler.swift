//
//  MailHandler.swift
//  Mediaflex_CV_App
//
//  Created by Damian Tabański on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import MessageUI

class MailHandler: NSObject {
    
    private let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

extension MailHandler: MailHandling {
    
    func openMail(toRecipent recipent: String) throws {
        guard MFMailComposeViewController.canSendMail() else {
            throw MailHandlingError.unableToSend
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([recipent])

        viewController.present(mail, animated: true)
    }
    
}

extension MailHandler: MFMailComposeViewControllerDelegate {

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

}
