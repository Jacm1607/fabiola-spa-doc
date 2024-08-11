@startuml
actor "Administrador general" as A
boundary "UI Servicio" as V
control "ServicioController" as C
entity "Servicio" as E

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('servicio.index')

A -> C : create()
C --> V : return view('servicio.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('servicio.index')


A -> C : edit($id)
C -> E : findOrFail($id)
C --> V : return view('servicio.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('servicio.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('servicio.index')

@enduml