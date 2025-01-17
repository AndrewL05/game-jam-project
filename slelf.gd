extends Node3D  # Replace with the parent node type

func _ready():
	# Define a brown material
	var brown_material = StandardMaterial3D.new()
	brown_material.albedo_color = Color(0.6, 0.4, 0.2)  # Brown (R, G, B)

	# Loop through all child nodes
	for child in get_children():
		if child is MeshInstance3D:  # Check if the node is a MeshInstance3D
			child.set_surface_override_material(0, brown_material)
