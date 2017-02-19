

import UIKit
import Firebase
import JSQMessagesViewController

final class ChatViewController: JSQMessagesViewController {
    var channelRef: FIRDatabaseReference?
    var channel: Channel? {
        didSet {
            title = channel?.name
        }
    }
  
  // MARK: Properties
  
  // MARK: View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.senderId = FIRAuth.auth()?.currentUser?.uid
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
    
    
  
  // MARK: Collection view data source (and related) methods
  
  
  // MARK: Firebase related methods
  
  
  // MARK: UI and User Interaction

  
  // MARK: UITextViewDelegate methods
  
}
