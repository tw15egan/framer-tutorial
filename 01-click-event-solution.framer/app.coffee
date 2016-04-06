

# Set background
bg = new BackgroundLayer backgroundColor: "#555"

# Create layer
layerA = new Layer
	width: 250
	height: 250
	backgroundColor: "#FFA552"
	borderRadius: 8
	
layerA.center()
	
# Rotate on click
layerA.on Events.Click, ->
	layerA.animate
		properties:
			rotation: layerA.rotation + 90
		curve: "spring(400,25,0)"