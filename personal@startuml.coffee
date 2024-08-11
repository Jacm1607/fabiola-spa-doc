@startuml
actor "Supervisor" as A
boundary "UI Personal" as V
control "PersonalController" as C
entity "Personal" as E
entity "Area" as E2
entity "Servicio" as E3

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('personal.index')

A -> C : create(Persona $persona)
C -> E2 : where('estado', '1')
C -> E3 : where('estado', '1')
C --> V : return view('personal.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return view('personal.create')

A -> C : edit($id)
C -> E : findOrFail($id)
C -> E3 : where('estado', '1')
C -> E3 : where('id', '!=', $personal->id_servicio)
C -> E2 : where('estado', '1')
C -> E2 : where('id', '!=', $personal->id_servicio)
C --> V : return view('personal.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('personal.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('personal.index')

@enduml