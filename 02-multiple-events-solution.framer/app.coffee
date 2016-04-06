# Create a new layer called container that will hold your video. It should be 500x500px and centered in the page
container = new Layer
	backgroundColor: "#fff"
	height: 500
	width: 500
	
container.center()

# Create a new VideoLayer that is 480x270px, has a "video" attribute that is set to the url "images/Street-View.mp4" and its superLayer is container. Center the video after.
videoLayer = new VideoLayer 
	width: 480
	height: 270
	video: "images/Street-View.mp4"
	superLayer: container
	
videoLayer.center()

# Create a new layer, a small circle (20x20px), that is initially invisible and has a superLayer of videoLayer. 
# (Hint: to make a circle, change its borderRadius to 50)
layerA = new Layer
	height: 20
	width: 20
	borderRadius: 50
	visible: false
	superLayer: videoLayer

# Great! Now we need to add some Event Listeners to make our example a little more interactive. Let's start by creating an event that triggers when a user mouses over videoLayer.


# On MouseOver, check to see if the player is paused. If it is, call the play() function. If not, call the pause() function. Do the same on MouseOut.
videoLayer.on Events.MouseOver,  ->
	if @player.paused
		@player.play()
		print "play"
	else
		@player.pause()
		print "pause"
		
videoLayer.on Events.MouseOut,  ->
	if @player.paused
		@player.play()
		print "play"
	else
		@player.pause()
		print "pause"

# Extra Credit! Remember that circle layer we created? Let's display it when the user clicks inside the videoLayer.

# To do this, lets add a Click Event Listener to the videoLayer. This time, we'll need to pass in an argument called "event" to get some information about where the user clicked.

# Let's start by just printing the coordinates of where the user clicked. We can do this with event.x / event.y, as well as event.offsetX / event.offsetY. Event.x/y gets the click position relative to the ENTIRE document, while offsetX/Y gets the position relative to the clicked element. 

# On click, print event.offsetX and event.offsetY. Also, set layerA's visibility to true. Lastly, we'll use the offsetX/Y coordinates to set layerA's midX/Y.
videoLayer.on Events.Click, (event) ->
	print "Offset: ", event.offsetX, event.offsetY
	print "Absolute: ", event.x, event.y
	layerA.visible = true
	layerA.midX = event.offsetX
	layerA.midY = event.offsetY





