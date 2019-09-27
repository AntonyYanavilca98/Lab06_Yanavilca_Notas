

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var tareas:[Tarea] = []
//    var indexSeleccionado:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        tareas = crearTareas()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    } // es obligatorio colocar esta función para el tableView
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let tarea = tareas[indexPath.row]
        if( Double(tarea.prom!) >= 13 ){
            cell.backgroundColor = UIColor.red
        }else{
            cell.backgroundColor = UIColor.blue
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = tareas[indexPath.row]
        cell.textLabel?.text = curso.nomcurso!
        
        /**let prom = curso.prom!
        
        if( prom >= 13 ){
            cell.backgroundColor = UIColor.red
        }else{
            cell.backgroundColor = UIColor.blue
        }
 
*/
        
        
        return cell
    } // es obligatorio colocar esta función para el tableView
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        indexSeleccionado = indexPath.row
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
//    func crearTareas() -> [Tarea]{
//        let tarea1 = Tarea()
//        tarea1.nombre = "Pasear al perro"
//        tarea1.importante = false
//
//        let tarea2 = Tarea()
//        tarea2.nombre = "Comprar verduras"
//        tarea2.importante = true
//
//        let tarea3 = Tarea()
//        tarea3.nombre = "Lavar los servicios"
//        tarea3.importante = false
//
//        return [tarea1, tarea2, tarea3]
//    }

    @IBAction func agregarTarea(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch {
            print("Ha ocurrido un ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "agregarSegue" {
//            let siguienteVC = segue.destination as! CrearTareaViewController
//            siguienteVC.anteriorVC = self
//        }
        
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
//            siguienteVC.anteriorVC = self
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if ( editingStyle == .delete ) {
            tareas.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    /**func tableView(_ tableView: UITableView, willDisplay cell:UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = UITableViewCell()
        let curso = tareas[indexPath.row]
        cell.textLabel?.text = curso.nomcurso!
        
        
        
        return cell
        
    }
 */
    
}

