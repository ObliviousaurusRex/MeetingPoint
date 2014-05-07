class MPReplicationInfo extends PlayerReplicationInfo;

// What class the player is
var ProtectedWrite CharClass ClassArchetype;

simulated function SetCurrentClass(CharClass NewClassArchetype)
{
	// Sync with the server if required
	if (Role < Role_Authority)
	{
		ServerSetCurrentClass(NewClassArchetype);
	}
	
	// Apply the current class
	//ApplyCurrentClass(NewClassArchetype);
}

protected reliable server function ServerSetCurrentClass(CharClass NewClassArchetype)
{
	// Ensure that the player does not select a null class
	if (NewClassArchetype == None || Role < Role_Authority)
	{
		return;
	}

	// Apply the current class
	// ApplyCurrentClass(NewClassArchetype);
}
DefaultProperties
{

}
