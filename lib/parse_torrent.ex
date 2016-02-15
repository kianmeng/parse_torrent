defmodule ParseTorrent do
  @moduledoc """
    Parses a .torrent file and returns a map

    Usage:
    ParseTorrent.parse("my_path/my_file.torrent")
  """

  def parse(file_path) do
    torrent = File.read!(file_path) |> Bencodex.decode

    torrent
    |> torrent_valid?
    |> do_parse
  end

  defp torrent_valid?(torrent) do
    import Map, only: [get: 2, fetch!: 2]

    try do
      torrent |> fetch!("info")
      torrent |> get("info") |> fetch!("name")
      torrent |> get("info") |> fetch!("piece length")
      torrent |> get("info") |> fetch!("pieces")
    rescue
      _ -> raise(InvalidTorrentError)
    end

    torrent
  end

  defp do_parse(torrent) do
    %{ info_hash: info_hash(torrent) }
  end

  defp info_hash(torrent) do
    torrent["info"]
    |> Bencodex.encode
    |> sha1
    |> Base.encode16
    |> String.downcase
  end

  defp sha1(data) do
    :crypto.hash(:sha, data)
  end
end

defmodule InvalidTorrentError do
  defexception message: "Missing key"
end
