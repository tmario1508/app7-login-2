
import Foundation

//MARK: declaración global
var lista : [EntidadUsuario] = []

class EntidadUsuario {
    init(usuario:String, pass: String) {
        self.usuario =  usuario
        self.pass =  pass
    }
    
    var usuario : String = ""
    var pass : String = ""
}
