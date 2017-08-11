defmodule Pokemontuple do

  #pokemonlist = [{"0","Charmeleon", "fire", "25", "Charizard", "Charmander"}]
  #pokemonlist = [{"1","Trophius", "grass", "15", "nil", "nil"}]
  #pokemonlist = [{"2","Arcanine", "fire", "45", "nil", "Growthlite"}]

  def line(pokemonlist) do
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
  char_to_opcion(value,pokemonlist)
  end

  defp agregarpokemon(pokemonlist) do
    nombre = String.strip(IO.gets("Nombre:"))
    tipo = String.strip(IO.gets("Tipo:"))
    nivel = String.strip(IO.gets("Nivel:"))
    evolucion = String.strip(IO.gets("Evolucion:"))
    prevolucion = String.strip(IO.gets("Prevoucion:"))
    pokemon = List.keystore(pokemonlist,:"#{length(pokemonlist)}",length(pokemonlist),{"#{length(pokemonlist)}",nombre,tipo,nivel,evolucion,prevolucion})
    line(pokemon)
  end

  defp filtrarportipo(pokemonlist) do
    tipo = String.strip(IO.gets("Por que tipo desea filtrar?"))
    filtro= []
    List.keystore(filtro,:"#{length(filtro)}",length(filtro),List.keytake(pokemonlist,tipo,2))
  end

  defp filtrarporid(pokemonlist) do
    id = String.strip(IO.gets("Que id desea filtrar?"))
    filtro= []
    List.keystore(filtro,:"#{length(filtro)}",length(filtro),List.keytake(pokemonlist,id,0))
  end

  defp filtrarpornivel(pokemonlist) do
    nivel = String.strip(IO.gets("Por que nivel desea filtrar?"))
    filtro= []
    List.keystore(filtro,:"#{length(filtro)}",length(filtro),List.keytake(pokemonlist,nivel,3))
  end

  defp filtrarporprevolucion(pokemonlist) do
    filtro = List.keydelete(pokemonlist,"nil",5)
  end

  defp filtrarporevolucion(pokemonlist) do
    filtro = List.keydelete(pokemonlist,"nil",4)
  end

  defp char_to_opcion(char,pokemonlist) do
    case char do
    "1" -> agregarpokemon(pokemonlist)
    "2" -> filtrarportipo(pokemonlist)
    "3" -> filtrarporid(pokemonlist)
    "4" -> filtrarpornivel(pokemonlist)
    "5" -> filtrarporprevolucion(pokemonlist)
    "6" -> filtrarporevolucion(pokemonlist)
    end
  end
end
