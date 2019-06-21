[![Travis](https://img.shields.io/travis/preciz/parse_torrent.svg?style=flat-square)](https://travis-ci.org/preciz/parse_torrent)
[![Hex version](https://img.shields.io/hexpm/v/parse_torrent.svg "Hex version")](https://hex.pm/packages/parse_torrent)
# ParseTorrent

ParseTorrent parses a .torrent file and returns a map

## Installation

Add parse_torrent to your list of dependencies in `mix.exs`:

    def deps do
      [{:parse_torrent, "0.3.0"}]
    end

## Usage
`parse/1` will return a 2-tuple with `:ok` or return `:error` if torrent is invalid.

    data = File.read!("mypath/myfile.torrent")
    ParseTorrent.parse(data)

`parse!/1` will return a map or raise if torrent is invalid.

    ParseTorrent.parse!(data)

## Credit

Based on [parse-torrent-file](https://github.com/feross/parse-torrent-file) by [feross](https://github.com/feross).

## License
ParseTorrent is released into the public domain (see `UNLICENSE`).
