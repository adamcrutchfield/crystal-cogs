/// @description moveAndCollide()
function moveAndCollide() {
		
	hSpeed += hAcceleration * global.secondsPassed;
	vSpeed += vAcceleration * global.secondsPassed;
	hSpeed *= frictFloor;
	vSpeed *= frictAir;
		
	if (place_meeting(x + hSpeed, y, objSolid)) {
		while (!place_meeting(x + sign(hSpeed), y, objSolid)) x += sign (hSpeed);
		hSpeed = 0;
	}
	x += hSpeed;
		
	if (place_meeting(x, y + vSpeed, objSolid)) {
		while (!place_meeting(x, y + sign(vSpeed), objSolid)) y += sign (vSpeed);
		vSpeed = 0;
	}
	y += vSpeed;
		
	if (place_meeting(x, y, objSolid)) y--;
}