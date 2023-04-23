Styles = {}
function Styles.getButtonStyle(buttonStyle)
    local buttonStyles = {
        primary = {
            borderColor = {0.0745, 0.4235, 0.7843},
            boxColor = {0.0745, 0.4235, 0.7843, 1},
            hoverColor = {0.149, 0.498, 0.925, 1}
        },
        secondary = {
            borderColor = {0.286, 0.573, 1},
            boxColor = {1, 1, 1, 1},
            hoverColor = {0.949, 0.949, 0.949, 1}
        },
        success = {
            borderColor = {0.086, 0.592, 0.314},
            boxColor = {0.086, 0.592, 0.314, 1},
            hoverColor = {0.149, 0.702, 0.384, 1}
        },
        danger = {
            borderColor = {0.757, 0.173, 0.173},
            boxColor = {0.757, 0.173, 0.173, 1},
            hoverColor = {0.875, 0.263, 0.263, 1}
        },
        warning = {
            borderColor = {1, 0.7843, 0.0745},
            boxColor = {1, 0.7843, 0.0745, 1},
            hoverColor = {1, 0.843, 0.259, 1}
        },
        info = {
            borderColor = {0.204, 0.596, 0.859},
            boxColor = {0.204, 0.596, 0.859, 1},
            hoverColor = {0.349, 0.682, 0.965, 1}
        },
        light = {
            borderColor = {0.788, 0.788, 0.788},
            boxColor = {0.937, 0.937, 0.937, 1},
            hoverColor = {0.933, 0.933, 0.933, 1}
        },
        dark = {
            borderColor = {0.286, 0.286, 0.286},
            boxColor = {0.286, 0.286, 0.286, 1},
            hoverColor = {0.4, 0.4, 0.4, 1}
        },
        default = {
            borderColor = {0, 0, 0},
            boxColor = {0.5, 0.5, 0.5, 1},
            hoverColor = {0.8, 0.8, 0.8, 1}
        },
    }
    if buttonStyles[buttonStyle] then
        return buttonStyles[buttonStyle]
    else
        return buttonStyles.default
    end
end

return Styles