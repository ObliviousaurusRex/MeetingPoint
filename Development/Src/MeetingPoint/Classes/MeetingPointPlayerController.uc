class MeetingPointPlayerController extends PlayerController;

exec function ZoomIn() 
{
	if (GamePlayerCamera(PlayerCamera).CameraStyle == 'FreeCam_Default') 
	{
		if (PlayerCamera.FreeCamDistance > 32)
		{
			PlayerCamera.FreeCamDistance -= (PlayerCamera.FreeCamDistance/8); 
		}
	}
	else
	{
		if (PlayerCamera.DefaultFOV > 30)
		{
			PlayerCamera.DefaultFOV -= (PlayerCamera.DefaultFOV/8);
		}
	}
}

exec function ZoomOut() 
{
	if (GamePlayerCamera(PlayerCamera).CameraStyle == 'FreeCam_Default') 
	{
		if (PlayerCamera.FreeCamDistance < 512)
		{
			PlayerCamera.FreeCamDistance += (PlayerCamera.FreeCamDistance/8); 
		}
	}
	else
	{
		if (PlayerCamera.DefaultFOV < 120)
		{
			PlayerCamera.DefaultFOV += (PlayerCamera.DefaultFOV/8);
		}
	}
}

exec function ToggleCam()
{
	if(GamePlayerCamera(PlayerCamera).CameraStyle == 'FreeCam_Default')
	{
		GamePlayerCamera(PlayerCamera).CameraStyle = 'FirstPerson';
		HideMesh(true);
	}
	else
	{
		GamePlayerCamera(PlayerCamera).CameraStyle = 'FreeCam_Default';
		HideMesh(false);
	}
}

function HideMesh(bool meshVisible) 
{
	Pawn.Mesh.SetOwnerNoSee(meshVisible);
}

state PlayerWalking
{
	function PlayerMove( float DeltaTime )
	{
		local vector			X,Y,Z, NewAccel;
		local eDoubleClickDir	DoubleClickMove;
		local rotator			OldRotation;
		local bool				bSaveJump;


		local rotator tempRot;

		tempRot.Pitch = Pawn.Rotation.Pitch;
		tempRot.Roll = 0;

		if(PlayerInput.RawJoyUp > 0.0)
		{
			tempRot.Yaw = PlayerCamera.Rotation.Yaw + 16384* PlayerInput.RawJoyRight;
			Pawn.SetRotation(tempRot);
		}
		if(PlayerInput.RawJoyUp < 0.0)
		{
			tempRot.Yaw = PlayerCamera.Rotation.Yaw + 32768 - 16384* PlayerInput.RawJoyRight;
			Pawn.SetRotation(tempRot);
		}
		if(PlayerInput.RawJoyUp == 0.0)
		{
			if(PlayerInput.RawJoyRight > 0.0)
			{
				tempRot.Yaw = PlayerCamera.Rotation.Yaw + 16384;
				Pawn.SetRotation(tempRot);
			}
			if(PlayerInput.RawJoyRight < 0.0)
			{
				tempRot.Yaw = PlayerCamera.Rotation.Yaw - 16384;
				Pawn.SetRotation(tempRot);
			}
		}


		if( Pawn == None )
		{
			GotoState('Dead');
		}
		else
		{
			GetAxes(PlayerCamera.Rotation,X,Y,Z); //By default this is Pawn instead of PlayerCamera

			// Update acceleration.
			NewAccel = PlayerInput.aForward*X + PlayerInput.aStrafe*Y;
			NewAccel.Z	= 0;
			NewAccel = Pawn.AccelRate * Normal(NewAccel);

			DoubleClickMove = PlayerInput.CheckForDoubleClickMove( DeltaTime/WorldInfo.TimeDilation );

			// Update rotation.
			OldRotation = Rotation;
			UpdateRotation( DeltaTime );
			bDoubleJump = false;

			if( bPressedJump && Pawn.CannotJumpNow() )
			{
				bSaveJump = true;
				bPressedJump = false;
			}
			else
			{
				bSaveJump = false;
			}

			if( Role < ROLE_Authority ) // then save this move and replicate it
			{
				ReplicateMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
			}
			else
			{
				ProcessMove(DeltaTime, NewAccel, DoubleClickMove, OldRotation - Rotation);
			}
			bPressedJump = bSaveJump;
		}
	}
}


defaultproperties
{
	//Set the Camera Class.
	CameraClass = class 'GameFramework.GamePlayerCamera'
	// Set the input class to the mouse interface player input.
	InputClass=class'MouseInterfacePlayerInput'
}