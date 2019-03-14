#command to run this script:- powershell.exe  -ExecutionPolicy RemoteSigned -file mouse_drag.ps1 -appname 'Untitled - Paint' -startX 274 -startY 289 -pixels  "400-500-200-400-100-600-1000-300"
param (
    [string]$appname, 
    [int]$startX,    
    [int]$startY,
    [string]$pixels
)

Function MouseMove($AUT, $startX, $startY, $pixelsCordinates)
{
	$DebugViewWindow_TypeDef = @'
	
	[DllImport("user32.dll")]
	public static extern bool SetCursorPos(int X, int Y);
	
	[DllImport("user32.dll")]
	public static extern bool GetCursorPos(out System.Drawing.Point pt);

	[DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
	public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);

	[DllImport("user32.dll", CharSet = CharSet.Unicode)]
	public static extern IntPtr FindWindow(IntPtr sClassName, String sAppName);

	[DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);

	private const int MOUSEEVENTF_LEFTDOWN = 0x02;
	private const int MOUSEEVENTF_LEFTUP = 0x04;
	private const int MOUSEEVENTF_RIGHTDOWN = 0x08;
	private const int MOUSEEVENTF_RIGHTUP = 0x10;

	public static void LeftClick(){
		mouse_event(MOUSEEVENTF_LEFTDOWN | MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
	}

	public static void LeftUP(){
		mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
	}

	public static void LeftDWN(){
		mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
	}

	public static void RightClick(){
		mouse_event(MOUSEEVENTF_RIGHTDOWN | MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
	}

	public static void RightUP(){
		mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
	}

	public static void RightDWN(){
		mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
	}
'@
	Add-Type -MemberDefinition $DebugViewWindow_TypeDef -Namespace MouseMove_Ops -Name AutoInvoke -ReferencedAssemblies System.Drawing
	
	$HWND = [MouseMove_Ops.AutoInvoke]::FindWindow([IntPtr]::Zero, $AUT )
	[MouseMove_Ops.AutoInvoke]::SetForegroundWindow($HWND)

	sleep -Seconds 1	
	[MouseMove_Ops.AutoInvoke]::SetCursorPos($startX,$startY)  | Out-Null

	$pixels = $pixelsCordinates.split("-")
	[MouseMove_Ops.AutoInvoke]::LeftDWN()
	for ($i=0; $i -lt $pixels.length; $i+=2) {
		[MouseMove_Ops.AutoInvoke]::SetCursorPos($pixels[$i],$pixels[$i+1])  | Out-Null
		sleep -Seconds 1

	}
	[MouseMove_Ops.AutoInvoke]::LeftUP()

}

MouseMove $appname $startX $startY $pixels
