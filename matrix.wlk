// PERSONAJES //


object neo{

    var energia = 100
    

    method esElegido(){
        return true
    }

    method saltar(){
        energia = energia / 2
    }

    method vitalidad(){
        return energia / 10
    }

}


object morfeo{

    var vitalidad = 8

    var estaCansado = false

    method cambiarEstadoCansancio(){
        if (estaCansado){
            estaCansado = false
        }
        else estaCansado = true
    }

    method saltar() {
        vitalidad -= 1
        self.cambiarEstadoCansancio()
    }


    method esElegido(){
        return false
    }
}

object trinity{
    method vitalidad(){
        return 0
    }
    method saltar(){}
    method esElegido(){
        return false
    }
}


object nave{

    var pasajeros = []

    method agregarPasajero(pasajeroNuevo) {
        pasajeros.add(pasajeroNuevo)
    }
    
    method sacarPasajero(pasajeroASacar) {
        pasajeros.remove(pasajeroASacar)
    }

    // * Cuántos pasajeros hay //
    method cantidadPasajeros(){
        return pasajeros.size()
    }

    // * El pasajero de mayor vitalidad * //

    method pasajeroMayorVitalidad(){
        return pasajeros.max({ p => p.vitalidad() })
    }

    // * Está equilibrada en vitalidad: ningún pasajero tiene más del doble que otro * //
    method estaEquilibradaVitalidad(){
        const maxV = pasajeros.max({ p => p.vitalidad() }).vitalidad()
        const minV = pasajeros.min({ p => p.vitalidad() }).vitalidad()
        return maxV <= minV * 2
    }

    // * Si el elegido está en la nave //

    method estaElElegido(){
        return pasajeros.any({pasajeros => pasajeros.esElegido() })
    }
    

    method chocar(){
        pasajeros.forEach({pasajeros => pasajeros.saltar()})
        pasajeros.clear()
    }

    method acelerar(){
        const sinElegidos = pasajeros.filter({pasajeros => not pasajeros.esElegido()})
        sinElegidos.forEach({pasajeros => pasajeros.saltar()})
    }






}