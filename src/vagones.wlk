class VagonDePasajeros{
	
	const largo
	const ancho
	const tieneBanio
	var estaOrdenado
	
	method cantidadDePasajeros() { 
		const cantidad = if(ancho <= 3) 8 * largo else 10 * largo
		return if(estaOrdenado) cantidad else cantidad - 15
	}
	method cargaMaxima() { return if(tieneBanio) 300 else 800 }
	method pesoMaximo() { return 2000 + 80 * self.cantidadDePasajeros() + self.cargaMaxima() }
	method tieneBanio() { return tieneBanio }
	method recibirMantenimiento() { estaOrdenado = true }
	method esDePasajeros() { return true }
	
}

class VagonDeCarga{
	
	const cargaMaximaIdeal
	var maderasSueltas
	
	method cantidadDePasajeros() { return 0 }
	method cargaMaxima() { return cargaMaximaIdeal - 400 * maderasSueltas }
	method pesoMaximo() { return 1500 + self.cargaMaxima() }
	method tieneBanio() { return false }
	method recibirMantenimiento() { maderasSueltas = 0.max(maderasSueltas - 2) }
	method esDePasajeros() { return false }
	
}

class VagonDormitorio{
	
	const compartimientos
	const camasPorCompartimiento
	
	method cantidadDePasajeros() { return compartimientos * camasPorCompartimiento }
	method cargaMaxima() { return 1200 }
	method pesoMaximo() { return 4000 + 80 * self.cantidadDePasajeros() + self.cargaMaxima() }
	method tieneBanio() { return true }
	method recibirMantenimiento() {}
	method esDePasajeros() { return true }
	
}