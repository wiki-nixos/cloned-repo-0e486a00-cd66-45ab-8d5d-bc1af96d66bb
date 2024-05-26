#!/run/current-system/sw/bin/bash

# Definiere den Pfad zur Logdatei
LOG_FILE="/home/user/log.txt"


# Funktion zum Schreiben von Ausgaben in die Logdatei
log_output() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

# Überprüfen, ob das Modul bereits geladen ist
if /run/current-system/sw/bin/pactl list modules | grep -q 'module-native-protocol-tcp'; then
    log_output "Module already active. Unloading.."
    /run/current-system/sw/bin/pactl unload-module module-native-protocol-tcp
fi

log_output "Starting new client:"

# Lade das Modul neu
if /run/current-system/sw/bin/pactl load-module module-native-protocol-tcp port=4713 listen=0.0.0.0 auth-anonymous=true; then
    log_output "Module loaded successfully."
else
    log_output "Failed to load module."
    # Füge hier ggf. zusätzliche Fehlerbehandlung hinzu
fi

