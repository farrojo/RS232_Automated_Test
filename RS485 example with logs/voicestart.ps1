# Microsoft Helena Desktop must be preinstalled
# Execution policy is driven  by main bat file

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.SelectVoice("Microsoft Helena Desktop")
$PhraseLocation = "$pwd\_error_log.txt"
$Phrase         = (Get-Content $PhraseLocation -Tail 1)
$speak.Speak($Phrase)
