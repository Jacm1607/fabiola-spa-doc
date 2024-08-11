

@startuml
actor "Cajero" as A
boundary "UI Producto" as V
control "ProductoController" as C
entity "Producto" as E

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('producto.index')

A -> C : create()
C --> V : return view('producto.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('producto.index')


A -> C : edit($id)
C -> E : findOrFail($id)
C --> V : return view('producto.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('producto.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('producto.index')

@enduml