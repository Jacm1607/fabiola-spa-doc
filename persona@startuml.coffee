@startuml
actor "Supervisor" as A
boundary "UI Persona" as V
boundary "UI Personal" as V2
boundary "UI Cliente" as V3
control "PersonaController" as C
entity "Persona" as E
entity "TipoPersona" as E2
entity "Personal" as E3
entity "Cliente" as E4

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('persona.index')

A -> C : create()
C -> E2 : where('estado', '1')
C --> V : return view('persona.create')

A -> C : store(Request $request)
C -> E : save()
alt personal
    C -> E3 : save()
    C --> V2 : return redirect()->route('personal.edit', $personal->id)
else cliente
    C -> E4 : save()
    C --> V3 : return redirect()->route('cliente.edit', $cliente->id)
end

A -> C : edit($id)
C -> E : findOrFail($id)
C -> E2 : findOrFail($id)
C -> E2 : where('id', '!=', $persona->id_tipo_persona)
C --> V : return view('persona.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('persona.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('persona.index')

A -> C : pdf()
C -> E : where('estado', '1')
C --> V : return view('persona.pdf')

@enduml