import Foundation
import FirebaseFirestore
import MapKit
class FirebaseRepo {

    private static let db = Firestore.firestore() // gets the Firebase instance
    private static let path = "locations"
    
    static func startListener(vc: ViewController){
        print("listener started")
        // when there is a result, call
        //vc.updateMarkers()
        db.collection(path).addSnapshotListener { (snap, error) in
            if error != nil {  // check if there is an error. If so, then return
                return
            }
            if let snap2 = snap {
                vc.updateMarkers(snap: snap2) // call viewController, passing the list as a param.
            }
        }
    }
    
}
