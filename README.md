#Currently-playing View

This repo demonstrates how one could add a custom view on top of UITabBar and toggle its visibility, similar to how music apps like Spotify and Apple Music have a "Currently Playing"

![](/readme.gif)

In essence, it increases the size of the original UITabBar to accomodate a custom view (and to shrink the frame of the viewcontrollers above), and then adds a duplicate UITabBar + custom view right on top of it. 

When it's time to hide, the custom view has its alpha set to 0, size of the original UITabBar is set to original size (49), and layouts are updated.

Other designs that were taken into consideration can be found [at this Stack Overflow post](http://stackoverflow.com/questions/42384470/view-on-top-of-uitabbar)

##Gotchas
Make sure the original TabBar (one in Main.storyboard and under UITabBarController) has its Translucent unchecked. 
