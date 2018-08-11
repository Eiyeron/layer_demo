This is a micro love2d project showcasing a simple LoveZD-based fake 3D renderer through layered sprite rendering as seen [here][reddit_post]. The white circle is the rotation center. 

![Screenshot of the demo](https://raw.githubusercontent.com/Eiyeron/layer_demo/master/screenshot.png)

## Controls

- Move the mouse horizontally the tweak the rotation angle.
- Press F to toggle the texture's filter between nearest (clean and sharp) and linear (muddy and cloudy)

## Notes

- This method is pretty flexible. With a transparent layer used to hie non used layers and tweaking on the fly, you could eventually animate a sprite this way.
- For the linear interpolation to gracefully stop at the sprite's limits, border your sprite with 1-pixel wide transparent border to let the interpolation finish going back to transparent.
- I haven't pushed a lot the benchmarks but it seems that the spritebatch method is quite faster than just manually drawing each layer. What has not been done yet is determining which between a single texture and an ArrayTexture is the fastest.
- There is a fun trick here : 
```lua
-- ...
    for i=0,castle_batch:getCount()-1 do
        -- snip --
        castle_batch:setColor(v, v, v, 1) -- This line changes the color for the next layers
        castle_batch:setLayer(--[[snip]])
    end
-- ...
```
This allowed the light gradient on the demo. Easy simple gradient and coloring could be done with this tehcnique. 

## Thanks

I'll thank ephtracy for [magica_voxel][MagicaVoxel] and the castle sample model used here.

[reddit_post]: https://www.reddit.com/r/gamedev/comments/57x7n3/really_cool_fake_3d_in_gamemaker_by_the_creator/
[magica]: http://ephtracy.github.io/