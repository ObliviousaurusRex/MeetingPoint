class MouseInterfacePlayerInput extends PlayerInput;

// Stored mouse position. Set to private write as we don't want other classes to modify it, but still allow other classes to access it.
var PrivateWrite IntPoint MousePosition; 

event PlayerInput(float DeltaTime)
{
  // Handle mouse 
  // Ensure we have a valid HUD
  if (myHUD != None) 
  {
    // Add the aMouseX to the mouse position and clamp it within the viewport width
    MousePosition.X = Clamp(MousePosition.X + aMouseX, 0, myHUD.SizeX); 
    // Add the aMouseY to the mouse position and clamp it within the viewport height
    MousePosition.Y = Clamp(MousePosition.Y - aMouseY, 0, myHUD.SizeY); 
  }

  Super.PlayerInput(DeltaTime);
}

defaultproperties
{
}