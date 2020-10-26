state("AkibaUU")
{
    /*
	 * gameState
	 * 0 menu, video, credits
     * 1 loading
     * 2 open world
     * 3 cut-scene, mission, dialog
	*/
    int gameState: "AkibaUU.exe", 0x4929E8;

    /*
	 * completedMissions
	 * each main and side mission
	*/
    int completedMissions: "AkibaUU.exe", 0x4B272C;
}

update
{
    print("Current State: " + current.gameState);
    print("Current Mission: " + current.completedMissions);

}

split {
    // Split each mission (including side missions)
    return current.completedMissions != old.completedMissions;
}

isLoading
{
    if (current.gameState == 1)
    {
        return true;
    }
    return false;
}