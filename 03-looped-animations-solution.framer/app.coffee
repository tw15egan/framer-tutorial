Screen.backgroundColor = "#EEF5DB"
Framer.Defaults.Layer.backgroundColor = "#FE5F55"

# Alright let's start by creating our target layer, the object we want to animate. Set it's X and Y coords to 100, and let's make it 300x200px.
targetLayer = new Layer
	x: 100
	y: 100
	width: 300
	height: 200
	borderRadius: 10
	
# Now let's add a trigger button for our animation. Let's name it start, make it 400x100 and label it "Click". Center the start button.
start = new Layer
	height: 100
	width: 400

Utils.labelLayer(start, "Click")
start.style = {
	"font-size": "40px"
}

start.center()
	
# Awesome, now we're all set to add some animations.  This time, instead of adding the animation properties inside of the Event Listener, we'll make what is called an "Animation Object". It's format looks almost identical to how we did it inside of an EventListener	
animation = new Animation
	layer: targetLayer
	properties: 
		x: 300
	curve: "spring"
	time: .5

# Since we created an animation object, we can trigger it by entering "animation.start()". Each animation object also has a .reverse() method, which we will use to loop the animation.  

# Let's save the reversed animation in a variable called reverse
count = 0	
reverse = animation.reverse()

# Now let's add an event listener to the animation object. What's great about using an animation object is that it allows us to listen for "AnimationEnd".

# Create two event listeners, one for "animation" and one for "reverse". They will both be on the lookout for the "AnimationEnd" event.

# With these two event listeners in place, we now know when each animation ends. Trigger the other animation on each AnimationEnd
animation.on Events.AnimationEnd, ->
	++count
	print count
	reverse.start()
	
reverse.on Events.AnimationEnd, ->
	++count
	print count
	animation.start()
	
# Okay, great! We've got our Event Listeners in place, but we have no way to actually trigger the animation yet. That's what our "start" button is for. Create a new Click Event on the "start" layer

# Inside the Click Event, let's make an if statement that checks to see if our "targetLayer" is animating. If it is, call animation.stop(). If it isn't, start the animation. 
start.on Events.Click, ->
	if !targetLayer.isAnimating
		animation.start()
	else 
		animation.stop()
		

