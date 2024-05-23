class DepositoFerroviario {
	
	const formaciones = []
	const locomotorasSueltas = []
	
	method agregar(formacion) { formaciones.add(formacion) }
	method agregarA(locomotora) { locomotorasSueltas.add(locomotora) }
	method remover(formacion) { formaciones.remove(formacion) }
	method removerA(locomotora) { locomotorasSueltas.remove(locomotora) }
	method vagonesMasPesados() { return formaciones.map({ formacion => formacion.vagonMasPesadoObjeto() }) }
	method necesitaConductorExperimentado() { return formaciones.any({ formacion => formacion.esCompleja() }) }
	method filtrarLocomotorasPara(formacion) { 
		return locomotorasSueltas.filter({ locomotora => locomotora.capacidadDeArrastre() >= formacion.kilosDeEmpujeFaltantesParaMoverse()}).anyOne()
	}
	method agregarLocomotoraA(formacion) {
		if(!formacion.puedeMoverse()){
			try{
				const locomotora = self.filtrarLocomotorasPara(formacion)
				formacion.agregarA(locomotora)
				self.removerA(locomotora)
			}
			catch e{
				console.println("No se encontró una locomotora adecuado | Esta formacion no requiere locomotoras")
			}
		}
	}
	
}
