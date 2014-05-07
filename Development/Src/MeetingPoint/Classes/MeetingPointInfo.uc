class MeetingPointInfo extends UDKGame;

// Default pawn archetype to use
var const Pawn DefaultPawnArchetype;

static event class<GameInfo> SetGameType(string MapName, string Options, string Portal)
{
return Default.class;
}

function Pawn SpawnDefaultPawnFor(Controller NewPlayer, NavigationPoint StartSpot)
{
	local Rotator StartRotation;
	local MPReplicationInfo MPPRI;

	// Don't allow pawn to be spawned with any pitch or roll
	StartRotation.Yaw = StartSpot.Rotation.Yaw;

	// Check incoming variables
	if (NewPlayer != None)
	{
		// Grab the player replication info and check if the player has assigned a class archetype
		MPPRI = MPReplicationInfo(NewPlayer.PlayerReplicationInfo);
		if (MPPRI != None && MPPRI.ClassArchetype != None)
		{
			// Spawn and return the pawn
			return Spawn(MPPRI.ClassArchetype.PawnArchetype.Class,,, StartSpot.Location, StartRotation, MPPRI.ClassArchetype.PawnArchetype);
		}
	}

	// Abort if the default pawn archetype is none
	if (DefaultPawnArchetype == None)
	{
		return None;
	}
	// Spawn and return the pawn
	return Spawn(DefaultPawnArchetype.Class,,, StartSpot.Location, StartRotation, DefaultPawnArchetype);
}


defaultproperties
{
	DefaultPawnClass=class'MeetingPoint.MeetingPointPawn'
	// Set the player controller to the mouse interface Player Controller
    PlayerControllerClass=class'MeetingPoint.MeetingPointPlayerController'
	// Set the HUD type to the mouse interface HUD
	HUDType=class'MeetingPoint.MouseInterfaceHUD'
	//Set the PlayerReplicationInfoClass
	PlayerReplicationInfoClass=class'MeetingPoint.MPReplicationInfo'
	//Default Character
	DefaultPawnArchetype=MeetingPointPawn'MeetingPointCharacters_M.Archetype.MaleCasual'
	//DefaultPawnArchetype=MeetingPointPawn'MeetingPointCharacters_Male.Archetype.MaleArchetype';
	bDelayedStart = false
	bRestartLevel = false
}