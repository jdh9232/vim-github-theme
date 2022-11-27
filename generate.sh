#!/bin/bash

function get_color {
    color=$1
    keyword=$2

    hex=$(cat themes/$theme.txt | grep $keyword\: | cut -d: -f2 | cut -d' ' -f2 | cut -d\; -f1)

    if [[ ${hex^^} == RGBA* ]]; then
        rgba=${hex^^}
        rgba=${rgba#*(}
        rgba=${rgba%)*}

        _r=$(echo $rgba | cut -d, -f1)
        _g=$(echo $rgba | cut -d, -f2)
        _b=$(echo $rgba | cut -d, -f3)
        _a=$(echo $rgba | cut -d, -f4)

        _r="$(echo "(1 - $_a) * $back_r + $_a * $_r" | bc)"
        _g="$(echo "(1 - $_a) * $back_g + $_a * $_g" | bc)"
        _b="$(echo "(1 - $_a) * $back_b + $_a * $_b" | bc)"

        _r=$(printf "%.0f" "$_r")
        _g=$(printf "%.0f" "$_g")
        _b=$(printf "%.0f" "$_b")

        hex="#$(printf "%2x%2x%2x" $_r $_g $_b)"
    fi

    sed -i "s/__${color}__/${hex^^}/g" colors/github_$theme.vim

    echo ${hex^^} $1
}

function generate_theme {
    theme=$1
    mode=${theme%%_*}

    echo $mode

    if [[ $mode == "light" ]]; then
        back_r=255
        back_g=255
        back_b=255
    fi

    cp templates/github_$mode.vim colors/github_$theme.vim

    sed -i "s/__COLORNAME__/github_$theme/g" colors/github_$theme.vim

    get_color Purple          color-prettylights-syntax-entity
    get_color Blue            color-prettylights-syntax-constant
    get_color BlueDark        color-prettylights-syntax-string
    get_color Green           color-prettylights-syntax-entity-tag
    get_color Red             color-prettylights-syntax-keyword
    get_color RedDark         color-prettylights-syntax-markup-deleted-text
    get_color Orange          color-prettylights-syntax-variable
    get_color Gray            color-prettylights-syntax-comment

    get_color Front           color-codemirror-text
    get_color Back            color-codemirror-bg

    # get_color DiffDeleteText  color-prettylights-syntax-markup-deleted-text
    # get_color DiffDeleteBg    color-prettylights-syntax-markup-deleted-bg
    # get_color DiffInsertText  color-prettylights-syntax-markup-inserted-text
    # get_color DiffInsertBg    color-prettylights-syntax-markup-inserted-bg
    # get_color DiffChangedText color-prettylights-syntax-markup-changed-text
    # get_color DiffChangedBg   color-prettylights-syntax-markup-changed-bg
    # get_color DiffIgnoreText  color-prettylights-syntax-markup-ignored-text
    # get_color DiffIgnoreBg    color-prettylights-syntax-markup-ignored-bg

    get_color DiffDeleteFg color-diff-blob-deletion-num-bg
    get_color DiffDeleteBg color-diff-blob-deletion-line-bg
    get_color DiffAddFg    color-diff-blob-addition-num-bg
    get_color DiffAddBg    color-diff-blob-addition-line-bg
    get_color DiffChangeFg color-diff-blob-hunk-num-bg
    get_color DiffChangeBg color-accent-subtle

    get_color Gray0           color-scale-gray-0
    get_color Gray1           color-scale-gray-1
    get_color Gray2           color-scale-gray-2
    get_color Gray3           color-scale-gray-3
    get_color Gray4           color-scale-gray-4
    get_color Gray5           color-scale-gray-5
    get_color Gray6           color-scale-gray-6
    get_color Gray7           color-scale-gray-7
    get_color Gray8           color-scale-gray-8
    get_color Gray9           color-scale-gray-9

    get_color Red0 color-scale-red-0
    get_color Red1 color-scale-red-1
    get_color Red2 color-scale-red-2
    get_color Red3 color-scale-red-3
    get_color Red4 color-scale-red-4
    get_color Red5 color-scale-red-5
    get_color Red6 color-scale-red-6
    get_color Red7 color-scale-red-7
    get_color Red8 color-scale-red-8
    get_color Red9 color-scale-red-9

    get_color Pink0 color-scale-pink-0
    get_color Pink1 color-scale-pink-1
    get_color Pink2 color-scale-pink-2
    get_color Pink3 color-scale-pink-3
    get_color Pink4 color-scale-pink-4
    get_color Pink5 color-scale-pink-5
    get_color Pink6 color-scale-pink-6
    get_color Pink7 color-scale-pink-7
    get_color Pink8 color-scale-pink-8
    get_color Pink9 color-scale-pink-9

    get_color Blue0 color-scale-blue-0
    get_color Blue1 color-scale-blue-1
    get_color Blue2 color-scale-blue-2
    get_color Blue3 color-scale-blue-3
    get_color Blue4 color-scale-blue-4
    get_color Blue5 color-scale-blue-5
    get_color Blue6 color-scale-blue-6
    get_color Blue7 color-scale-blue-7
    get_color Blue8 color-scale-blue-8
    get_color Blue9 color-scale-blue-9

    get_color Green0 color-scale-green-0
    get_color Green1 color-scale-green-1
    get_color Green2 color-scale-green-2
    get_color Green3 color-scale-green-3
    get_color Green4 color-scale-green-4
    get_color Green5 color-scale-green-5
    get_color Green6 color-scale-green-6
    get_color Green7 color-scale-green-7
    get_color Green8 color-scale-green-8
    get_color Green9 color-scale-green-9

    get_color Yellow0 color-scale-yellow-0
    get_color Yellow1 color-scale-yellow-1
    get_color Yellow2 color-scale-yellow-2
    get_color Yellow3 color-scale-yellow-3
    get_color Yellow4 color-scale-yellow-4
    get_color Yellow5 color-scale-yellow-5
    get_color Yellow6 color-scale-yellow-6
    get_color Yellow7 color-scale-yellow-7
    get_color Yellow8 color-scale-yellow-8
    get_color Yellow9 color-scale-yellow-9

    get_color Orange0 color-scale-orange-0
    get_color Orange1 color-scale-orange-1
    get_color Orange2 color-scale-orange-2
    get_color Orange3 color-scale-orange-3
    get_color Orange4 color-scale-orange-4
    get_color Orange5 color-scale-orange-5
    get_color Orange6 color-scale-orange-6
    get_color Orange7 color-scale-orange-7
    get_color Orange8 color-scale-orange-8
    get_color Orange9 color-scale-orange-9

    get_color Purple0 color-scale-purple-0
    get_color Purple1 color-scale-purple-1
    get_color Purple2 color-scale-purple-2
    get_color Purple3 color-scale-purple-3
    get_color Purple4 color-scale-purple-4
    get_color Purple5 color-scale-purple-5
    get_color Purple6 color-scale-purple-6
    get_color Purple7 color-scale-purple-7
    get_color Purple8 color-scale-purple-8
    get_color Purple9 color-scale-purple-9

    get_color Coral0 color-scale-coral-0
    get_color Coral1 color-scale-coral-1
    get_color Coral2 color-scale-coral-2
    get_color Coral3 color-scale-coral-3
    get_color Coral4 color-scale-coral-4
    get_color Coral5 color-scale-coral-5
    get_color Coral6 color-scale-coral-6
    get_color Coral7 color-scale-coral-7
    get_color Coral8 color-scale-coral-8
    get_color Coral9 color-scale-coral-9
}

generate_theme light &
generate_theme light_high_contrast &
generate_theme light_protanopia_deuteranopia &
generate_theme light_tritanopia &
# generate_theme dark &
# generate_theme dark_high_contrast &
# generate_theme dark_protanopia_deuteranopia &
# generate_theme dark_tritanopia &
# generate_theme dark_dimmed &
sleep 10
