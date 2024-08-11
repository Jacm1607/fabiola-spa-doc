@startuml
actor "Administrador de sistema" as A
boundary "UI Usuario" as V
control "UsuarioController" as C
entity "Usuario" as E
entity "Rol" as E2
entity "Persona" as E3

A -> C : index(Request $request)
C -> E : where('estado', '1')
C --> V : return view('usuario.index')

A -> C : create()
C -> E2 : where('estado', '1')
C -> E3 : where('estado', '1')
C --> V : return view('usuario.create')

A -> C : store(Request $request)
C -> E : save()
C --> V : return redirect()->route('usuario.index')


A -> C : edit($id)
C -> E : findOrFail($id)
C -> E2 : where('estado', '1')
C -> E2 : where('id', '!=', $usuario->id_rol)
C -> E3 : where('estado', '1')
C -> E3 : where('id', '!=', $usuario->id_persona)
C --> V : return view('usuario.edit')

A -> C : update(Request $request, $id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('usuario.index')

A -> C : delete($id)
C -> E : findOrFail($id)
C -> E : update(['estado' => '0'])
C --> V : return redirect()->route('usuario.index')

A -> C : reset_password($id)
C -> E : findOrFail($id)
C -> E : update()
C --> V: return redirect()->route('usuario.index')

@enduml