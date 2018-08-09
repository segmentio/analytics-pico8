# analytics-pico8

<img src="https://user-images.githubusercontent.com/914228/43900090-aaf02800-9b98-11e8-931e-c82e0c3ed44b.png" alt="" width="500px"></img>

Analytics for your PICO-8 game, powered by Segment.

<br>

## Wait, what?

PICO-8 is a tool that you can use to create (and distribute) small, retro-style games. It's like Unity – the game engine – but with more design constraints to encourage you to keep your project scope small. Admittedly, it's kinda nerdy.

Segment is an awesome analytics product that intends to be your **customer data infrastructure**. You can use Segment to track user events, send events out to hundreds of analytics tools automatically, and use these tools to derive insights from your data. Armed with these insights, you can find ways to improve your game's design.

<br>

## Awesome, how do I use it?

### Learn

If you're new to PICO-8, I suggest skimming the [manual](https://www.lexaloffle.com/pico-8.php?page=manual) for an overview.

<br>

### Copy and paste

Copy and paste [`track.lua`](./track.lua) into your PICO-8 game.

<br>

### API

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

You can track as many events and properties as you want, subject to PICO-8's char and token limits. `track.lua` serializes `track()` calls to PICO-8's [GPIO pins](http://pico-8.wikia.com/wiki/GPIO), so be aware that you have 128 bytes of info per `track()` call.

<br>

### Export, insert `track.html` and `analytics.js`

In the PICO-8 console, export your game to HTML5:

```sh
> EXPORT YOUR_GAME.HTML
```

Find your `<script>` tag in the generated HTML. It should look like this:

```html
<script async type="text/javascript" src="your_game.js"></script>
```

Above it, insert the contents of [`track.html`](./track.html), then the [`analytics.js` snippet](https://segment.com/docs/sources/website/analytics.js/quickstart/) (in that order).

You can reference [`track_test.html`](./track_test.html) as an example.

<br>

### Celebrate

If all goes well, you should see events flowing through to Segment's Debugger:

<img width="1300" alt="screen shot 2018-08-08 at 1 50 50 pm" src="https://user-images.githubusercontent.com/914228/43863611-1736cca8-9b12-11e8-97e4-f07de2bdf88c.png">

You now have the ability to understand how players interact with your game's design! Go forth and inform your designs with data.

<br>

## Feedback

Please open an [issue](https://github.com/segmentio/analytics-pico8/issues/new).

<br>

## License

`analytics-pico8` is released under the MIT License.

Copyright © 2018 Segment.io, Inc.
