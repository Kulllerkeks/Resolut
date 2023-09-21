# Resolut
A simple free Lua module for easy resolution scaling.


## Usage

To use Resolut, put it into your work folder and require it in your code

The constructor needs the original width and height of the application to calculate the ratio based on the changes and reserve the original ratio.
You can pass in the [Gamera cam](https://github.com/kikito/gamera) too to set the window dimensions and center the camera on the screen.
```lua
Resolut = require("resolut").new(800,600, Cam)
```

after that you need to call the resize function in love.resize

```lua
funcion love.resize(w,h)
    Resolut:Resize()
end
```
and you are good to go. Enjoy the scaling!
