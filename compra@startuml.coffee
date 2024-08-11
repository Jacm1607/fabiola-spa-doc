@startuml
actor "Cajero" as A
boundary "UI Compra" as V
control "CompraController" as C
entity "Compra" as E
entity "Proveedor" as E2
entity "DetalleCompra" as E3
entity "Producto" as E4

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('compra.index')

A -> C : create()
C -> E : where('estado', '1')
C -> E2 : where('estado', '1')
C --> V : return view('compra.create')

A -> C : store(Request $request)
C -> E : save()
C -> E3 : save()
C -> E4 : findOrFail($producto->id)
C -> E4 : update()
C --> V : return redirect()->route('compra.index')

A -> C : show($id)
C -> E : findOrFail($id)
C -> E3 : where('id_compra', $compra->id)
C --> V : return view('compra.edit')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('compra.index')

@enduml