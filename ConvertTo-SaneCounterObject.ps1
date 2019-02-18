filter ConvertTo-SaneCounterObject {
    foreach ($cs in $_.CounterSamples) {
        $pathwoinstance = $cs.Path -replace '\([^\)]+\)',''
        $components = $pathwoinstance.trim('\').split('\')
        [PSCustomObject]@{
            ComputerName = $components[0]
            CounterSet = $components[1]
            CounterName = $components[2]
            Value = $cs.CookedValue
            Date = $cs.Timestamp
        }
    }
}