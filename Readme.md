# as-atmrobbery
 
# ATM Robbery With Rope and Car
* removed required minigame 
* added a lock out timer befor can crack the safe in config
* No Support

# Robbery Preview
* [Preview](https://youtu.be/vXsjenKWo7k)

# Add to qb-core > shared > items.lua
```lua
    ["rope"]                             = {["name"] = "rope",	                ["label"] = "Rope",               ["weight"] = 1500,      ["type"] = "item",       ["image"] = "rope.png",          ["unique"] = true,      ["useable"] = true,     ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "maybe somewhere to attached looks thick enough to pull something"},
```

* You need to add the item img in qb-inventory/html/images.

# Dependencies
* [qb-target](https://github.com/BerkieBb/qb-target)
* [ps-dispatch](https://github.com/Project-Sloth/ps-dispatch)
* [ps-ui](https://github.com/Project-Sloth/ps-ui) i think i removed the need for this 

# Original
https://github.com/ddainusshaa/dd-atmrobbery
https://github.com/BigPapaBear2217/mrf_atmrobbery
