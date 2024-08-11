@startuml
actor "Cajero" as A
boundary "UI Venta" as V
control "VentaController" as C
entity "Venta" as E
entity "Cliente" as E2
entity "DetalleVenta" as E3
entity "Servicio" as E4

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('venta.index')

A -> C : create()
C -> E4 : where('estado', '1')
C -> E2 : where('estado', '1')
C --> V : return view('venta.create')

A -> C : store(Request $request)
C -> E : save()
C -> E3 : save()
C --> V : return redirect()->route('venta.index')

A -> C : show($id)
C -> E : findOrFail($id)
C -> E3 : where('id_venta', $venta->id)
C --> V : return view('venta.edit')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('venta.index')

@enduml