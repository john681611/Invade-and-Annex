addMissionEventHandler ["PreloadFinished", {preloadFinished = true;}];
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
[player, supportRequester] call BIS_fnc_addSupportLink;
[] spawn IA_fnc_runMarker;
[] execVM "Client\earplugs.sqf";


player createDiarySubject ["rules", "Rules"];
player createDiaryRecord ["rules", ["General", "
<br/>This is a short summary of the rules.  The full rules can be found <execute expression='call rules'>here</execute>.
<br/>Or alternatively at: https://www.iron-fists.co.uk/#rules
<br/>But the first link is always up to date while the second might not be
<br/>
<br/>
<br/>Short summary of the rules:
<br/>
<br/>-Iron Fists is a welcoming community that respects its members and visitors. We expect everyone to maintain this environment and will take action against those who jeopardise that community spirit. Admins reserve the right to warn/kick/ban users whose behaviour is deemed disruptive or aggressive and not conducive to a place of tolerance/friendship/comradery. Whether the behaviour is disruptive or not will be determined on a case-by-case basis on the judgment of the admin/admins present.
<br/>
<br/>-Racism or hate speech of any kind is not tolerated.
<br/>
<br/>-Do not intentionally kill another player on your side.  If you accidently teamkill someone, apologize immediately.
<br/>
<br/>-Play the mission as intended.
<br/>
<br/>-Consider your skill as a pilot before taking a Pilot slot.
<br/>    -The primary role of a pilot is to provide logistical support to the infantry on the ground.  Examples of logistical support are: transporting people, ammo, fuel, vehicles, …
<br/>    -In case of poor ability, a pilot may be asked to leave the slot.
<br/>
<br/>-Play your role.
<br/>    -If you are operating a support asset like a mortar or a CAS plane/helicopter you are not allowed to kill the entire AO.  Support assets are there to support the infantry this means that infantry must call these support assets in.
<br/>
<br/>-Do not waste assets.
<br/>
<br/>-Respect game immersion.
<br/>    -Refrain from spamming the side global and command chats.  Ask yourself if what you have to say is useful information for everyone.  It might be more sensible to use group, vehicle or direct chat.
<br/>    -Do not talk in global, side and command channels.  Use group, vehicle and direct chat for voice communications.
<br/>    -Playing music in global, side, command and group channels is forbidden.  You may play music in direct and vehicle channels, unless another player asks you not to.
<br/>
<br/>-Trolling in any way will be dealt with swiftly and harshly.
<br/>
<br/>-Being AFK for prolonged periods of time in the server is not acceptable.
<br/>
<br/>Upon entering an AhoyWorld invade and annex server you agree to abide by the following rules.  Any breaking of the rules can result in sanction being applied by a member of staff.  These sanctions can include, but are not limited to, warning, in-game punishment, kicking, temporary ban and permanent ban.  Which action should be taken will be determined on a case-by-case basis by the staff member(s) present at the time and left to the discretion of this/these member(s) of staff.
"]];

player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiaryRecord ["teamspeak", ["TS3", "
<br/> You can download Teamspeak here:<br/>
<br/> http://www.teamspeak.com/?page=downloads
<br/>
"]];
player createDiaryRecord ["teamspeak", ["IRON FISTS", "
<br/> Teamspeak IP-address for the INF server:
<br/> ts3.iron-fists.co.uk
<br/>
<br/> Visitors and guests welcome!
"]];

player createDiarySubject ["Settings & Keybinds", "Settings & Keybinds"];
player createDiaryRecord ["Settings & Keybinds", ["Settings & Keybinds", "
<br/>Click <execute expression = '[] spawn CHVD_fnc_openDialog;'>View Distance Settings.</execute>
<br/>Click <execute expression = '[] call outlw_MR_createDialog;'>Mag Repack</execute> (Ctrl+R)
<br/>Click <execute expression = '[] call toggle_earplugs;'>Toggle Earplugs</execute> (Pause/Break)
"]];
