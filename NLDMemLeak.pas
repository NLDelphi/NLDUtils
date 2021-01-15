unit AwMemLeak;

interface

implementation

uses
  Windows, SysUtils;

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