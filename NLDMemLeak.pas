{ *************************************************************************** }
{                                                                             }
{ NLDMemLeak  -  www.nldelphi.com Open Source Delphi runtime library          }
{                                                                             }
{ Initiator: Albert de Weerd (aka NGLN)                                       }
{ License: Free to use, free to modify                                        }
{ GitHub path: https://github.com/NLDelphi/NLDUtils/blob/main/NLDMemLeak.pas  }
{                                                                             }
{ *************************************************************************** }

unit NLDMemLeak;

interface

implementation

uses
  Winapi.Windows, SysUtils;

var
  StartMem: Cardinal;
  MemoryLeak: Cardinal;

initialization
  StartMem := GetHeapStatus.TotalAllocated;

finalization
  MemoryLeak := GetHeapStatus.TotalAllocated - StartMem;
  if MemoryLeak <> 0 then
    MessageBox(0, PChar(IntToStr(MemoryLeak) + ' Bytes.'#10), PChar('Memory leak!'), Mb_OK + Mb_IconWarning);

end.