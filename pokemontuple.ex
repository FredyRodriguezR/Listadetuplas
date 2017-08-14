defmodule Pokemontuple do

  #pokemonlist = [{"0","Charmeleon", "fire", "25", "Charizard", "Charmander"}]
  #pokemonlist = [{"1","Trophius", "grass", "15", "nil", "nil"}]
  #pokemonlist = [{"2","Arcanine", "fire", "45", "nil", "Growthlite"}]

  def start() do
    pokemonlist = [{"0","Charmeleon", "fire", "25", "Charizard", "Charmander"},
  {"1","Trophius","grass", "25", "nil", "nil"},
  {"2","Arcanine", "fire", "45", "nil", "Growthlite"},
  {"3","Growthlite", "fire", "10", "Arcanine", "nil"}]

  get_opcion(pokemonlist)
  end

  defp get_opcion(pokemonlist) do
  IO.puts(
  """
  Que opcion desea elegir?
  1. Agregar Pokemon
  2. Filtrar por tipo
  3. Filtrar por numero de id
  4. Filtrar por nivel
  5. Filtrar si tiene pre-evolucion
  6. Filtrar si tiene evolucion
  """
  )
  answer = IO.gets("Which? > ")
  value=String.first(answer)
  tamlista =length(pokemonlist)
  filtro = []
  char_to_opcion(value,pokemonlist,tamlista,filtro)

  end

  defp agregarpokemon(pokemonlist) do
    nombre = String.strip(IO.gets("Nombre:"))
    tipo = String.strip(IO.gets("Tipo:"))
    nivel = String.strip(IO.gets("Nivel:"))
    evolucion = String.strip(IO.gets("Evolucion:"))
    prevolucion = String.strip(IO.gets("Prevoucion:"))
    pokemon = List.keystore(pokemonlist,:"#{length(pokemonlist)}",length(pokemonlist),{"#{length(pokemonlist)}",nombre,tipo,nivel,evolucion,prevolucion})
    get_opcion(pokemon)
  end

  defp filtrarportipo(_,n,_,_)when n <= 0  do
    IO.puts("Lista analizada")
  end

  defp filtrarportipo(pokemonlist, n,filtro,tipo)when tipo==nil do
    tipo = String.strip(IO.gets("Por que tipo desea filtrar?"))
    if elem(List.first(pokemonlist),2) == tipo do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarportipo(pokemonlist,n-1,filtro,tipo)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end

  defp filtrarportipo(pokemonlist, n,filtro,tipo)when tipo !=nil do
    if elem(List.first(pokemonlist),2) == tipo do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarportipo(pokemonlist,n-1,filtro,tipo)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end

  defp filtrarporid(pokemonlist) do
    id = String.strip(IO.gets("Que id desea filtrar?"))
    List.keyfind(pokemonlist,id,0)
  end

  defp filtrarpornivel(_,n,_,_)when n <= 0  do
    IO.puts("Lista analizada")
  end

  defp filtrarpornivel(pokemonlist, n,filtro,nivel)when nivel==nil do
    nivel = String.strip(IO.gets("Por que nivel desea filtrar?"))
    if elem(List.first(pokemonlist),3) == nivel do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarpornivel(pokemonlist,n-1,filtro,nivel)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end

  defp filtrarpornivel(pokemonlist, n,filtro,nivel)when nivel != nil do
    if elem(List.first(pokemonlist),3) == nivel do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarpornivel(pokemonlist,n-1,filtro,nivel)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end


  defp filtrarporprevolucion(_,n,_)when n <= 0  do
    IO.puts("Lista analizada")
  end

  defp filtrarporprevolucion(pokemonlist, n,filtro) do
    if elem(List.first(pokemonlist),5) != "nil" do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarporprevolucion(pokemonlist,n-1,filtro)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end

  defp filtrarporevolucion(_,n,_)when n <= 0  do
    IO.puts("Lista analizada")
  end

  defp filtrarporevolucion(pokemonlist, n,filtro) do
    if elem(List.first(pokemonlist),4) != "nil" do
    filtro = List.insert_at(filtro,length(filtro),List.first(pokemonlist))
    end
    pokemonlist = List.delete(pokemonlist,List.first(pokemonlist))
    filtrarporevolucion(pokemonlist,n-1,filtro)
    if n == 1 do
      mostrarFiltro(filtro)
    end
  end

  defp mostrarFiltro(filtro)do
    IO.inspect(filtro)
  end

  defp char_to_opcion(char,pokemonlist,tamLista,filtro) do
    tipo = nil
    nivel = nil
    case char do
    "1" -> agregarpokemon(pokemonlist)
    "2" -> filtrarportipo(pokemonlist,tamLista,filtro,tipo)
    "3" -> filtrarporid(pokemonlist)
    "4" -> filtrarpornivel(pokemonlist,tamLista,filtro,nivel)
    "5" -> filtrarporprevolucion(pokemonlist,tamLista,filtro)
    "6" -> filtrarporevolucion(pokemonlist,tamLista,filtro)
    end
  end
end
