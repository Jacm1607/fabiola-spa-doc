@startuml
actor "Administrador de sistema" as A
boundary "UI Rol" as V
control "RolController" as C
entity "Rol" as E
entity "Privilegio" as E2

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('rol.index')

A -> C : create()
C -> E2 : where('estado', '1')
C --> V : return view('rol.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('rol.index')


A -> C : edit($id)
C -> E2 : where('estado', '1')
C -> E : findOrFail($id)
C --> V : return view('rol.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('rol.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('rol.index')

@enduml