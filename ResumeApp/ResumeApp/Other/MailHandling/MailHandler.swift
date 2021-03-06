//
//  MailHandler.swift
//  ResumeApp
//
//  Created by Łukasz Bazior on 26/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import MessageUI

class MailHandler: NSObject {
    
    var viewController: UIViewController?
    
}

extension MailHandler: MailHandling {
    
    func openMail(toRecipent recipent: String) throws {
        guard MFMailComposeViewController.canSendMail() else {
            throw MailHandlingError.unableToSend
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients([recipent])

        viewController?.present(mail, animated: true)
    }
    
}

extension MailHandler: MFMailComposeViewControllerDelegate {

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }

}
