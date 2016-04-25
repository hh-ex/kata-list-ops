# Aprils Edition - RfcBinaries

coding challenge repo for hh.ex april edition

## Description:

I'm recently into reading RFCs and implementing against the specs inside. There's one big drawback, tho. They use a hexdump format which is all-in incompatible to any elixir binary format.

```
8286 84be 5886 a8eb 1064 9cbf           | ....X....d..
```

```
8287 85bf 4088 25a8 49e9 5ba9 7d7f 8925 | ....@.%.I.[.}..%
a849 e95b b8e8 b4bf                     | .I.[....
```

```
8286 8441 8cf1 e3c2 e5f2 3a6b a0ab 90f4 | ...A......:k....
ff                                      | .
```

Ideal would be using a Elixir Sigil so solve that issue. How'd you tackle it?
