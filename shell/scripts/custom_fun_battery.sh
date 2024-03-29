## Setup for zsh

BATTERY=$(pmset -g batt | grep "[0-9][0-9]" | cut -d $'\t' -f2 | cut -d ' ' -f1 -f3 | sed 's/%;//g')
BAT_PCT=$(cut -d ' ' -f1 <<< $BATTERY)
BAT_TIME=$(cut -d ' ' -f2 <<< $BATTERY)

if [[ $BAT_PCT -gt 80 ]]; then
    BATTERY="%F{82}$BAT_PCT%% [$BAT_TIME]%f"
elif [[ $BAT_PCT -gt 30 ]]; then
    BATTERY="%F{190}$BAT_PCT%% [$BAT_TIME]%f"
else
    BATTERY="%F{202}$BAT_PCT%% [$BAT_TIME]%f"
fi