/// @description 

event_inherited();


active = (water >= waterPerOperation and containerLightAmount(id) >= 9 and instanceof(outputSlot) == undefined);

if (!hasCrystal) {
	
}

//when supplied with sufficient minerals and light, consume minerals and progress
if active {
	if (countdown > 0) {
		countdown--;
	} else {
		countdown = ticksPerOperation;
		
		if (crystalProgress < growthComplete) {	//grow crystal
			crystalProgress++;
			
			water -= waterPerOperation;
			
			var brightestColorAmount = max(arrLight[lightColors.red], arrLight[lightColors.green], arrLight[lightColors.blue]);
	
			var redPercent = arrLight[lightColors.red] / brightestColorAmount;
			var greenPercent = arrLight[lightColors.green] / brightestColorAmount;
			var bluePercent = arrLight[lightColors.blue] / brightestColorAmount;
			
			crystalRed = lerp(crystalRed, redPercent*255, crystalProgress/growthComplete);
			crystalGreen = lerp(crystalGreen, greenPercent*255, crystalProgress/growthComplete);
			crystalBlue = lerp(crystalBlue, bluePercent*255, crystalProgress/growthComplete);
			
		} else {	//when crystal growth is complete, create crystal item
			crystalProgress = 0;
			
			outputSlot = new SCrystal(crystalRed, crystalGreen, crystalBlue, 1);
			print("made new item " + string(outputSlot));
			outputSlot = outputSlot.dropItem(x, y - GRID_SIZE);

			crystalRed = 0;
			crystalGreen = 0;
			crystalBlue = 0;
			
		}
	}
	countdown = max(0, countdown);	
}

