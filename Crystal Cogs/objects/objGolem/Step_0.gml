/// @description when occupied, move

var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var keyJump = keyboard_check_pressed(vk_space);

switch state {
	case golemStates.empty:
		moveAndCollide();
		break;
	case golemStates.hasSoul:
	
		var walkDirection = right - left;
		if (!left) && (right) scale = 1;
		if (left) && (!right) scale = -1;
	
		hAcceleration += walkDirection * moveSpeed;
		
		var jumpStrength = sqrt(2 * grav * jumpTarget) + grav / 2;
		
		if (place_meeting(x, y + 1, objSolid)) jumpBuffer = 5;
		if (keyJump and jumpBuffer > 0) {
			vAcceleration -= jumpStrength;
			jumpBuffer = 0;
		}
		jumpBuffer--;
		jumpBuffer = max(0, jumpBuffer);
	
		moveAndCollide();
		
		//keep soul contained
		while (objSoul.bbox_bottom >= bbox_bottom) objSoul.y--;
		while (objSoul.bbox_top <= bbox_top) objSoul.y++;
		while (objSoul.bbox_left <= bbox_left) objSoul.x++;
		while (objSoul.bbox_right >= bbox_right) objSoul.x--;
		
		if (y > room_height + GRID_SIZE) instance_destroy();
		
		break;
	default: break;
}