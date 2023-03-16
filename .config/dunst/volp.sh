case $1 in
	up)
		# Increase the volume
		pactl set-sink-volume @DEFAULT_SINK@ +5%
		;;
	down)
		# Decrease the volume	
		pactl set-sink-volume @DEFAULT_SINK@ -5%
		;;
	mute)
		# Mute
		pactl set-sink-mute @DEFAULT_SINK@ toggle
		;;
esac

