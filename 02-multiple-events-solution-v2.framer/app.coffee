# Create a new layer called container that will hold your video. It should be 500x500px, a background of null and centered in the page
container = new Layer
	height: 500
	width: 500
	backgroundColor: null
	
container.center()


# Create a new VideoLayer that is 480x270px, has a "video" attribute that is set to the url "images/Street-View.mp4" and its superLayer is container. Center the video after.
video = new VideoLayer
	width: 480
	height: 270
	video: "images/Street-View.mp4"
	superLayer: container
	backgroundColor: null
	opacity: .5
	
video.center()


# Create a new layer, a small circle (20x20px), that is initially invisible, has a background color of #FC5255 and has a superLayer of videoLayer. 
# (Hint: to make a circle, change its borderRadius to 50)
circle = new Layer
	height: 20
	width: 20
	backgroundColor: "#FC5255"
	borderRadius: 50
	superLayer: video
	opacity: 0

# Great! Now we need to add some Event Listeners to make our example a little more interactive. Let's start by creating an event that triggers when a user hovers over videoLayer.
# On MouseOver, check to see if the player is paused. If it is, call the play() function. If not, call the pause() function. Do the same on MouseOut.
video.on Events.MouseOver, ->
	@animate
		properties:
			opacity: 1
		time: .5
	
	if @player.paused
		@player.play()
	else
		@player.pause()

video.on Events.MouseOut, ->
	@animate
		properties:
			opacity: .5
		time: .5

	if @player.paused
		@player.play()
	else
		@player.pause()
		


# Extra Credit! Remember that circle layer we created? Let's display it when the user clicks inside the videoLayer.

# To do this, lets add a Click Event Listener to the videoLayer. This time, we'll need to pass in an argument called "event" to get some information about where the user clicked.

# Let's start by just printing the coordinates of where the user clicked. We can do this with event.x / event.y, as well as event.offsetX / event.offsetY. Event.x/y gets the click position relative to the ENTIRE document, while offsetX/Y gets the position relative to the clicked element. 

# On click, print event.offsetX and event.offsetY. Also, set circle's visibility to true. Lastly, we'll use the offsetX/Y coordinates to set circle's midX/Y.

video.on Events.Click, (event, layer) ->
	print(event.x, event.y)
	print(event.offsetX, event.offsetY)
	circle.props = 
		midX: event.offsetX
		midY: event.offsetY
		opacity: 1
		
	circle.animate
		properties:
			opacity: 0
		time: 1
	








