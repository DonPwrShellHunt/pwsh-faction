filter ConvertTo-SaneCounterObject {
    foreach ($cs in $_.CounterSamples) {
        $pathwoinstance = $cs.Path -replace '\([^\)]+\)',''
        $components = $pathwoinstance.trim('\').split('\')
        [PSCustomObject]@{
            PSTypeName   = 'saneCounter'
            Timestamp    = $cs.Timestamp
            ComputerName = $components[0]
            CounterSet   = $components[1]
            Instance     = $cs.InstanceName
            Counter      = $components[2]
            Value        = $cs.CookedValue
        }
    }
}

#define a default set of properties to the custom saneCounter type
Update-TypeData -TypeName 'saneCounter' -DefaultDisplayPropertySet 'ComputerName', 'CounterSet', 'Counter', 'Value' -force
