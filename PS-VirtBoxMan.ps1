function Get-VBoxHostOnlyIf()
{
    VBoxManage list hostonlyifs | ForEach-Object {
        if([string]::IsNullOrEmpty($_)) { return }

        $a, $b = ($_).Split(":")
        $a = $a.Trim()
        $b = ($b -join ":").Trim();

        if($a -ieq "Name")
        {
            $obj = New-Object -TypeName PSObject
        }

        Add-Member -MemberType NoteProperty -InputObject $obj -Name $a -Value $b

        if($a -ieq "VBoxNetworkName")
        {
            $obj
        }
    }
}

function Get-VBoxHdd()
{
    VBoxManage list hdds | ForEach-Object {
        if([string]::IsNullOrEmpty($_)) { return }

        $a, $b = ($_).Split(":")
        $a = $a.Trim()
        $b = ($b -join ":").Trim();

        if($a -ieq "UUID")
        {
            $obj = New-Object -TypeName PSObject
        }

        Add-Member -MemberType NoteProperty -InputObject $obj -Name $a -Value $b

        if($a -ieq "Encryption")
        {
            $obj
        }
    }
}

function Get-VBoxIntNet()
{
    VBoxManage list intnets | ForEach-Object {
        if([string]::IsNullOrEmpty($_)) { return }

        $a, $b = ($_).Split(":")
        $a = $a.Trim()
        $b = $b.Trim();

        if($a -ieq "Name")
        {
            New-Object -TypeName PSObject -Property @{Name = $b}
        }
    }
}

function Get-VBoxVm()
{
    VBoxManage list vms | ForEach-Object {
        if([string]::IsNullOrEmpty($_)) { return }

        $a, $b = ($_).Split("{") 
        $a = $a.Trim() -replace '"'
        $b = ("{" + $b).Trim() -replace '[{}]' 

        New-Object -TypeName PSObject -Property @{Name = $a; UUID = $b}
    }
}

function Get-VBoxSysProp()
{
    $obj = New-Object -TypeName PSObject
    VBoxManage list systemproperties | ForEach-Object {
        if([string]::IsNullOrEmpty($_)) { return }

        $a, $b = ($_).Split(":")
        $a = $a.Trim()
        $b = ($b -join ":").Trim();
        
        Add-Member -MemberType NoteProperty -InputObject $obj -Name $a -Value $b
    }
    $obj
}

function Get-VBoxVersion()
{
    New-Object -TypeName PSObject -Property @{Version = (VBoxManage --version)} 
}