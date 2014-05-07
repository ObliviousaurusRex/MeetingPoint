class MeetingPointPawn extends UDKPawn
placeable;

// Skeletal mesh which represents the head. Parent skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent HeadSkeletalMesh;
// Skeletal mesh which represents the torso. Child to the head skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent TorsoSkeletalMesh;
// Skeletal mesh which represents the arms. Child to the head skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent ArmsSkeletalMesh;
// Skeletal mesh which represents the thighs. Child to the head skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent ThighsSkeletalMesh;
// Skeletal mesh which represents the boots. Child to the head skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent BootsSkeletalMesh;
// Skeletal mesh which represents the hair. Child to the head skeletal mesh component.
var(MeetingPointPawn) const SkeletalMeshComponent HairSkeletalMesh;


var float CamOffsetDistance; //distance to offset the camera from the player
var int IsoCamAngle; //pitch angle of the camera

//simulated function bool CalcCamera( float fDeltaTime, out vector out_CamLoc, out rotator out_CamRot, out float out_FOV )
//{
//   out_CamLoc = Location;
//   out_CamLoc.X -= Cos(IsoCamAngle * UnrRotToRad) * CamOffsetDistance;
//   out_CamLoc.Z += Sin(IsoCamAngle * UnrRotToRad) * CamOffsetDistance;

//   out_CamRot.Pitch = -1 * IsoCamAngle;   
//   out_CamRot.Yaw = 0;
//   out_CamRot.Roll = 0;

//   return true;
//}

/*simulated function bool CalcCamera(float FDeltaTime, out vector Out_CamLoc, out rotator Out_CamRot, out float Out_FOV)
{
Out_CamLoc = Location - (vector(Controller.Rotation)*80.0);
Out_CamRot = Controller.Rotation;
//Out_FOV = 90.0;

return true;
}*/


defaultproperties
{   
	IsoCamAngle=6420 //35.264 degrees
   CamOffsetDistance=384.0

	  Components.Remove(Sprite)
	//Components.Remove(WPawnSkeletalMeshComponent)

	Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		ModShadowFadeoutTime=0.25
		MinTimeBetweenFullUpdates=0.2
		AmbientGlow=(R=.01,G=.01,B=.01,A=1)
		AmbientShadowColor=(R=0.15,G=0.15,B=0.15)
		bSynthesizeSHLight=TRUE
	End Object
	Components.Add(MyLightEnvironment)
//begin object class=SkeletalMeshComponent name=PawnMesh
//SkeletalMesh=SkeletalMesh''
//end object
//Mesh=PawnMesh
//Components.Add(PawnMesh)

Begin Object Name=CollisionCylinder
CollisionRadius=20.0
CollisionHeight=31
End Object

  // Create the head skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=HeadSkeletalMeshComponent      
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    AnimTreeTemplate=AnimTree'MeetingPointCharacters_M.animation.Moving'
	PhysicsAsset=PhysicsAsset'MeetingPointCharacters_M.Physics.CharacterPhysicsAsset'
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20
	AnimSets(0)=AnimSet'MeetingPointCharacters_M.animation.AnimSet'
    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Set the animation node sequence so we can test the animation
    //Animations=AnimNodeSequence
  End Object
  HeadSkeletalMesh=HeadSkeletalMeshComponent
  Components.Add(HeadSkeletalMeshComponent)

  // Create the torso skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=TorsoSkeletalMeshComponent
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20

    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Assign the parent animation component to the head skeletal mesh component. This ensures that
    // the pawn animates as if it was one skeletal mesh component.
    ParentAnimComponent=HeadSkeletalMeshComponent
    // Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
    // the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
    ShadowParent=HeadSkeletalMeshComponent
  End Object
  TorsoSkeletalMesh=TorsoSkeletalMeshComponent
  Components.Add(TorsoSkeletalMeshComponent)

  // Create the arms skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=ArmsSkeletalMeshComponent
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20

    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Assign the parent animation component to the head skeletal mesh component. This ensures that
    // the pawn animates as if it was one skeletal mesh component.
    ParentAnimComponent=HeadSkeletalMeshComponent
    // Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
    // the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
    ShadowParent=HeadSkeletalMeshComponent
  End Object
  ArmsSkeletalMesh=ArmsSkeletalMeshComponent
  Components.Add(ArmsSkeletalMeshComponent)

  // Create the thighs skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=ThighsSkeletalMeshComponent
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20

    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Assign the parent animation component to the head skeletal mesh component. This ensures that
    // the pawn animates as if it was one skeletal mesh component.
    ParentAnimComponent=HeadSkeletalMeshComponent
    // Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
    // the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
    ShadowParent=HeadSkeletalMeshComponent
  End Object
  ThighsSkeletalMesh=ThighsSkeletalMeshComponent
  Components.Add(ThighsSkeletalMeshComponent)

  // Create the boots skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=BootsSkeletalMeshComponent
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20

    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Assign the parent animation component to the head skeletal mesh component. This ensures that
    // the pawn animates as if it was one skeletal mesh component.
    ParentAnimComponent=HeadSkeletalMeshComponent
    // Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
    // the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
    ShadowParent=HeadSkeletalMeshComponent
  End Object
  BootsSkeletalMesh=BootsSkeletalMeshComponent
  Components.Add(BootsSkeletalMeshComponent)

	// Create the hair skeletal mesh component
  Begin Object Class=SkeletalMeshComponent Name=HairSkeletalMeshComponent
    bCacheAnimSequenceNodes=false
    AlwaysLoadOnClient=true
    AlwaysLoadOnServer=true
    bOwnerNoSee=false
    CastShadow=true
    BlockRigidBody=true
    bUpdateSkelWhenNotRendered=false
    bIgnoreControllersWhenNotRendered=true
    bUpdateKinematicBonesFromAnimation=true
    bCastDynamicShadow=true
    RBChannel=RBCC_Untitled3
    RBCollideWithChannels=(Untitled3=true)
    LightEnvironment=MyLightEnvironment
    bOverrideAttachmentOwnerVisibility=true
    bAcceptsDynamicDecals=false
    bHasPhysicsAssetInstance=true
    TickGroup=TG_PreAsyncWork
    MinDistFactorForKinematicUpdate=0.2
    bChartDistanceFactor=true
    RBDominanceGroup=20

    bUseOnePassLightingOnTranslucency=true
    bPerBoneMotionBlur=true
    // Assign the parent animation component to the head skeletal mesh component. This ensures that
    // the pawn animates as if it was one skeletal mesh component.
    ParentAnimComponent=HeadSkeletalMeshComponent
    // Assign the shadow parent component to the head skeletal mesh component. This is used to speed up
    // the rendering of the shadow for this pawn and to prevent shadow overlaps from occur.
    ShadowParent=HeadSkeletalMeshComponent
  End Object
  HairSkeletalMesh=HairSkeletalMeshComponent
  Components.Add(HairSkeletalMeshComponent)
  
	GroundSpeed=160.0
}