@startuml
actor "Administrador general" as A
boundary "UI Proveedor" as V
control "ProveedorController" as C
entity "Proveedor" as E

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('proveedor.index')

A -> C : create()
C --> V : return view('proveedor.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('proveedor.index')


A -> C : edit($id)
C -> E : findOrFail($id)
C --> V : return view('proveedor.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('proveedor.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('proveedor.index')

@enduml