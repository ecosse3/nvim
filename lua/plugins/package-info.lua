require('package-info').setup
{
    colors = {
        up_to_date = "#3C4048", -- Text color for up to date package virtual text
        outdated = "#fc514e", -- Text color for outdated package virtual text
    },
    icons = {
        enable = true, -- Whether to display icons
        style = {
            up_to_date = "  ", -- Icon for up to date packages
            outdated = "  ", -- Icon for outdated packages
        },
    },
    autostart = true -- Whether to autostart when `package.json` is opened
}
