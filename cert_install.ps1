
#gets all the VM in a subscription
$allVMs = get-azvm 

#filters the list of VMs for Windows VM and Runs the powershell script in them
#$allVMs | where {$_.StorageProfile.OsDisk.OsType -EQ "windows"} | % { Invoke-AzVMRunCommand -ResourceGroupName $_.resourcegroupname -VMName $_.name -CommandId 'RunPowerShellScript' -ScriptPath '.\scriptToRun.ps1'}
 foreach ($VM in $allVMs) {
    if ($VM.StorageProfile.OsDisk.OsType -EQ "windows"){
 $Result = Invoke-AzVMRunCommand -ResourceGroupName $VM.resourcegroupname -VMName $VM.name -CommandId 'RunPowerShellScript' -ScriptPath '.\scriptToRun.ps1'
 

    }
 }