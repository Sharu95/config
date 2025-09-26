"use strict";

/**
 * Hyper config adapted to resemble your Windows Terminal (Catppuccin Macchiato + FiraCode Nerd Font + WSL Ubuntu)
 * Colors, font, padding, copyOnSelect, cursor, selection, and WSL default shell adjusted.
 */
module.exports = {
    config: {
        updateChannel: 'stable',

        // Font (match WT)
        fontFamily: 'FiraCode Nerd Font, "Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
        fontSize: 12,
        fontWeight: 'normal',
        fontWeightBold: 'bold',
        lineHeight: 1.1,
        letterSpacing: 0,

        // Catppuccin Macchiato
        foregroundColor: '#CAD3F5',
        backgroundColor: '#24273A',
        cursorColor: '#F4DBD6',
        cursorAccentColor: '#24273A',
        cursorShape: 'BLOCK',
        cursorBlink: false,
        selectionColor: 'rgba(91,96,120,0.35)', // #5B6078 with alpha
        borderColor: '#1E2030',

        padding: '12px',

        colors: {
            black: '#494D64',
            red: '#ED8796',
            green: '#A6DA95',
            yellow: '#EED49F',
            blue: '#8AADF4',
            magenta: '#F5BDE6',
            cyan: '#8BD5CA',
            white: '#B8C0E0',

            lightBlack: '#5B6078',
            lightRed: '#ED8796',
            lightGreen: '#A6DA95',
            lightYellow: '#EED49F',
            lightBlue: '#8AADF4',
            lightMagenta: '#F5BDE6',
            lightCyan: '#8BD5CA',
            lightWhite: '#A5ADCB',
        },

        // Enable ligatures like WT
        disableLigatures: false,

        // Behaviors similar to WT
        copyOnSelect: true,
        quickEdit: true,
        webGLRenderer: true,
        preserveCWD: true,

        // Make Hyper start in WSL Ubuntu (adjust distro name if different)
        shell: 'C:\\Windows\\System32\\wsl.exe',
        shellArgs: ['-d', 'Ubuntu'],
        env: {},

        bell: false,
        css: '',
        termCSS: '',
        workingDirectory: '',
        showHamburgerMenu: '',
        showWindowControls: true,
        webLinksActivationKey: '',
        disableAutoUpdates: false,
        screenReaderMode: false,
    },

    // Optional: add a Catppuccin theme plugin instead of manual colors (then remove colors above)
    // plugins: ['hyper-catppuccin'],
    plugins: [],

    localPlugins: [],

    keymaps: {
        // Map some conveniences similar to your WT keybindings
        // Copy / Paste (WT used Alt+C / Alt+V)
        'editor:copy': 'alt+c',
        'editor:paste': 'alt+v',
        // Fullscreen toggle (approximate quake summon feel)
        'window:toggleFullScreen': 'alt+shift+1',
        // Duplicate tab (similar spirit to duplicate pane)
        'tab:duplicate': 'alt+shift+d'
    },
};
