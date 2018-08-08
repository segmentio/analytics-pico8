# analytics-pico8

Analytics for your PICO-8 game, powered by Segment.

<br>

## Wait, what?

PICO-8 is a tool that you can use to create (and distribute) small, retro-style games. It's like Unity – the game engine – but with more design constraints to encourage you to keep your project scope small. Admittedly, it's kinda nerdy.

Segment is an awesome analytics product that intends to be your **customer data infrastructure**. You can use Segment to track user events, send events out to hundreds of analytics tools automatically, and use these tools to derive insights from your data. Armed with these insights, you can find ways to improve your game's design.

<br>

## Awesome, how do I use it?

#### Learn

If you're new to PICO-8, I suggest skimming the [manual](https://www.lexaloffle.com/pico-8.php?page=manual) for an overview.

#### Copy and paste

Copy and paste [`track.lua`](./track.lua) into your PICO-8 game.

#### API

`track.lua` will expose a single function `track()` globally. To use:

```lua
-- API:
track(event, properties?)

-- Example:
track('Level Cleared', {
  level             = 4,
  time              = 39.2,
  found_secret_room = true,
})
```

You can track as many events and properties as you want, subject to PICO-8's char and token limits. `track.lua` serializes `track()` calls to PICO-8's [GPIO pins](http://pico-8.wikia.com/wiki/GPIO), so be aware that you have 128 bytes to work with.

#### Export

In the PICO-8 console, export your game to HTML5:

```sh
> EXPORT YOUR_GAME.HTML
```

<br>

`gif goes here`
