@startuml
actor "Supervisor" as A
boundary "UI Area" as V
control "AreaController" as C
entity "Area" as E

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('area.index')

A -> C : create()
C --> V : return view('area.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('area.index')

A -> C : edit($id)
C -> E : findOrFail($id)
C --> V : return view('area.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('area.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('area.index')

@enduml