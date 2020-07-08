
type +'a source =
  Source : {
    init : unit -> 's;
    pull : 's -> ('a * 's) option;
    stop : 's -> unit;
  } -> 'a source


type ('a, 'b) sink =
  Sink : {
    init : unit -> 's;
    push : 's -> 'a -> 's;
    full : 's -> bool;
    stop : 's -> 'b;
  } -> ('a, 'b) sink


type 'a stream =
  { stream : 'b . ('a, 'b) sink -> 'b }
  [@@unboxed]


type ('a, 'b) flow =
  { flow : 'r . ('b, 'r) sink -> ('a, 'r) sink }
  [@@unboxed]

