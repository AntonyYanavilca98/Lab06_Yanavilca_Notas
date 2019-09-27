
import UIKit

class TareaCompletadaViewController: UIViewController {
    
    var tarea : Tarea? = nil
//    var anteriorVC = ViewController()
    
    
    
    @IBOutlet weak var nexam: UILabel!
    @IBOutlet weak var nlabot: UILabel!
    @IBOutlet weak var nteor: UILabel!
    @IBOutlet weak var nocurso: UILabel!
    @IBOutlet weak var promedio: UILabel!
    @IBOutlet weak var estadito: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        nocurso.text = tarea!.nomcurso
        nteor.text = tarea!.notateoria
        nlabot.text = tarea!.notalaboratorio
        nexam.text = tarea!.finalexamen
        promedio.text = tarea!.prom
        /**n
        
        
        
 */
        estadito.text = tarea!.est
        
        /** if tarea!.importante {
            tareaLabel.text = "🙉\(tarea!.nombre!)"
        } else {
            tareaLabel.text = tarea!.nombre!
        }
        */

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func completarTarea(_ sender: Any) {
//        anteriorVC.tareas.remove(at: anteriorVC.indexSeleccionado)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(tarea!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
