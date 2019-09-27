
import UIKit

class CrearTareaViewController: UIViewController {

    @IBOutlet weak var nombrecurso: UITextField!
    @IBOutlet weak var nteoria: UITextField!
    @IBOutlet weak var nLab: UITextField!
    @IBOutlet weak var nexamen: UITextField!
    @IBOutlet weak var fNota: UILabel!
    @IBOutlet weak var Estado: UILabel!
    @IBAction func ObtenerNota(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Tarea(context: context)
        
        let nt = Double(nteoria.text!)!
        let nl = Double(nLab.text!)!
        let nex = Double(nexamen.text!)!
        //let fNota = Double(fNota.text!)!
        
        let suma = nt + nl + nex
        let promedio = suma / 3
        print(nt)
        print(nl)
        print(nex)
        print(promedio)
        
        //var Status : Character
        
        if (promedio>=13 && promedio<=20){
            Estado.text = "Aprobado"
        } else if (promedio>=0 && promedio<13) {
            Estado.text = "Desaprobado"
        }
        fNota.text = String(promedio)
        
        curso.nomcurso = nombrecurso.text!
        curso.notateoria = String(nt)
        curso.est = Estado.text!
        curso.prom = String(promedio)
        curso.finalexamen = String(nex)
        curso.notalaboratorio = String(nl)
         /**
        
 */

        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
//    var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var teoria: UITextField!
    
    @IBAction func agregar(_ sender: Any) {
        
        
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
