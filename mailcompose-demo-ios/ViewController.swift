//
//  ViewController.swift
//  wkwebview-demo-ios
//
//  Created by Stefan Nebel on 16.10.20.
//

import MessageUI
import Foundation
import UIKit


/*

 2DO:

 1. Run on Real Device
  - Console prints: init(nibName:bundle:)

 2. Swipe down to Dismiss
 - Console prints:
   - deinit
  AND

 [AXRuntimeCommon] AX Lookup problem - errorCode:1100 error:Permission denied portName:'com.apple.iphone.axserver' PID:876 (
   0   AXRuntime                           0x00000001c8e37858 8D122FE0-3568-332B-ADCA-A5E8874AF5E2 + 358488
   1   AXRuntime                           0x00000001c8de4264 _AXGetPortFromCache + 560
   2   AXRuntime                           0x00000001c8de58ec AXUIElementPerformFencedActionWithValue + 464
   3   UIKit                               0x00000001f2dccf78 58F3AD40-790D-34BB-BC64-5CDF63BF070A + 872312
   4   libdispatch.dylib                   0x0000000104da7b68 _dispatch_call_block_and_release + 32
   5   libdispatch.dylib                   0x0000000104da95f0 _dispatch_client_callout + 20
   6   libdispatch.dylib                   0x0000000104db0fa8 _dispatch_lane_serial_drain + 736
   7   libdispatch.dylib                   0x0000000104db1cb4 _dispatch_lane_invoke + 448
   8   libdispatch.dylib                   0x0000000104dbde38 _dispatch_workloop_worker_thread + 1520
   9   libsystem_pthread.dylib             0x00000001f2ae7908 _pthread_wqthread + 276
   10  libsystem_pthread.dylib             0x00000001f2aee77c start_wqthread + 8
 )

 [AXRuntimeCommon] AX Lookup problem - errorCode:1100 error:Permission denied portName:'com.apple.iphone.axserver' PID:876 (
   0   AXRuntime                           0x00000001c8e37858 8D122FE0-3568-332B-ADCA-A5E8874AF5E2 + 358488
   1   AXRuntime                           0x00000001c8de4264 _AXGetPortFromCache + 560
   2   AXRuntime                           0x00000001c8de58ec AXUIElementPerformFencedActionWithValue + 464
   3   UIKit                               0x00000001f2dccf78 58F3AD40-790D-34BB-BC64-5CDF63BF070A + 872312
   4   libdispatch.dylib                   0x0000000104da7b68 _dispatch_call_block_and_release + 32
   5   libdispatch.dylib                   0x0000000104da95f0 _dispatch_client_callout + 20
   6   libdispatch.dylib                   0x0000000104db0fa8 _dispatch_lane_serial_drain + 736
   7   libdispatch.dylib                   0x0000000104db1cb4 _dispatch_lane_invoke + 448
   8   libdispatch.dylib                   0x0000000104dbde38 _dispatch_workloop_worker_thread + 1520
   9   libsystem_pthread.dylib             0x00000001f2ae7908 _pthread_wqthread + 276
   10  libsystem_pthread.dylib             0x00000001f2aee77c start_wqthread + 8
 )

 [AXRuntimeCommon] AX Lookup problem - errorCode:1100 error:Permission denied portName:'com.apple.iphone.axserver' PID:876 (
   0   AXRuntime                           0x00000001c8e37858 8D122FE0-3568-332B-ADCA-A5E8874AF5E2 + 358488
   1   AXRuntime                           0x00000001c8de4264 _AXGetPortFromCache + 560
   2   AXRuntime                           0x00000001c8de58ec AXUIElementPerformFencedActionWithValue + 464
   3   UIKit                               0x00000001f2dccf78 58F3AD40-790D-34BB-BC64-5CDF63BF070A + 872312
   4   libdispatch.dylib                   0x0000000104da7b68 _dispatch_call_block_and_release + 32
   5   libdispatch.dylib                   0x0000000104da95f0 _dispatch_client_callout + 20
   6   libdispatch.dylib                   0x0000000104db0fa8 _dispatch_lane_serial_drain + 736
   7   libdispatch.dylib                   0x0000000104db1cb4 _dispatch_lane_invoke + 448
   8   libdispatch.dylib                   0x0000000104dbde38 _dispatch_workloop_worker_thread + 1520
   9   libsystem_pthread.dylib             0x00000001f2ae7908 _pthread_wqthread + 276
   10  libsystem_pthread.dylib             0x00000001f2aee77c start_wqthread + 8
 )


 */


// MARK: - MyMailViewController

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

  init() {
    super.init(nibName: nil, bundle: nil)

    view.backgroundColor = .link
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)

    guard MFMailComposeViewController.canSendMail() else {
      assert(false, "Please open on real device")
    }

    let mail = MyMailViewController(nibName: nil, bundle: nil)
    mail.mailComposeDelegate = self
    self.present(mail, animated: true, completion: nil)
  }

  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
}


// MARK: - MyMailViewController

class MyMailViewController: MFMailComposeViewController {

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    print(Self.self, #function)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print(Self.self, #function)
  }
}
