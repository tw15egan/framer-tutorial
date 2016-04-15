# Create a new layer called container that will hold your video. It should be 500x500px, a background of null and centered in the page


# Create a new VideoLayer that is 480x270px, has a "video" attribute that is set to the url "images/Street-View.mp4" and its superLayer is container. Center the video after.


# Create a new layer, a small circle (20x20px), that is initially invisible, has a background color of #FC5255 and has a superLayer of videoLayer. 
# (Hint: to make a circle, change its borderRadius to 50)

# Great! Now we need to add some Event Listeners to make our example a little more interactive. Let's start by creating an event that triggers when a user hovers over videoLayer.
# On MouseOver, check to see if the player is paused. If it is, call the play() function. If not, call the pause() function. Do the same on MouseOut.



# Extra Credit! Remember that circle layer we created? Let's display it when the user clicks inside the videoLayer.

# To do this, lets add a Click Event Listener to the videoLayer. This time, we'll need to pass in an argument called "event" to get some information about where the user clicked.

# Let's start by just printing the coordinates of where the user clicked. We can do this with event.x / event.y, as well as event.offsetX / event.offsetY. Event.x/y gets the click position relative to the ENTIRE document, while offsetX/Y gets the position relative to the clicked element. 

# On click, print event.offsetX and event.offsetY. Also, set circle's visibility to true. Lastly, we'll use the offsetX/Y coordinates to set circle's midX/Y.

	








