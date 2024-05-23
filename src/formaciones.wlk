class Formacion {
	
	const vagones = []
	const locomotoras = []
	
	method agregar(vagon) { vagones.add(vagon) }
	method remover(vagon) { vagones.remove(vagon) }
	method cuantosPasajerosPuedeLlevar() { return vagones.sum({ vagon => vagon.cantidadDePasajeros() }) }
	method cantidadDeVagonesPopulares() { return vagones.filter({ vagon => vagon.cantidadDePasajeros() > 50 }).size() }
	method esCarguera() { return vagones.all({ vagon => vagon.cargaMaxima() >= 1000 }) }
	method vagonMasPesado() { return vagones.max({ vagon => vagon.pesoMaximo() }).pesoMaximo() }
	method vagonMasPesadoObjeto() { return vagones.max({ vagon => vagon.pesoMaximo() }) }
	method vagonMasLiviano() { return vagones.min({ vagon => vagon.pesoMaximo() }).pesoMaximo() }
	method dispersionDePesos() { return self.vagonMasPesado() - self.vagonMasLiviano() }
	method cantidadDeBanios() { return vagones.count({ vagon => vagon.tieneBanio() }) }
	method realizarMantenimiento() { vagones.forEach({ vagon => vagon.recibirMantenimiento() }) }
	method vagonQueMasPasajerosLleva() { return vagones.max({ vagon => vagon.cantidadDePasajeros() }).cantidadDePasajeros() }
	method vagonQueMenosPasajerosLleva() { return vagones.min({ vagon => vagon.cantidadDePasajeros() }).cantidadDePasajeros() }
	method estaEquilibradaEnPasajeros() { return self.vagonQueMasPasajerosLleva() - self.vagonQueMenosPasajerosLleva() <= 20 }
	method estaOrganizada() {
		const index = (1..vagones.size() - 1)
		return !index.any({ i => !vagones.get(i-1).esDePasajeros() and vagones.get(i).esDePasajeros() })
	}
	method agregarA(locomotora) { locomotoras.add(locomotora) }
	method removerA(locomotora) { locomotoras.remove(locomotora) }
	method velocidadMaxima() { return locomotoras.min({ locomotora => locomotora.velocidadMaxima() }) }
	method esEficiente() { return locomotoras.all({ locomotora => locomotora.esEficiente() }) }
	method capacidadDeArrastre() { return locomotoras.sum({ locomotora => locomotora.capacidadDeArrastre() }) }
	method pesoMaximo() { return vagones.sum({ vagon => vagon.pesoMaximo() }) + locomotoras.sum({ locomotora => locomotora.pesoMaximo() }) }
	method puedeMoverse() { return self.capacidadDeArrastre() >= self.pesoMaximo() }
	method kilosDeEmpujeFaltantesParaMoverse() { return 0.max(self.pesoMaximo() - self.capacidadDeArrastre()) }
	method cantidadDeUnidades() { return vagones.size() + locomotoras.size() }
	method esCompleja() { return self.cantidadDeUnidades() > 8 or self.pesoMaximo() > 8000}
	method locomotoras() { return locomotoras }
	
}