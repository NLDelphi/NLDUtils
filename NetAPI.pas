{ *************************************************************************** }
{                                                                             }
{ NetAPI  -  www.nldelphi.com Open Source Delphi runtime library              }
{                                                                             }
{ Initiator: Albert de Weerd (aka NGLN)                                       }
{ License: Free to use, free to modify                                        }
{ Website: http://www.nldelphi.com/forum/showthread.php?t=35215               }
{ SVN path: http://svn.nldelphi.com/nldelphi/opensource/ngln/                 }
{                                                                             }
{ *************************************************************************** }
{                                                                             }
{ Last edit by: Albert de Weerd                                               }
{ Date: January 10, 2010                                                      }
{ Version: 1.0.0.0                                                            }
{                                                                             }
{ *************************************************************************** }

unit NetAPI;

{$BOOLEVAL OFF}

interface

uses
  Windows, Classes, StrUtils, SysUtils;

const
  netapi32  = 'netapi32.dll';

  NERR_Success                      = 0;
  {$EXTERNALSYM NERR_Success}
  NERR_NetNotStarted                = 2102;
  {$EXTERNALSYM NERR_NetNotStarted}
  NERR_UnknownServer                = 2103;
  {$EXTERNALSYM NERR_UnknownServer}
  NERR_ShareMem                     = 2104;
  {$EXTERNALSYM NERR_ShareMem}
  NERR_NoNetworkResource            = 2105;
  {$EXTERNALSYM NERR_NoNetworkResource}
  NERR_RemoteOnly                   = 2106;
  {$EXTERNALSYM NERR_RemoteOnly}
  NERR_DevNotRedirected             = 2107;
  {$EXTERNALSYM NERR_DevNotRedirected}
  NERR_ServerNotStarted             = 2114;
  {$EXTERNALSYM NERR_ServerNotStarted}
  NERR_ItemNotFound                 = 2115;
  {$EXTERNALSYM NERR_ItemNotFound}
  NERR_UnknownDevDir                = 2116;
  {$EXTERNALSYM NERR_UnknownDevDir}
  NERR_RedirectedPath               = 2117;
  {$EXTERNALSYM NERR_RedirectedPath}
  NERR_DuplicateShare               = 2118;
  {$EXTERNALSYM NERR_DuplicateShare}
  NERR_NoRoom                       = 2119;
  {$EXTERNALSYM NERR_NoRoom}
  NERR_TooManyItems                 = 2121;
  {$EXTERNALSYM NERR_TooManyItems}
  NERR_InvalidMaxUsers              = 2122;
  {$EXTERNALSYM NERR_InvalidMaxUsers}
  NERR_BufTooSmall                  = 2123;
  {$EXTERNALSYM NERR_BufTooSmall}
  NERR_RemoteErr                    = 2127;
  {$EXTERNALSYM NERR_RemoteErr}
  NERR_LanmanIniError               = 2131;
  {$EXTERNALSYM NERR_LanmanIniError}
  NERR_NetworkError                 = 2136;
  {$EXTERNALSYM NERR_NetworkError}
  NERR_WkstaInconsistentState       = 2137;
  {$EXTERNALSYM NERR_WkstaInconsistentState}
  NERR_WkstaNotStarted              = 2138;
  {$EXTERNALSYM NERR_WkstaNotStarted}
  NERR_BrowserNotStarted            = 2139;
  {$EXTERNALSYM NERR_BrowserNotStarted}
  NERR_InternalError                = 2140;
  {$EXTERNALSYM NERR_InternalError}
  NERR_BadTransactConfig            = 2141;
  {$EXTERNALSYM NERR_BadTransactConfig}
  NERR_InvalidAPI                   = 2142;
  {$EXTERNALSYM NERR_InvalidAPI}
  NERR_BadEventName                 = 2143;
  {$EXTERNALSYM NERR_BadEventName}
  NERR_DupNameReboot                = 2144;
  {$EXTERNALSYM NERR_DupNameReboot}
  NERR_CfgCompNotFound              = 2146;
  {$EXTERNALSYM NERR_CfgCompNotFound}
  NERR_CfgParamNotFound             = 2147;
  {$EXTERNALSYM NERR_CfgParamNotFound}
  NERR_LineTooLong                  = 2149;
  {$EXTERNALSYM NERR_LineTooLong}
  NERR_QNotFound                    = 2150;
  {$EXTERNALSYM NERR_QNotFound}
  NERR_JobNotFound                  = 2151;
  {$EXTERNALSYM NERR_JobNotFound}
  NERR_DestNotFound                 = 2152;
  {$EXTERNALSYM NERR_DestNotFound}
  NERR_DestExists                   = 2153;
  {$EXTERNALSYM NERR_DestExists}
  NERR_QExists                      = 2154;
  {$EXTERNALSYM NERR_QExists}
  NERR_QNoRoom                      = 2155;
  {$EXTERNALSYM NERR_QNoRoom}
  NERR_JobNoRoom                    = 2156;
  {$EXTERNALSYM NERR_JobNoRoom}
  NERR_DestNoRoom                   = 2157;
  {$EXTERNALSYM NERR_DestNoRoom}
  NERR_DestIdle                     = 2158;
  {$EXTERNALSYM NERR_DestIdle}
  NERR_DestInvalidOp                = 2159;
  {$EXTERNALSYM NERR_DestInvalidOp}
  NERR_ProcNoRespond                = 2160;
  {$EXTERNALSYM NERR_ProcNoRespond}
  NERR_SpoolerNotLoaded             = 2161;
  {$EXTERNALSYM NERR_SpoolerNotLoaded}
  NERR_DestInvalidState             = 2162;
  {$EXTERNALSYM NERR_DestInvalidState}
  NERR_QinvalidState                = 2163;
  {$EXTERNALSYM NERR_QinvalidState}
  NERR_JobInvalidState              = 2164;
  {$EXTERNALSYM NERR_JobInvalidState}
  NERR_SpoolNoMemory                = 2165;
  {$EXTERNALSYM NERR_SpoolNoMemory}
  NERR_DriverNotFound               = 2166;
  {$EXTERNALSYM NERR_DriverNotFound}
  NERR_DataTypeInvalid              = 2167;
  {$EXTERNALSYM NERR_DataTypeInvalid}
  NERR_ProcNotFound                 = 2168;
  {$EXTERNALSYM NERR_ProcNotFound}
  NERR_ServiceTableLocked           = 2180;
  {$EXTERNALSYM NERR_ServiceTableLocked}
  NERR_ServiceTableFull             = 2181;
  {$EXTERNALSYM NERR_ServiceTableFull}
  NERR_ServiceInstalled             = 2182;
  {$EXTERNALSYM NERR_ServiceInstalled}
  NERR_ServiceEntryLocked           = 2183;
  {$EXTERNALSYM NERR_ServiceEntryLocked}
  NERR_ServiceNotInstalled          = 2184;
  {$EXTERNALSYM NERR_ServiceNotInstalled}
  NERR_BadServiceName               = 2185;
  {$EXTERNALSYM NERR_BadServiceName}
  NERR_ServiceCtlTimeout            = 2186;
  {$EXTERNALSYM NERR_ServiceCtlTimeout}
  NERR_ServiceCtlBusy               = 2187;
  {$EXTERNALSYM NERR_ServiceCtlBusy}
  NERR_BadServiceProgName           = 2188;
  {$EXTERNALSYM NERR_BadServiceProgName}
  NERR_ServiceNotCtrl               = 2189;
  {$EXTERNALSYM NERR_ServiceNotCtrl}
  NERR_ServiceKillProc              = 2190;
  {$EXTERNALSYM NERR_ServiceKillProc}
  NERR_ServiceCtlNotValid           = 2191;
  {$EXTERNALSYM NERR_ServiceCtlNotValid}
  NERR_NotInDispatchTbl             = 2192;
  {$EXTERNALSYM NERR_NotInDispatchTbl}
  NERR_BadControlRecv               = 2193;
  {$EXTERNALSYM NERR_BadControlRecv}
  NERR_ServiceNotStarting           = 2194;
  {$EXTERNALSYM NERR_ServiceNotStarting}
  NERR_AlreadyLoggedOn              = 2200;
  {$EXTERNALSYM NERR_AlreadyLoggedOn}
  NERR_NotLoggedOn                  = 2201;
  {$EXTERNALSYM NERR_NotLoggedOn}
  NERR_BadUsername                  = 2202;
  {$EXTERNALSYM NERR_BadUsername}
  NERR_BadPassword                  = 2203;
  {$EXTERNALSYM NERR_BadPassword}
  NERR_UnableToAddName_W            = 2204;
  {$EXTERNALSYM NERR_UnableToAddName_W}
  NERR_UnableToAddName_F            = 2205;
  {$EXTERNALSYM NERR_UnableToAddName_F}
  NERR_UnableToDelName_W            = 2206;
  {$EXTERNALSYM NERR_UnableToDelName_W}
  NERR_UnableToDelName_F            = 2207;
  {$EXTERNALSYM NERR_UnableToDelName_F}
  NERR_LogonsPaused                 = 2209;
  {$EXTERNALSYM NERR_LogonsPaused}
  NERR_LogonServerConflict          = 2210;
  {$EXTERNALSYM NERR_LogonServerConflict}
  NERR_LogonNoUserPath              = 2211;
  {$EXTERNALSYM NERR_LogonNoUserPath}
  NERR_LogonScriptError             = 2212;
  {$EXTERNALSYM NERR_LogonScriptError}
  NERR_StandaloneLogon              = 2214;
  {$EXTERNALSYM NERR_StandaloneLogon}
  NERR_LogonServerNotFound          = 2215;
  {$EXTERNALSYM NERR_LogonServerNotFound}
  NERR_LogonDomainExists            = 2216;
  {$EXTERNALSYM NERR_LogonDomainExists}
  NERR_NonValidatedLogon            = 2217;
  {$EXTERNALSYM NERR_NonValidatedLogon}
  NERR_ACFNotFound                  = 2219;
  {$EXTERNALSYM NERR_ACFNotFound}
  NERR_GroupNotFound                = 2220;
  {$EXTERNALSYM NERR_GroupNotFound}
  NERR_UserNotFound                 = 2221;
  {$EXTERNALSYM NERR_UserNotFound}
  NERR_ResourceNotFound             = 2222;
  {$EXTERNALSYM NERR_ResourceNotFound}
  NERR_GroupExists                  = 2223;
  {$EXTERNALSYM NERR_GroupExists}
  NERR_UserExists                   = 2224;
  {$EXTERNALSYM NERR_UserExists}
  NERR_ResourceExists               = 2225;
  {$EXTERNALSYM NERR_ResourceExists}
  NERR_NotPrimary                   = 2226;
  {$EXTERNALSYM NERR_NotPrimary}
  NERR_ACFNotLoaded                 = 2227;
  {$EXTERNALSYM NERR_ACFNotLoaded}
  NERR_ACFNoRoom                    = 2228;
  {$EXTERNALSYM NERR_ACFNoRoom}
  NERR_ACFFileIOFail                = 2229;
  {$EXTERNALSYM NERR_ACFFileIOFail}
  NERR_ACFTooManyLists              = 2230;
  {$EXTERNALSYM NERR_ACFTooManyLists}
  NERR_UserLogon                    = 2231;
  {$EXTERNALSYM NERR_UserLogon}
  NERR_ACFNoParent                  = 2232;
  {$EXTERNALSYM NERR_ACFNoParent}
  NERR_CanNotGrowSegment            = 2233;
  {$EXTERNALSYM NERR_CanNotGrowSegment}
  NERR_SpeGroupOp                   = 2234;
  {$EXTERNALSYM NERR_SpeGroupOp}
  NERR_NotInCache                   = 2235;
  {$EXTERNALSYM NERR_NotInCache}
  NERR_UserInGroup                  = 2236;
  {$EXTERNALSYM NERR_UserInGroup}
  NERR_UserNotInGroup               = 2237;
  {$EXTERNALSYM NERR_UserNotInGroup}
  NERR_AccountUndefined             = 2238;
  {$EXTERNALSYM NERR_AccountUndefined}
  NERR_AccountExpired               = 2239;
  {$EXTERNALSYM NERR_AccountExpired}
  NERR_InvalidWorkstation           = 2240;
  {$EXTERNALSYM NERR_InvalidWorkstation}
  NERR_InvalidLogonHours            = 2241;
  {$EXTERNALSYM NERR_InvalidLogonHours}
  NERR_PasswordExpired              = 2242;
  {$EXTERNALSYM NERR_PasswordExpired}
  NERR_PasswordCantChange           = 2243;
  {$EXTERNALSYM NERR_PasswordCantChange}
  NERR_PasswordHistConflict         = 2244;
  {$EXTERNALSYM NERR_PasswordHistConflict}
  NERR_PasswordTooShort             = 2245;
  {$EXTERNALSYM NERR_PasswordTooShort}
  NERR_PasswordTooRecent            = 2246;
  {$EXTERNALSYM NERR_PasswordTooRecent}
  NERR_InvalidDatabase              = 2247;
  {$EXTERNALSYM NERR_InvalidDatabase}
  NERR_DatabaseUpToDate             = 2248;
  {$EXTERNALSYM NERR_DatabaseUpToDate}
  NERR_SyncRequired                 = 2249;
  {$EXTERNALSYM NERR_SyncRequired}
  NERR_UseNotFound                  = 2250;
  {$EXTERNALSYM NERR_UseNotFound}
  NERR_BadAsgType                   = 2251;
  {$EXTERNALSYM NERR_BadAsgType}
  NERR_DeviceIsShared               = 2252;
  {$EXTERNALSYM NERR_DeviceIsShared}
  NERR_NoComputerName               = 2270;
  {$EXTERNALSYM NERR_NoComputerName}
  NERR_MsgAlreadyStarted            = 2271;
  {$EXTERNALSYM NERR_MsgAlreadyStarted}
  NERR_MsgInitFailed                = 2272;
  {$EXTERNALSYM NERR_MsgInitFailed}
  NERR_NameNotFound                 = 2273;
  {$EXTERNALSYM NERR_NameNotFound}
  NERR_AlreadyForwarded             = 2274;
  {$EXTERNALSYM NERR_AlreadyForwarded}
  NERR_AddForwarded                 = 2275;
  {$EXTERNALSYM NERR_AddForwarded}
  NERR_AlreadyExists                = 2276;
  {$EXTERNALSYM NERR_AlreadyExists}
  NERR_TooManyNames                 = 2277;
  {$EXTERNALSYM NERR_TooManyNames}
  NERR_DelComputerName              = 2278;
  {$EXTERNALSYM NERR_DelComputerName}
  NERR_LocalForward                 = 2279;
  {$EXTERNALSYM NERR_LocalForward}
  NERR_GrpMsgProcessor              = 2280;
  {$EXTERNALSYM NERR_GrpMsgProcessor}
  NERR_PausedRemote                 = 2281;
  {$EXTERNALSYM NERR_PausedRemote}
  NERR_BadReceive                   = 2282;
  {$EXTERNALSYM NERR_BadReceive}
  NERR_NameInUse                    = 2283;
  {$EXTERNALSYM NERR_NameInUse}
  NERR_MsgNotStarted                = 2284;
  {$EXTERNALSYM NERR_MsgNotStarted}
  NERR_NotLocalName                 = 2285;
  {$EXTERNALSYM NERR_NotLocalName}
  NERR_NoForwardName                = 2286;
  {$EXTERNALSYM NERR_NoForwardName}
  NERR_RemoteFull                   = 2287;
  {$EXTERNALSYM NERR_RemoteFull}
  NERR_NameNotForwarded             = 2288;
  {$EXTERNALSYM NERR_NameNotForwarded}
  NERR_TruncatedBroadcast           = 2289;
  {$EXTERNALSYM NERR_TruncatedBroadcast}
  NERR_InvalidDevice                = 2294;
  {$EXTERNALSYM NERR_InvalidDevice}
  NERR_WriteFault                   = 2295;
  {$EXTERNALSYM NERR_WriteFault}
  NERR_DuplicateName                = 2297;
  {$EXTERNALSYM NERR_DuplicateName}
  NERR_DeleteLater                  = 2298;
  {$EXTERNALSYM NERR_DeleteLater}
  NERR_IncompleteDel                = 2299;
  {$EXTERNALSYM NERR_IncompleteDel}
  NERR_MultipleNets                 = 2300;
  {$EXTERNALSYM NERR_MultipleNets}
  NERR_NetNameNotFound              = 2310;
  {$EXTERNALSYM NERR_NetNameNotFound}
  NERR_DeviceNotShared              = 2311;
  {$EXTERNALSYM NERR_DeviceNotShared}
  NERR_ClientNameNotFound           = 2312;
  {$EXTERNALSYM NERR_ClientNameNotFound}
  NERR_FileIdNotFound               = 2314;
  {$EXTERNALSYM NERR_FileIdNotFound}
  NERR_ExecFailure                  = 2315;
  {$EXTERNALSYM NERR_ExecFailure}
  NERR_TmpFile                      = 2316;
  {$EXTERNALSYM NERR_TmpFile}
  NERR_TooMuchData                  = 2317;
  {$EXTERNALSYM NERR_TooMuchData}
  NERR_DeviceShareConflict          = 2318;
  {$EXTERNALSYM NERR_DeviceShareConflict}
  NERR_BrowserTableIncomplete       = 2319;
  {$EXTERNALSYM NERR_BrowserTableIncomplete}
  NERR_NotLocalDomain               = 2320;
  {$EXTERNALSYM NERR_NotLocalDomain}
  NERR_IsDfsShare                   = 2321;
  {$EXTERNALSYM NERR_IsDfsShare}
  NERR_DevInvalidOpCode             = 2331;
  {$EXTERNALSYM NERR_DevInvalidOpCode}
  NERR_DevNotFound                  = 2332;
  {$EXTERNALSYM NERR_DevNotFound}
  NERR_DevNotOpen                   = 2333;
  {$EXTERNALSYM NERR_DevNotOpen}
  NERR_BadQueueDevString            = 2334;
  {$EXTERNALSYM NERR_BadQueueDevString}
  NERR_BadQueuePriority             = 2335;
  {$EXTERNALSYM NERR_BadQueuePriority}
  NERR_NoCommDevs                   = 2337;
  {$EXTERNALSYM NERR_NoCommDevs}
  NERR_QueueNotFound                = 2338;
  {$EXTERNALSYM NERR_QueueNotFound}
  NERR_BadDevString                 = 2340;
  {$EXTERNALSYM NERR_BadDevString}
  NERR_BadDev                       = 2341;
  {$EXTERNALSYM NERR_BadDev}
  NERR_InUseBySpooler               = 2342;
  {$EXTERNALSYM NERR_InUseBySpooler}
  NERR_CommDevInUse                 = 2343;
  {$EXTERNALSYM NERR_CommDevInUse}
  NERR_InvalidComputer              = 2351;
  {$EXTERNALSYM NERR_InvalidComputer}
  NERR_MaxLenExceeded               = 2354;
  {$EXTERNALSYM NERR_MaxLenExceeded}
  NERR_BadComponent                 = 2356;
  {$EXTERNALSYM NERR_BadComponent}
  NERR_CantType                     = 2357;
  {$EXTERNALSYM NERR_CantType}
  NERR_TooManyEntries               = 2362;
  {$EXTERNALSYM NERR_TooManyEntries}
  NERR_ProfileFileTooBig            = 2370;
  {$EXTERNALSYM NERR_ProfileFileTooBig}
  NERR_ProfileOffset                = 2371;
  {$EXTERNALSYM NERR_ProfileOffset}
  NERR_ProfileCleanup               = 2372;
  {$EXTERNALSYM NERR_ProfileCleanup}
  NERR_ProfileUnknownCmd            = 2373;
  {$EXTERNALSYM NERR_ProfileUnknownCmd}
  NERR_ProfileLoadErr               = 2374;
  {$EXTERNALSYM NERR_ProfileLoadErr}
  NERR_ProfileSaveErr               = 2375;
  {$EXTERNALSYM NERR_ProfileSaveErr}
  NERR_LogOverflow                  = 2377;
  {$EXTERNALSYM NERR_LogOverflow}
  NERR_LogFileChanged               = 2378;
  {$EXTERNALSYM NERR_LogFileChanged}
  NERR_LogFileCorrupt               = 2379;
  {$EXTERNALSYM NERR_LogFileCorrupt}
  NERR_SourceIsDir                  = 2380;
  {$EXTERNALSYM NERR_SourceIsDir}
  NERR_BadSource                    = 2381;
  {$EXTERNALSYM NERR_BadSource}
  NERR_BadDest                      = 2382;
  {$EXTERNALSYM NERR_BadDest}
  NERR_DifferentServers             = 2383;
  {$EXTERNALSYM NERR_DifferentServers}
  NERR_RunSrvPaused                 = 2385;
  {$EXTERNALSYM NERR_RunSrvPaused}
  NERR_ErrCommRunSrv                = 2389;
  {$EXTERNALSYM NERR_ErrCommRunSrv}
  NERR_ErrorExecingGhost            = 2391;
  {$EXTERNALSYM NERR_ErrorExecingGhost}
  NERR_ShareNotFound                = 2392;
  {$EXTERNALSYM NERR_ShareNotFound}
  NERR_InvalidLana                  = 2400;
  {$EXTERNALSYM NERR_InvalidLana}
  NERR_OpenFiles                    = 2401;
  {$EXTERNALSYM NERR_OpenFiles}
  NERR_ActiveConns                  = 2402;
  {$EXTERNALSYM NERR_ActiveConns}
  NERR_BadPasswordCore              = 2403;
  {$EXTERNALSYM NERR_BadPasswordCore}
  NERR_DevInUse                     = 2404;
  {$EXTERNALSYM NERR_DevInUse}
  NERR_LocalDrive                   = 2405;
  {$EXTERNALSYM NERR_LocalDrive}
  NERR_AlertExists                  = 2430;
  {$EXTERNALSYM NERR_AlertExists}
  NERR_TooManyAlerts                = 2431;
  {$EXTERNALSYM NERR_TooManyAlerts}
  NERR_NoSuchAlert                  = 2432;
  {$EXTERNALSYM NERR_NoSuchAlert}
  NERR_BadRecipient                 = 2433;
  {$EXTERNALSYM NERR_BadRecipient}
  NERR_AcctLimitExceeded            = 2434;
  {$EXTERNALSYM NERR_AcctLimitExceeded}
  NERR_InvalidLogSeek               = 2440;
  {$EXTERNALSYM NERR_InvalidLogSeek}
  NERR_BadUasConfig                 = 2450;
  {$EXTERNALSYM NERR_BadUasConfig}
  NERR_InvalidUASOp                 = 2451;
  {$EXTERNALSYM NERR_InvalidUASOp}
  NERR_LastAdmin                    = 2452;
  {$EXTERNALSYM NERR_LastAdmin}
  NERR_DCNotFound                   = 2453;
  {$EXTERNALSYM NERR_DCNotFound}
  NERR_LogonTrackingError           = 2454;
  {$EXTERNALSYM NERR_LogonTrackingError}
  NERR_NetlogonNotStarted           = 2455;
  {$EXTERNALSYM NERR_NetlogonNotStarted}
  NERR_CanNotGrowUASFile            = 2456;
  {$EXTERNALSYM NERR_CanNotGrowUASFile}
  NERR_TimeDiffAtDC                 = 2457;
  {$EXTERNALSYM NERR_TimeDiffAtDC}
  NERR_PasswordMismatch             = 2458;
  {$EXTERNALSYM NERR_PasswordMismatch}
  NERR_NoSuchServer                 = 2460;
  {$EXTERNALSYM NERR_NoSuchServer}
  NERR_NoSuchSession                = 2461;
  {$EXTERNALSYM NERR_NoSuchSession}
  NERR_NoSuchConnection             = 2462;
  {$EXTERNALSYM NERR_NoSuchConnection}
  NERR_TooManyServers               = 2463;
  {$EXTERNALSYM NERR_TooManyServers}
  NERR_TooManySessions              = 2464;
  {$EXTERNALSYM NERR_TooManySessions}
  NERR_TooManyConnections           = 2465;
  {$EXTERNALSYM NERR_TooManyConnections}
  NERR_TooManyFiles                 = 2466;
  {$EXTERNALSYM NERR_TooManyFiles}
  NERR_NoAlternateServers           = 2467;
  {$EXTERNALSYM NERR_NoAlternateServers}
  NERR_TryDownLevel                 = 2470;
  {$EXTERNALSYM NERR_TryDownLevel}
  NERR_UPSDriverNotStarted          = 2480;
  {$EXTERNALSYM NERR_UPSDriverNotStarted}
  NERR_UPSInvalidConfig             = 2481;
  {$EXTERNALSYM NERR_UPSInvalidConfig}
  NERR_UPSInvalidCommPort           = 2482;
  {$EXTERNALSYM NERR_UPSInvalidCommPort}
  NERR_UPSSignalAsserted            = 2483;
  {$EXTERNALSYM NERR_UPSSignalAsserted}
  NERR_UPSShutdownFailed            = 2484;
  {$EXTERNALSYM NERR_UPSShutdownFailed}
  NERR_BadDosRetCode                = 2500;
  {$EXTERNALSYM NERR_BadDosRetCode}
  NERR_ProgNeedsExtraMem            = 2501;
  {$EXTERNALSYM NERR_ProgNeedsExtraMem}
  NERR_BadDosFunction               = 2502;
  {$EXTERNALSYM NERR_BadDosFunction}
  NERR_RemoteBootFailed             = 2503;
  {$EXTERNALSYM NERR_RemoteBootFailed}
  NERR_BadFileCheckSum              = 2504;
  {$EXTERNALSYM NERR_BadFileCheckSum}
  NERR_NoRplBootSystem              = 2505;
  {$EXTERNALSYM NERR_NoRplBootSystem}
  NERR_RplLoadrNetBiosErr           = 2506;
  {$EXTERNALSYM NERR_RplLoadrNetBiosErr}
  NERR_RplLoadrDiskErr              = 2507;
  {$EXTERNALSYM NERR_RplLoadrDiskErr}
  NERR_ImageParamErr                = 2508;
  {$EXTERNALSYM NERR_ImageParamErr}
  NERR_TooManyImageParams           = 2509;
  {$EXTERNALSYM NERR_TooManyImageParams}
  NERR_NonDosFloppyUsed             = 2510;
  {$EXTERNALSYM NERR_NonDosFloppyUsed}
  NERR_RplBootRestart               = 2511;
  {$EXTERNALSYM NERR_RplBootRestart}
  NERR_RplSrvrCallFailed            = 2512;
  {$EXTERNALSYM NERR_RplSrvrCallFailed}
  NERR_CantConnectRplSrvr           = 2513;
  {$EXTERNALSYM NERR_CantConnectRplSrvr}
  NERR_CantOpenImageFile            = 2514;
  {$EXTERNALSYM NERR_CantOpenImageFile}
  NERR_CallingRplSrvr               = 2515;
  {$EXTERNALSYM NERR_CallingRplSrvr}
  NERR_StartingRplBoot              = 2516;
  {$EXTERNALSYM NERR_StartingRplBoot}
  NERR_RplBootServiceTerm           = 2517;
  {$EXTERNALSYM NERR_RplBootServiceTerm}
  NERR_RplBootStartFailed           = 2518;
  {$EXTERNALSYM NERR_RplBootStartFailed}
  NERR_RPL_CONNECTED                = 2519;
  {$EXTERNALSYM NERR_RPL_CONNECTED}
  NERR_BrowserConfiguredToNotRun    = 2550;
  {$EXTERNALSYM NERR_BrowserConfiguredToNotRun}
  NERR_RplNoAdaptersStarted         = 2610;
  {$EXTERNALSYM NERR_RplNoAdaptersStarted}
  NERR_RplBadRegistry               = 2611;
  {$EXTERNALSYM NERR_RplBadRegistry}
  NERR_RplBadDatabase               = 2612;
  {$EXTERNALSYM NERR_RplBadDatabase}
  NERR_RplRplfilesShare             = 2613;
  {$EXTERNALSYM NERR_RplRplfilesShare}
  NERR_RplNotRplServer              = 2614;
  {$EXTERNALSYM NERR_RplNotRplServer}
  NERR_RplCannotEnum                = 2615;
  {$EXTERNALSYM NERR_RplCannotEnum}
  NERR_RplWkstaInfoCorrupted        = 2616;
  {$EXTERNALSYM NERR_RplWkstaInfoCorrupted}
  NERR_RplWkstaNotFound             = 2617;
  {$EXTERNALSYM NERR_RplWkstaNotFound}
  NERR_RplWkstaNameUnavailable      = 2618;
  {$EXTERNALSYM NERR_RplWkstaNameUnavailable}
  NERR_RplProfileInfoCorrupted      = 2619;
  {$EXTERNALSYM NERR_RplProfileInfoCorrupted}
  NERR_RplProfileNotFound           = 2620;
  {$EXTERNALSYM NERR_RplProfileNotFound}
  NERR_RplProfileNameUnavailable    = 2621;
  {$EXTERNALSYM NERR_RplProfileNameUnavailable}
  NERR_RplProfileNotEmpty           = 2622;
  {$EXTERNALSYM NERR_RplProfileNotEmpty}
  NERR_RplConfigInfoCorrupted       = 2623;
  {$EXTERNALSYM NERR_RplConfigInfoCorrupted}
  NERR_RplConfigNotFound            = 2624;
  {$EXTERNALSYM NERR_RplConfigNotFound}
  NERR_RplAdapterInfoCorrupted      = 2625;
  {$EXTERNALSYM NERR_RplAdapterInfoCorrupted}
  NERR_RplInternal                  = 2626;
  {$EXTERNALSYM NERR_RplInternal}
  NERR_RplVendorInfoCorrupted       = 2627;
  {$EXTERNALSYM NERR_RplVendorInfoCorrupted}
  NERR_RplBootInfoCorrupted         = 2628;
  {$EXTERNALSYM NERR_RplBootInfoCorrupted}
  NERR_RplWkstaNeedsUserAcct        = 2629;
  {$EXTERNALSYM NERR_RplWkstaNeedsUserAcct}
  NERR_RplNeedsRPLUSERAcct          = 2630;
  {$EXTERNALSYM NERR_RplNeedsRPLUSERAcct}
  NERR_RplBootNotFound              = 2631;
  {$EXTERNALSYM NERR_RplBootNotFound}
  NERR_RplIncompatibleProfile       = 2632;
  {$EXTERNALSYM NERR_RplIncompatibleProfile}
  NERR_RplAdapterNameUnavailable    = 2633;
  {$EXTERNALSYM NERR_RplAdapterNameUnavailable}
  NERR_RplConfigNotEmpty            = 2634;
  {$EXTERNALSYM NERR_RplConfigNotEmpty}
  NERR_RplBootInUse                 = 2635;
  {$EXTERNALSYM NERR_RplBootInUse}
  NERR_RplBackupDatabase            = 2636;
  {$EXTERNALSYM NERR_RplBackupDatabase}
  NERR_RplAdapterNotFound           = 2637;
  {$EXTERNALSYM NERR_RplAdapterNotFound}
  NERR_RplVendorNotFound            = 2638;
  {$EXTERNALSYM NERR_RplVendorNotFound}
  NERR_RplVendorNameUnavailable     = 2639;
  {$EXTERNALSYM NERR_RplVendorNameUnavailable}
  NERR_RplBootNameUnavailable       = 2640;
  {$EXTERNALSYM NERR_RplBootNameUnavailable}
  NERR_RplConfigNameUnavailable     = 2641;
  {$EXTERNALSYM NERR_RplConfigNameUnavailable}
  NERR_DfsInternalCorruption        = 2660;
  {$EXTERNALSYM NERR_DfsInternalCorruption}
  NERR_DfsVolumeDataCorrupt         = 2661;
  {$EXTERNALSYM NERR_DfsVolumeDataCorrupt}
  NERR_DfsNoSuchVolume              = 2662;
  {$EXTERNALSYM NERR_DfsNoSuchVolume}
  NERR_DfsVolumeAlreadyExists       = 2663;
  {$EXTERNALSYM NERR_DfsVolumeAlreadyExists}
  NERR_DfsAlreadyShared             = 2664;
  {$EXTERNALSYM NERR_DfsAlreadyShared}
  NERR_DfsNoSuchShare               = 2665;
  {$EXTERNALSYM NERR_DfsNoSuchShare}
  NERR_DfsNotALeafVolume            = 2666;
  {$EXTERNALSYM NERR_DfsNotALeafVolume}
  NERR_DfsLeafVolume                = 2667;
  {$EXTERNALSYM NERR_DfsLeafVolume}
  NERR_DfsVolumeHasMultipleServers  = 2668;
  {$EXTERNALSYM NERR_DfsVolumeHasMultipleServers}
  NERR_DfsCantCreateJunctionPoint   = 2669;
  {$EXTERNALSYM NERR_DfsCantCreateJunctionPoint}
  NERR_DfsServerNotDfsAware         = 2670;
  {$EXTERNALSYM NERR_DfsServerNotDfsAware}
  NERR_DfsBadRenamePath             = 2671;
  {$EXTERNALSYM NERR_DfsBadRenamePath}
  NERR_DfsVolumeIsOffline           = 2672;
  {$EXTERNALSYM NERR_DfsVolumeIsOffline}
  NERR_DfsNoSuchServer              = 2673;
  {$EXTERNALSYM NERR_DfsNoSuchServer}
  NERR_DfsCyclicalName              = 2674;
  {$EXTERNALSYM NERR_DfsCyclicalName}
  NERR_DfsNotSupportedInServerDfs   = 2675;
  {$EXTERNALSYM NERR_DfsNotSupportedInServerDfs}
  NERR_DfsDuplicateService          = 2676;
  {$EXTERNALSYM NERR_DfsDuplicateService}
  NERR_DfsCantRemoveLastServerShare = 2677;
  {$EXTERNALSYM NERR_DfsCantRemoveLastServerShare}
  NERR_DfsVolumeIsInterDfs          = 2678;
  {$EXTERNALSYM NERR_DfsVolumeIsInterDfs}
  NERR_DfsInconsistent              = 2679;
  {$EXTERNALSYM NERR_DfsInconsistent}
  NERR_DfsServerUpgraded            = 2680;
  {$EXTERNALSYM NERR_DfsServerUpgraded}
  NERR_DfsDataIsIdentical           = 2681;
  {$EXTERNALSYM NERR_DfsDataIsIdentical}
  NERR_DfsCantRemoveDfsRoot         = 2682;
  {$EXTERNALSYM NERR_DfsCantRemoveDfsRoot}
  NERR_DfsChildOrParentInDfs        = 2683;
  {$EXTERNALSYM NERR_DfsChildOrParentInDfs}
  NERR_DfsInternalError             = 2690;
  {$EXTERNALSYM NERR_DfsInternalError}
  NERR_SetupAlreadyJoined           = 2691;
  {$EXTERNALSYM NERR_SetupAlreadyJoined}
  NERR_SetupNotJoined               = 2692;
  {$EXTERNALSYM NERR_SetupNotJoined}
  NERR_SetupDomainController        = 2693;
  {$EXTERNALSYM NERR_SetupDomainController}
  NERR_DefaultJoinRequired          = 2694;
  {$EXTERNALSYM NERR_DefaultJoinRequired}
  NERR_InvalidWorkgroupName         = 2695;
  {$EXTERNALSYM NERR_InvalidWorkgroupName}
  NERR_NameUsesIncompatibleCodePage = 2696;
  {$EXTERNALSYM NERR_NameUsesIncompatibleCodePage}
  NERR_ComputerAccountNotFound      = 2697;
  {$EXTERNALSYM NERR_ComputerAccountNotFound}
  NERR_PersonalSku                  = 2698;
  {$EXTERNALSYM NERR_PersonalSku}
  NERR_PasswordMustChange           = 2701;
  {$EXTERNALSYM NERR_PasswordMustChange}
  NERR_AccountLockedOut             = 2702;
  {$EXTERNALSYM NERR_AccountLockedOut}
  NERR_PasswordTooLong              = 2703;
  {$EXTERNALSYM NERR_PasswordTooLong}
  NERR_PasswordNotComplexEnough     = 2704;
  {$EXTERNALSYM NERR_PasswordNotComplexEnough}
  NERR_PasswordFilterError          = 2705;
  {$EXTERNALSYM NERR_PasswordFilterError}

  FILTER_TEMP_DUPLICATE_ACCOUNT     = $01;
  {$EXTERNALSYM FILTER_TEMP_DUPLICATE_ACCOUNT}
  FILTER_NORMAL_ACCOUNT             = $02;
  {$EXTERNALSYM FILTER_NORMAL_ACCOUNT}
  FILTER_INTERDOMAIN_TRUST_ACCOUNT  = $08;
  {$EXTERNALSYM FILTER_INTERDOMAIN_TRUST_ACCOUNT}
  FILTER_WORKSTATION_TRUST_ACCOUNT  = $10;
  {$EXTERNALSYM FILTER_WORKSTATION_TRUST_ACCOUNT}
  FILTER_SERVER_TRUST_ACCOUNT       = $20;
  {$EXTERNALSYM FILTER_SERVER_TRUST_ACCOUNT}

  UF_SCRIPT                          = $00000001;
  UF_ACCOUNTDISABLE                  = $00000002;
  UF_HOMEDIR_REQUIRED                = $00000008;
  UF_LOCKOUT                         = $00000010;
  UF_PASSWD_NOTREQD                  = $00000020;
  UF_PASSWD_CANT_CHANGE              = $00000040;
  UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = $00000080;
  UF_TEMP_DUPLICATE_ACCOUNT          = $00000100;
  UF_NORMAL_ACCOUNT                  = $00000200;
  UF_INTERDOMAIN_TRUST_ACCOUNT       = $00000800;
  UF_WORKSTATION_TRUST_ACCOUNT       = $00001000;
  UF_SERVER_TRUST_ACCOUNT            = $00002000;
  UF_DONT_EXPIRE_PASSWD              = $00010000;
  UF_MNS_LOGON_ACCOUNT               = $00020000;
  UF_SMARTCARD_REQUIRED              = $00040000;
  UF_TRUSTED_FOR_DELEGATION          = $00080000;
  UF_NOT_DELEGATED                   = $00100000;
  UF_USE_DES_KEY_ONLY                = $00200000;
  UF_DONT_REQUIRE_PREAUTH            = $00400000;
  UF_PASSWORD_EXPIRED                = $00800000;

  GroupInfoLevel0 = 0;
  GroupInfoLevel1 = 1;
  GroupInfoLevel2 = 2;
  GroupInfoLevel3 = 3;
  GroupUsersInfoLevel0 = 0;
  GroupUsersInfoLevel1 = 1;
  UserInfoLevel0 = 0;
  UserInfoLevel1 = 1;
  UserInfoLevel2 = 2;
  UserInfoLevel3 = 3;
  UserInfoLevel10 = 10;
  UserInfoLevel11 = 11;
  UserInfoLevel20 = 20;
  UserInfoLevel23 = 23;

  MAX_PREFERRED_LENGTH = $FFFFFFFF;

type
  LPBYTE = PBYTE;
  LPVOID = Pointer;
  NET_API_STATUS = DWORD;

  PGroupInfo0 = ^TGroupInfo0;
  _GROUP_INFO_0 = record
    grpi0_name: LPWSTR;
  end;
  {$EXTERNALSYM _GROUP_INFO_0}
  TGroupInfo0 = _GROUP_INFO_0;
  GROUP_INFO_0 = _GROUP_INFO_0;
  {$EXTERNALSYM GROUP_INFO_0}

  PGroupInfo1 = ^TGroupInfo1;
  _GROUP_INFO_1 = record
    grpi1_name: LPWSTR;
    grpi1_comment: LPWSTR;
  end;
  {$EXTERNALSYM _GROUP_INFO_1}
  TGroupInfo1 = _GROUP_INFO_1;
  GROUP_INFO_1 = _GROUP_INFO_1;
  {$EXTERNALSYM GROUP_INFO_1}

  PGroupInfo2 = ^TGroupInfo2;
  _GROUP_INFO_2 = record
    grpi2_name: LPWSTR;
    grpi2_comment: LPWSTR;
    grpi2_group_id: DWORD;
    grpi2_attributes: DWORD;
  end;
  {$EXTERNALSYM _GROUP_INFO_2}
  TGroupInfo2 = _GROUP_INFO_2;
  GROUP_INFO_2 = _GROUP_INFO_2;
  {$EXTERNALSYM GROUP_INFO_2}

  PGroupInfo3 = ^TGroupInfo3;
  _GROUP_INFO_3 = record
    grpi3_name: LPWSTR;
    grpi3_comment: LPWSTR;
    grpi3_group_sid: PSID;
    grpi3_attributes: DWORD;
  end;
  {$EXTERNALSYM _GROUP_INFO_3}
  TGroupInfo3 = _GROUP_INFO_3;
  GROUP_INFO_3 = _GROUP_INFO_3;
  {$EXTERNALSYM GROUP_INFO_3}

  PGroupUsersInfo0 = ^TGroupUsersInfo0;
  _GROUP_USERS_INFO_0 = record
    grui0_name: LPWSTR;
  end;
  {$EXTERNALSYM _GROUP_USERS_INFO_0}
  TGroupUsersInfo0 = _GROUP_USERS_INFO_0;
  GROUP_USERS_INFO_0 = _GROUP_USERS_INFO_0;
  {$EXTERNALSYM GROUP_USERS_INFO_0}

  PGroupUsersInfo1 = ^TGroupUsersInfo1;
  _GROUP_USERS_INFO_1 = record
    grui1_name: LPWSTR;
    grui1_attributes: DWORD;
  end;
  {$EXTERNALSYM _GROUP_USERS_INFO_1}
  TGroupUsersInfo1 = _GROUP_USERS_INFO_1;
  GROUP_USERS_INFO_1 = _GROUP_USERS_INFO_1;
  {$EXTERNALSYM GROUP_USERS_INFO_1}

  PUserInfo0 = ^TUserInfo0;
  _USER_INFO_0 = record
    usri0_name: LPWSTR;
  end;
  {$EXTERNALSYM _USER_INFO_0}
  TUserInfo0 = _USER_INFO_0;
  USER_INFO_0 = _USER_INFO_0;
  {$EXTERNALSYM USER_INFO_0}

  PUserInfo1 = ^TUserInfo1;
  _USER_INFO_1 = record
    usri1_name: LPWSTR;
    usri1_password: LPWSTR;
    usri1_password_age: DWORD;
    usri1_priv: DWORD;
    usri1_home_dir: LPWSTR;
    usri1_comment: LPWSTR;
    usri1_flags: DWORD;
    usri1_script_path: LPWSTR;
  end;
  {$EXTERNALSYM _USER_INFO_1}
  TUserInfo1 = _USER_INFO_1;
  USER_INFO_1 = _USER_INFO_1;
  {$EXTERNALSYM USER_INFO_1}

  PUserInfo2 = ^TUserInfo2;
  _USER_INFO_2 = record
    usri2_name: LPWSTR;
    usri2_password: LPWSTR;
    usri2_password_age: DWORD;
    usri2_priv: DWORD;
    usri2_home_dir: LPWSTR;
    usri2_comment: LPWSTR;
    usri2_flags: DWORD;
    usri2_script_path: LPWSTR;
    usri2_auth_flags: DWORD;
    usri2_full_name: LPWSTR;
    usri2_usr_comment: LPWSTR;
    usri2_parms: LPWSTR;
    usri2_workstations: LPWSTR;
    usri2_last_logon: DWORD;
    usri2_last_logoff: DWORD;
    usri2_acct_expires: DWORD;
    usri2_max_storage: DWORD;
    usri2_units_per_week: DWORD;
    usri2_logon_hours: PBYTE;
    usri2_bad_pw_count: DWORD;
    usri2_num_logons: DWORD;
    usri2_logon_server: LPWSTR;
    usri2_country_code: DWORD;
    usri2_code_page: DWORD;
  end;
  {$EXTERNALSYM _USER_INFO_2}
  TUserInfo2 = _USER_INFO_2;
  USER_INFO_2 = _USER_INFO_2;
  {$EXTERNALSYM USER_INFO_2}

  PUserInfo3 = ^TUserInfo3;
  _USER_INFO_3 = record
    usri3_name: LPWSTR;
    usri3_password: LPWSTR;
    usri3_password_age: DWORD;
    usri3_priv: DWORD;
    usri3_home_dir: LPWSTR;
    usri3_comment: LPWSTR;
    usri3_flags: DWORD;
    usri3_script_path: LPWSTR;
    usri3_auth_flags: DWORD;
    usri3_full_name: LPWSTR;
    usri3_usr_comment: LPWSTR;
    usri3_parms: LPWSTR;
    usri3_workstations: LPWSTR;
    usri3_last_logon: DWORD;
    usri3_last_logoff: DWORD;
    usri3_acct_expires: DWORD;
    usri3_max_storage: DWORD;
    usri3_units_per_week: DWORD;
    usri3_logon_hours: PBYTE;
    usri3_bad_pw_count: DWORD;
    usri3_num_logons: DWORD;
    usri3_logon_server: LPWSTR;
    usri3_country_code: DWORD;
    usri3_code_page: DWORD;
    usri3_user_id: DWORD;
    usri3_primary_group_id: DWORD;
    usri3_profile: LPWSTR;
    usri3_home_dir_drive: LPWSTR;
    usri3_password_expired: DWORD;
  end;
  {$EXTERNALSYM _USER_INFO_3}
  TUserInfo3 = _USER_INFO_3;
  USER_INFO_3 = _USER_INFO_3;
  {$EXTERNALSYM USER_INFO_3}

  PUserInfo10 = ^TUserInfo10;
  _USER_INFO_10 = record
    usri10_name: LPWSTR;
    usri10_comment: LPWSTR;
    usri10_usr_comment: LPWSTR;
    usri10_full_name: LPWSTR;
  end;
  {$EXTERNALSYM _USER_INFO_10}
  TUserInfo10 = _USER_INFO_10;
  USER_INFO_10 = _USER_INFO_10;
  {$EXTERNALSYM USER_INFO_10}

  PUserInfo11 = ^TUserInfo11;
  _USER_INFO_11 = record
    usri11_name: LPWSTR;
    usri11_comment: LPWSTR;
    usri11_usr_comment: LPWSTR;
    usri11_full_name: LPWSTR;
    usri11_priv: DWORD;
    usri11_auth_flags: DWORD;
    usri11_password_age: DWORD;
    usri11_home_dir: LPWSTR;
    usri11_parms: LPWSTR;
    usri11_last_logon: DWORD;
    usri11_last_logoff: DWORD;
    usri11_bad_pw_count: DWORD;
    usri11_num_logons: DWORD;
    usri11_logon_server: LPWSTR;
    usri11_country_code: DWORD;
    usri11_workstations: LPWSTR;
    usri11_max_storage: DWORD;
    usri11_units_per_week: DWORD;
    usri11_logon_hours: PBYTE;
    usri11_code_page: DWORD;
  end;
  {$EXTERNALSYM _USER_INFO_11}
  TUserInfo11 = _USER_INFO_11;
  USER_INFO_11 = _USER_INFO_11;
  {$EXTERNALSYM USER_INFO_11}

  PUserInfo20 = ^TUserInfo20;
  _USER_INFO_20 = record
    usri20_name: LPWSTR;
    usri20_full_name: LPWSTR;
    usri20_comment: LPWSTR;
    usri20_flags: DWORD;
    usri20_user_id: DWORD;
  end;
  {$EXTERNALSYM _USER_INFO_20}
  TUserInfo20 = _USER_INFO_20;
  USER_INFO_20 = _USER_INFO_20;
  {$EXTERNALSYM USER_INFO_20}

  PUserInfo23 = ^TUserInfo23;
  _USER_INFO_23 = record
    usri23_name: LPWSTR;
    usri23_full_name: LPWSTR;
    usri23_comment: LPWSTR;
    usri23_flags: DWORD;
    usri23_user_sid: PSID;
  end;
  {$EXTERNALSYM _USER_INFO_23}
  TUserInfo23 = _USER_INFO_23;
  USER_INFO_23 = _USER_INFO_23;
  {$EXTERNALSYM USER_INFO_23}

function NetApiBufferFree(Buffer: LPVOID): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetApiBufferFree}
function NetGroupEnum(servername: LPCWSTR; level: DWORD; bufptr: LPBYTE;
  prefmaxlen: DWORD; entriesread, totalentries,
  resume_handle: LPDWORD): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetGroupEnum}
function NetGroupGetUsers(servername, groupname: LPCWSTR; level: DWORD;
  bufptr: LPBYTE; prefmaxlen: DWORD; entriesread, totalentries,
  ResumeHandle: LPDWORD): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetGroupGetUsers}
function NetUserEnum(servername: LPCWSTR; level, filter: DWORD; bufptr: LPBYTE;
  prefmaxlen: DWORD; entriesread, totalentries,
  resume_handle: LPDWORD): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetUserEnum}
function NetUserGetGroups(servername, username: LPCWSTR; level: DWORD;
  bufptr: LPBYTE; prefmaxlen: DWORD; entriesread,
  totalentries: LPDWORD): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetUserGetGroups}

function GetNetGroups(ComputerName: WideString;
  Groups: TStrings): NET_API_STATUS;
function GetNetGroupUsers(ComputerName, GroupName: WideString; Users: TStrings;
  IncludeComputerName, IncludeDisabledUsers: Boolean): NET_API_STATUS;
function GetNetUserGroups(ComputerName, UserName: WideString;
  Groups: TStrings): NET_API_STATUS;
function GetNetUsers(ComputerName: WideString; Users: TStrings;
  IncludeComputerName, IncludeDisabledUsers: Boolean): NET_API_STATUS;

implementation

function NetApiBufferFree; external netapi32 name 'NetApiBufferFree';
function NetGroupEnum; external netapi32 name 'NetGroupEnum';
function NetGroupGetUsers; external netapi32 name 'NetGroupGetUsers';
function NetUserEnum; external netapi32 name 'NetUserEnum';
function NetUserGetGroups; external netapi32 name 'NetUserGetGroups';

procedure CheckServerName(var ComputerName: WideString);
begin
  ComputerName := WideUpperCase(ExcludeTrailingPathDelimiter(ComputerName));
  while ComputerName[2] <> PathDelim do
    ComputerName := PathDelim + ComputerName;
end;

function GetNetGroups(ComputerName: WideString;
  Groups: TStrings): NET_API_STATUS;
var
  i: Cardinal;
  Buffer: Pointer;
  EntriesRead: Cardinal;
  EntriesCount: Cardinal;
  ResumeHandle: Cardinal;
  GroupInfo: PGroupInfo0;
begin
  Result := S_FALSE;
  if Groups <> nil then
  try
    CheckServerName(ComputerName);
    i := 0;
    EntriesRead := 0;
    ResumeHandle := 0;
    Result := NetGroupEnum(PWideChar(ComputerName), GroupInfoLevel0, @Buffer,
      MAX_PREFERRED_LENGTH, @EntriesRead, @EntriesCount, @ResumeHandle);
    GroupInfo := Buffer;
    while i < EntriesRead do
    begin
      Groups.Add(GroupInfo.grpi0_name);
      Inc(GroupInfo);
      Inc(i);
    end;
  finally
    NetApiBufferFree(Buffer);
  end;
end;

function GetNetGroupUsers(ComputerName, GroupName: WideString; Users: TStrings;
  IncludeComputerName, IncludeDisabledUsers: Boolean): NET_API_STATUS;
var
  i: Cardinal;
  Buffer: Pointer;
  EntriesRead: Cardinal;
  EntriesCount: Cardinal;
  ResumeHandle: Cardinal;
  GroupUsersInfo: PGroupUsersInfo0;
  GroupUsers: TStrings;
  AllUsers: TStrings;
begin
  Result := S_FALSE;
  GroupUsers := TStringList.Create;
  if Users <> nil then
  try
    CheckServerName(ComputerName);
    i := 0;
    EntriesRead := 0;
    ResumeHandle := 0;
    Result := NetGroupGetUsers(PWideChar(ComputerName), PWideChar(GroupName),
      GroupUsersInfoLevel0, @Buffer, MAX_PREFERRED_LENGTH, @EntriesRead,
      @EntriesCount, @ResumeHandle);
    GroupUsersInfo := Buffer;
    while i < EntriesRead do
    begin
      if IncludeComputerName then
        GroupUsers.Add(ComputerName + PathDelim + GroupUsersInfo.grui0_name)
      else
        GroupUsers.Add(GroupUsersInfo.grui0_name);
      Inc(GroupUsersInfo);
      Inc(i);
    end;
    if IncludeDisabledUsers then
      Users.AddStrings(GroupUsers)
    else if Result = NERR_Success then
    begin
      AllUsers := TStringList.Create;
      try
        Result := GetNetUsers(ComputerName, AllUsers, IncludeComputerName,
          IncludeDisabledUsers);
        for i := 0 to GroupUsers.Count - 1 do
          if AllUsers.IndexOf(GroupUsers[i]) <> -1 then
            Users.Add(GroupUsers[i]);
      finally
        AllUsers.Free;
      end;
    end;
  finally
    GroupUsers.Free;
    NetApiBufferFree(Buffer);
  end;
end;

function GetNetUserGroups(ComputerName, UserName: WideString;
  Groups: TStrings): NET_API_STATUS;
var
  i: Cardinal;
  Buffer: Pointer;
  EntriesRead: Cardinal;
  EntriesCount: Cardinal;
  GroupUsersInfo: PGroupUsersInfo0;
begin
  Result := S_FALSE;
  if Groups <> nil then
  try
    CheckServerName(ComputerName);
    i := 0;
    EntriesRead := 0;
    Result := NetUserGetGroups(PWideChar(ComputerName), PWideChar(UserName),
      GroupUsersInfoLevel0, @Buffer, MAX_PREFERRED_LENGTH, @EntriesRead,
      @EntriesCount);
    GroupUsersInfo := Buffer;
    while i < EntriesRead do
    begin
      Groups.Add(GroupUsersInfo.grui0_name);
      Inc(GroupUsersInfo);
      Inc(i);
    end;
  finally
    NetApiBufferFree(Buffer);
  end;
end;

function GetNetUsers(ComputerName: WideString; Users: TStrings;
  IncludeComputerName, IncludeDisabledUsers: Boolean): NET_API_STATUS;
var
  i: Cardinal;
  Buffer: Pointer;
  EntriesRead: Cardinal;
  EntriesCount: Cardinal;
  ResumeHandle: Cardinal;
  UserInfo: PUserInfo20;
begin
  Result := S_FALSE;
  if Users <> nil then
  try
    CheckServerName(ComputerName);
    i := 0;
    EntriesRead := 0;
    ResumeHandle := 0;
    Result := NetUserEnum(PWideChar(ComputerName), UserInfoLevel20,
      FILTER_NORMAL_ACCOUNT, @Buffer, MAX_PREFERRED_LENGTH, @EntriesRead,
      @EntriesCount, @ResumeHandle);
    UserInfo := Buffer;
    while i < EntriesRead do
    begin
      if IncludeDisabledUsers or
        (UserInfo.usri20_flags and UF_ACCOUNTDISABLE = 0) then
        if IncludeComputerName then
          Users.Add(ComputerName + PathDelim + UserInfo.usri20_name)
        else
          Users.Add(UserInfo.usri20_name);
      Inc(UserInfo);
      Inc(i);
    end;
  finally
    NetApiBufferFree(Buffer);
  end;
end;

end.

