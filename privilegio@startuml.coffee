@startuml
actor "Administrador de sistema" as A
boundary "UI Privilegio" as V
control "PrivilegioController" as C
entity "Privilegio" as E

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('privilegio.index')

A -> C : create()
C --> V : return view('privilegio.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('privilegio.index')

A -> C : edit($id)
C -> E : findOrFail($id)
C --> V : return view('privilegio.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('privilegio.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('privilegio.index')

@enduml