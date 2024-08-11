

@startuml
actor "Cajero" as A
boundary "UI Cliente" as V
control "ClienteController" as C
entity "Cliente" as E
entity "Persona" as E2

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('cliente.index')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('cliente.index')


A -> C : edit($id)
C -> E : findOrFail($id)
C -> E2: where('estado', '1')
C -> E2: where('id', '!=', $cliente->id_persona)
C --> V : return view('cliente.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('cliente.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('cliente.index')

@enduml